import * as vscode from 'vscode';
import * as path from 'path';

export function activate(context: vscode.ExtensionContext) {
    const api_path = context.asAbsolutePath(path.join('api'));
    const config = vscode.workspace.getConfiguration('Lua');
    const library = config.get<string[]>('workspace.library') || [];
    let update_needed = false;
    let new_library = [...library];
    const norm_path = api_path.replace(/\\/g, '/');

    if (!new_library.some(p => p.replace(/\\/g, '/') === norm_path)) {
        new_library.push(norm_path);
        update_needed = true;
    }

    if (update_needed) {
        config.update('workspace.library', new_library, vscode.ConfigurationTarget.Global).then(() => {
            vscode.window.showInformationMessage('Axe Prime Lua API loaded.');
        });
    }
}

export function deactivate() { }
