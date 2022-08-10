# telescope-arglist.nvim
<!-- TODO: Add GIF showing functionality? -->

A [telescope](https://github.com/nvim-telescope/telescope.nvim) picker for the argument list (`:h arglist`).


## Getting Started

[Neovim (v0.7.0)](https://github.com/neovim/neovim/releases/tag/v0.7.0) or the latest [Neovim (Nightly)](https://github.com/neovim/neovim/releases/tag/nightly) is required for
`telescope-arglist.nvim` to work.


### Installation

You can install this extension with your favourite package manager. As an
example, for [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'sam4llis/telescope-arglist.nvim'
```


### Required Dependencies

* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) is required.

* [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) is required.


### Optional Dependencies

* [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) is used for displaying file icons.


## Usage
<!-- TODO: Check that these mappings actually work inside my configuration. -->

To set up the extension, add the following to your Neovim configuration:

```lua
require('telescope').load_extension('arglist')
```

Try the command `:Telescope arglist` to see if `telescope-arglist.nvim` is
installed correctly. You can use the `arglist` extension via key commands by
adding the following command to your Neovim configuration:

```lua
-- Navigate the argument list using Telescope command-line sugar.
vim.api.nvim_set_keymap('n', '<leader>fa', ':Telescope arglist<CR>', {})

-- Alternatively, navigate the argument list using a Lua function.
vim.api.nvim_set_keymap('n', '<leader>fa', ':lua require("telescope-arglist").arglist()<CR>', {})
```


<!-- ## Default Mappings -->
<!-- TODO: Implement some mappings like <C-a> to toggle files in `Telescope find_files` to the argument list -->
