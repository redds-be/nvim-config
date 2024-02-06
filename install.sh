#!/usr/bin/env bash

nvimConf=$HOME/.config/nvim/

if [ -d $nvimConf ]; then
    echo "WARNING: Any existing neovim configuration in $HOME/.config/nvim will be removed!"
    read -p "Do you want to backup your existing neovim configuration? [Y/n] " backChoice
    if [[ "$backChoice" == "n" || "$backChoice" == "N" ]]; then
        rm -rf $HOME/.config/nvim
        echo "Your existing neovim config has been deleted!"
        exit
    else
        saveDir=$HOME/.config/nvim-back/
        mv $nvimConf $saveDir
        echo "Your existing neovim config has been saved to $saveDir"
    fi
fi

echo -e "Do you want to use light or dark mode?\n[1] Light,\n[2] Dark"
read -p "(Default is [1])[1-2] " themeChoice

if [ "$themeChoice" = "2" ]; then
    sed -i 's/require("catppuccin").setup({ flavour = "latte" }) -- Light mode/-- require("catppuccin").setup({ flavour = "latte" }) -- Light mode/g' lua/plugins/catppuccin.lua
    sed -i 's/-- require("catppuccin").setup() -- Dark mode/require("catppuccin").setup() -- Dark mode/g' lua/plugins/catppuccin.lua
    sed -i 's/theme = "ayu_light", -- Light mode/-- theme = "ayu_light", -- Light mode/g' lua/plugins/lualine.lua
    sed -i 's/-- theme = "dracula", -- Dark mode/theme = "dracula", -- Dark mode/g' lua/plugins/lualine.lua
fi

mkdir -p $nvimConf
cp -r lua/ init.lua $nvimConf

echo -e "Done!"

echo "The current configuration supports LSP for lua, python, go and rust, they will be installed by default."
echo -e "Mason might throw an error if go is not installed (for the go lsp), If you don't intend on programming in go, you can either ignore the error or remove the 'gopls' string from $nvimConf/lua/plugins/lsp.lua on line 15."
echo -e "The current configuration supports formatting for Lua, Python, Go, Rust.\nTo use these, either install them in your path or use :Meson to install them.\nLua: stylua\nPython: black, isort\nGo: gofumpt, golines, goimports_reviser\nRust: rustfmt (Deprecated with Mason, just install rustfmt normally)"
echo -e "The current configuration supports linting for Go and Python.\nTo use these, either install them in your path or use :Meson to install them.\nGo: golangci-lint\nPython: pylint"
echo -e "The current configuration supports DAP for Go using delve."

echo -e "Apart from the default of neovim and its plugins, notable keymaps are:\ng+g to open lazygit\nCtrl+c to open neotree\nc+f to format the code\ng+h to see a hunk of the modifications (Git)\nCtrl+p to search for a file (inside working directory)\nCtrl+f to fuzzyfind in content the files (inside working directory)"
