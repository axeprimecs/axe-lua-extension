<div align="center">
  <h1>Axe Prime Language Server</h1>
  <p><strong>A highly advanced Lua language server that supports the Axe Prime API, powered by zero-compromise type definitions.</strong></p>

  [![Version](https://img.shields.io/badge/Version-1.0.0-pink.svg?style=for-the-badge&logo=visual-studio-code)](https://github.com/axeprimecs/axe-lua-extension)
  [![License](https://img.shields.io/badge/License-MIT-orange.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
</div>

<hr>

## ✨ Showcase

Experience unparalleled autocompletion, real-time method signatures, and instant snippet injection tailored specifically for **Axe Prime**.

### ⚡ Lightning-Fast Autocompletion
Never guess another callback name or parameter. The extension knows the entire engine.
```lua
callbacks.register("paint", function()
    -- Full IntelliSense for engine, render, entities, ui, and more!
    local local_pawn = entities.get_local_pawn()
    if not local_pawn then return end
    
    render.text(10, 10, {255, 0, 0, 255}, "Axe Prime is injected.")
end)
```

### 🧩 Rapid UI Prototyping Snippets
Build your cheat's visual interface in seconds using built-in UI snippets. Type `ui_` and hit Tab.
```lua
-- Standard Checkbox
local bunnyhop_toggle = ui.check_box("Misc", "Movement", "Enable Bunnyhop")

-- Advanced Multi-Combo
local esp_flags = ui.multi_combo("Visuals", "ESP", "Flags", {"Armor", "Weapon", "Distance"})

local function on_create_move(cmd)
    if bunnyhop_toggle:get_value() then
        -- Execute hop logic
    end
end
callbacks.register("create_move", on_create_move)
```

## 🛠 Features

- **Context-Aware Hovers:** Hover over any function (like `render.circle_filled`) to instantly read its parameter requirements and return values.
- **Zero-Config Setup:** Just open a `.lua` file, and the Axe Prime environment is automatically loaded into your workspace.
- **Boilerplate Reduction:** Type `forp`, `fori`, or `if` to generate complex Lua structures instantly.

## 📥 Installation

1. Install the official [Lua Language Server](https://marketplace.visualstudio.com/items?itemName=sumneko.lua) by sumneko.
2. Install **Axe Prime Language Server**.
3. Open any `.lua` file in your workspace. The API will automatically bind to your session.

## 🐛 Issues & Support

Found a missing API definition? Want to suggest a new snippet? 
Reach out on Discord or [Open an Issue](https://github.com/axeprimecs/axe-lua-extension/issues).
