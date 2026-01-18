import type { Plugin } from "@opencode-ai/plugin"

/**
 * OpenCode plugin to integrate with cy terminal multiplexer.
 * Sends status updates to cy panes running OpenCode.
 *
 * Mirrors the functionality of bin/cc-notify for Claude Code.
 */
export const CyNotifyPlugin: Plugin = async ({ $, directory }) => {
  // Helper to run cy commands, silently ignoring failures
  const cyExec = async (janet: string) => {
    try {
      await $`cy exec -c '${janet}'`.quiet()
    } catch {
      // cy might not be running, ignore errors
    }
  }

  // Update the git branch parameter
  const updateBranch = async () => {
    try {
      const result = await $`git rev-parse --abbrev-ref HEAD 2>/dev/null`.text()
      const branch = result.trim()
      if (branch) {
        const escapedBranch = branch.replace(/'/g, "''")
        await cyExec(`(param/set (pane/current) :agent-branch "${escapedBranch}")`)
      }
    } catch {
      // Not in a git repo, ignore
    }
  }

  // Set status on the current cy pane
  const setStatus = async (status: string | null) => {
    if (status === null) {
      await cyExec(`(param/set (pane/current) :agent-status nil)`)
    } else {
      await cyExec(`(param/set (pane/current) :agent-status "${status}")`)
    }
  }

  // Set the prompt parameter
  const setPrompt = async (prompt: string | null) => {
    if (prompt === null) {
      await cyExec(`(param/set (pane/current) :agent-prompt nil)`)
    } else {
      const escapedPrompt = prompt.replace(/'/g, "''")
      await cyExec(`(param/set (pane/current) :agent-prompt "${escapedPrompt}")`)
    }
  }

  // Send a toast notification
  const sendToast = async (message: string) => {
    try {
      const panePath = (await $`cy exec -c "(yield (tree/path (pane/current)))"`.text()).trim()
      const fullMessage = `${panePath}: ${message}`
      await cyExec(`(msg/toast :info "${fullMessage.replace(/"/g, '\\"')}")`)
      // Also send OS notification
      await $`osascript -e ${"display notification \"" + fullMessage + "\" with title \"OpenCode\""}`
    } catch {
      // Ignore notification errors
    }
  }

  // Track if we're currently working
  let isWorking = false

  // Initialize: set status to idle and update branch
  await updateBranch()
  await setStatus("idle")

  return {
    // When user submits a prompt, store it and update branch
    "chat.message": async (input, output) => {
      await updateBranch()
      // Extract the text from the message parts
      const textParts = output.parts.filter((p) => p.type === "text")
      const promptText = textParts.map((p) => (p as any).text || "").join("")
      if (promptText) {
        await setPrompt(promptText)
      }
    },

    // Before tool execution: set status to working
    "tool.execute.before": async (_input, _output) => {
      if (!isWorking) {
        isWorking = true
        await setStatus("working")
      }
    },

    // After tool execution: status will be updated by event handler
    "tool.execute.after": async (_input, _output) => {
      // Keep working status - will be cleared when session becomes idle
    },

    // Permission hook: set status to permission when asking
    "permission.ask": async (_input, output) => {
      if (output.status === "ask") {
        await setStatus("permission")
      }
    },

    // Event handler for session events
    event: async ({ event }) => {
      switch (event.type) {
        case "session.idle":
          isWorking = false
          await setStatus("idle")
          await sendToast("OpenCode finished working.")
          break

        case "permission.updated":
          // When permission dialog appears
          if ((event as any).properties?.status === "pending") {
            await setStatus("permission")
            const message = (event as any).properties?.message || "OpenCode needs your permission"
            await sendToast(message)
          }
          break

        case "permission.replied":
          // After permission is granted/denied, go back to working or idle
          if (isWorking) {
            await setStatus("working")
          } else {
            await setStatus("idle")
          }
          break

        case "session.error":
          isWorking = false
          await setStatus("idle")
          await sendToast("OpenCode encountered an error.")
          break
      }
    },
  }
}

// Also export as default for flexibility
export default CyNotifyPlugin
