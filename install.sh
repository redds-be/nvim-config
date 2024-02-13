#!/usr/bin/env bash

nvimConf=$HOME/.config/nvim/

if [ -d "$nvimConf" ]; then
    echo "WARNING: Any existing neovim configuration in $HOME/.config/nvim will be removed!"
    read -r -p "Do you want to backup your existing neovim configuration? [Y/n] " backChoice
    if [[ "$backChoice" == "n" || "$backChoice" == "N" ]]; then
        rm -rf "$HOME"/.config/nvim
        echo "Your existing neovim config has been deleted!"
        exit
    else
        saveDir=$HOME/.config/nvim-back/
        mv "$nvimConf" "$saveDir"
        echo "Your existing neovim config has been saved to $saveDir"
    fi
fi

echo -e "Do you want to use light or dark mode?\n[1] Light,\n[2] Dark"
read -r -p "(Default is [1])[1-2] " themeChoice

if [ "$themeChoice" = "2" ]; then
    sed -i 's/require("catppuccin").setup({ flavour = "latte" }) -- Light mode/-- require("catppuccin").setup({ flavour = "latte" }) -- Light mode/g' lua/plugins/catppuccin.lua
    sed -i 's/-- require("catppuccin").setup() -- Dark mode/require("catppuccin").setup() -- Dark mode/g' lua/plugins/catppuccin.lua
    sed -i 's/theme = "ayu_light", -- Light mode/-- theme = "ayu_light", -- Light mode/g' lua/plugins/lualine.lua
    sed -i 's/-- theme = "dracula", -- Dark mode/theme = "dracula", -- Dark mode/g' lua/plugins/lualine.lua
fi

mkdir -p "$nvimConf"
cp -r lua/ init.lua "$nvimConf"

echo -e "Done!"

echo "Ripgrep and fzf are optional dependencies."
echo "The current configuration supports LSP for lua, python, go and rust, bash, powershell, they will be configured by default."
echo -e "The lsp in questions are lua_ls, pylsp, gopls, rust_analyzer, bashls, powershell_es. You need them in your path before using them."
echo -e "The current configuration supports formatting for Lua, Python, Go, Rust, Bash.\nTo use these, install them in your path and use :Meson to configure them for neovim.\nLua: stylua\nPython: black, isort\nGo: gofumpt, golines, goimports_reviser\nRust: rustfmt\nBash: shellharden"
echo -e "The current configuration supports linting for Go, Python and Bash.\nTo use these, install them in your path and use :Meson to configure them for neovim.\nGo: golangci-lint\nPython: pylint\nBash: shellcheck"
echo -e "The current configuration supports DAP for Go using delve."

echo -e "Apart from the default of neovim and its plugins, notable keymaps are:\ng+g to open lazygit\nCtrl+c to open neotree\nc+f to format the code\ng+h to see a hunk of the modifications (Git)\nCtrl+p to search for a file (inside working directory)\nCtrl+f to fuzzyfind in content the files (inside working directory)"
