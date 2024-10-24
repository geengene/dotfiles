-- Only load settings when inside VSCode
if vim.g.vscode then
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
      error("Error cloning lazy.nvim:\n" .. out)
    end
  end ---@diagnostic disable-next-line: undefined-field
  vim.opt.rtp:prepend(lazypath)

  require("lazy").setup({
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      cond = not not vim.g.vscode,
      config = function()
        require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
        })
      end,
    },
    {
      "vscode-neovim/vscode-multi-cursor.nvim",
      event = "VeryLazy",
      cond = not not vim.g.vscode,
      opts = {},
    },
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      vscode = true,
      ---@type Flash.Config
      opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
    },
  })

  function _G.openWhichKeyInVisualMode()
    -- Restore the visual selection
    vim.cmd("normal! gv")

    -- Get the current visual mode
    local visual_mode = vim.fn.visualmode()

    if visual_mode == "V" then
      -- Visual line mode: Get the start and end lines of the selection
      local start_line = vim.fn.line("v")
      local end_line = vim.fn.line(".")

      -- Notify VSCode about the range
      vim.fn.VSCodeNotifyRange("whichkey.show", start_line, end_line, 1)
    else
      -- Visual character/block mode: Get the positions of the selection
      local start_pos = vim.fn.getpos("v")
      local end_pos = vim.fn.getpos(".")

      -- Notify VSCode about the range with positions
      vim.fn.VSCodeNotifyRangePos("whichkey.show", start_pos[2], end_pos[2], start_pos[3], end_pos[3], 1)
    end
  end

  -- Better navigation mappings
  vim.api.nvim_set_keymap("n", "<C-j>", ":call VSCodeNotify('workbench.action.navigateDown')<CR>", { silent = true })
  vim.api.nvim_set_keymap("x", "<C-j>", ":call VSCodeNotify('workbench.action.navigateDown')<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-k>", ":call VSCodeNotify('workbench.action.navigateUp')<CR>", { silent = true })
  vim.api.nvim_set_keymap("x", "<C-k>", ":call VSCodeNotify('workbench.action.navigateUp')<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-h>", ":call VSCodeNotify('workbench.action.navigateLeft')<CR>", { silent = true })
  vim.api.nvim_set_keymap("x", "<C-h>", ":call VSCodeNotify('workbench.action.navigateLeft')<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-l>", ":call VSCodeNotify('workbench.action.navigateRight')<CR>", { silent = true })
  vim.api.nvim_set_keymap("x", "<C-l>", ":call VSCodeNotify('workbench.action.navigateRight')<CR>", { silent = true })
  vim.api.nvim_set_keymap(
    "n",
    "<<",
    ":call VSCodeNotify('workbench.action.moveEditorLeftInGroup')<CR>",
    { silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    ">>",
    ":call VSCodeNotify('workbench.action.moveEditorRightInGroup')<CR>",
    { silent = true }
  )

  --Commenting in VSCode
  vim.api.nvim_set_keymap("x", "gc", "<Plug>VSCodeCommentary", { noremap = false, silent = true })
  vim.api.nvim_set_keymap("n", "gc", "<Plug>VSCodeCommentary", { noremap = false, silent = true })
  vim.api.nvim_set_keymap("o", "gc", "<Plug>VSCodeCommentary", { noremap = false, silent = true })
  vim.api.nvim_set_keymap("n", "gcc", "<Plug>VSCodeCommentaryLine", { noremap = false, silent = true })

  -- Keybindings for whichkey and commands
  vim.api.nvim_set_keymap("n", "<Space>", ":call VSCodeNotify('whichkey.show')<CR>", { silent = true })
  vim.api.nvim_set_keymap("v", "<Space>", ":lua openWhichKeyInVisualMode()<CR>", { silent = true })

  -- Folding key mappings
  vim.api.nvim_set_keymap("n", "za", ":call VSCodeNotify('editor.toggleFold')<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "zc", ":call VSCodeNotify('editor.foldAll')<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "zo", ":call VSCodeNotify('editor.unfoldAll')<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "zp", ":call VSCodeNotify('editor.gotoParentFold')<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "zj", ":call VSCodeNotify('editor.gotoNextFold')<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "zk", ":call VSCodeNotify('editor.gotoPreviousFold')<CR>", { silent = true })

  -- Smooth scrolling
  vim.api.nvim_set_keymap("n", "j", "gj", { noremap = false, silent = true })
  vim.api.nvim_set_keymap("n", "k", "gk", { noremap = false, silent = true })
  vim.api.nvim_set_keymap("v", "j", "gj", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("v", "k", "gk", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "L", "g$", { silent = true })
  vim.api.nvim_set_keymap("n", "H", "g0", { silent = true }) --somehow in normal mode g0 works better
  vim.api.nvim_set_keymap("v", "L", "g$", { silent = true })
  vim.api.nvim_set_keymap("v", "H", "g^", { silent = true })
  vim.api.nvim_set_keymap("o", "L", "g$", { silent = true })
  vim.api.nvim_set_keymap("o", "H", "g^", { silent = true })

  -- Go to references
  vim.api.nvim_set_keymap("n", "gr", ":call VSCodeNotify('editor.action.goToReferences')<CR>", { silent = true })

  -- Escaping visual mode
  vim.api.nvim_set_keymap("v", "q", "<Esc>", { noremap = true, silent = true })

  -- Simulate TAB behavior
  vim.api.nvim_set_keymap("n", "<Tab>", ":Tabnext<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<S-Tab>", ":Tabprev<CR>", { noremap = true, silent = true })

  -- miscellaneous
  vim.api.nvim_set_keymap("n", "<C-a>", "gg<S-v>G", { noremap = true, silent = true })
  vim.opt.clipboard = "unnamedplus"
else
  -- bootstrap lazy.nvim, LazyVim and your plugins
  require("config.lazy")
  vim.opt.shell = "zsh"
end
