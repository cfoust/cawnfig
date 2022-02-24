// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
import * as vscode from 'vscode';

export function activate(context: vscode.ExtensionContext) {
  const {window, commands} = vscode
  let disposable = commands.registerCommand('autovim.cli', () => {
    window.showInformationMessage('Launching focus mode');
    (async () => {
      await commands.executeCommand('workbench.action.editorLayoutSingle')
      await commands.executeCommand('workbench.action.toggleMaximizedPanel')
      await commands.executeCommand('workbench.action.terminal.createTerminalEditor')
      await commands.executeCommand('workbench.action.toggleStatusbarVisibility')
      await commands.executeCommand('workbench.action.toggleActivityBarVisibility')
    })();
  });

  context.subscriptions.push(disposable);
}

// this method is called when your extension is deactivated
export function deactivate() {}
