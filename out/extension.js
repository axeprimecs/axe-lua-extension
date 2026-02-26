"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.activate = activate;
exports.deactivate = deactivate;
const vscode = require("vscode");
const path = require("path");
function activate(context) {
    const api_path = context.asAbsolutePath(path.join('api'));
    const config = vscode.workspace.getConfiguration('Lua');
    const library = config.get('workspace.library') || [];
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
function deactivate() { }
//# sourceMappingURL=extension.js.map