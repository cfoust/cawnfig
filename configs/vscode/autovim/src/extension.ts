// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
import * as vscode from 'vscode';

export function activate(context: vscode.ExtensionContext) {
  const {window, commands: { executeCommand }} = vscode;
  (async () => {
    await executeCommand('vscode.setEditorLayout', {
      orientation : 1,
      groups : [ {} ],
    });
    await executeCommand('workbench.action.toggleStatusbarVisibility')
    await executeCommand('workbench.action.toggleActivityBarVisibility')
    await executeCommand('workbench.action.closePanel')
    await executeCommand('workbench.action.terminal.createTerminalEditor')
    await executeCommand('workbench.action.closeOtherEditors')
  })();
}

// this method is called when your extension is deactivated
export function deactivate() {}
