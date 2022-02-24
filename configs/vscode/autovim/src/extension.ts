// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
import * as vscode from 'vscode';

export function activate(context: vscode.ExtensionContext) {
  const {window, commands} = vscode
  let disposable = commands.registerCommand('autovim.cli', () => {
    (async () => {
      await vscode.commands.executeCommand('vscode.setEditorLayout', {
        orientation : 1,
        groups : [ {} ],
      });
      await commands.executeCommand('workbench.action.toggleStatusbarVisibility')
      await commands.executeCommand('workbench.action.toggleActivityBarVisibility')
      await commands.executeCommand('workbench.action.closePanel')
      await commands.executeCommand('workbench.action.terminal.createTerminalEditor')
      await commands.executeCommand('workbench.action.closeOtherEditors')
    })();
  });

  context.subscriptions.push(disposable);
}

// this method is called when your extension is deactivated
export function deactivate() {}
