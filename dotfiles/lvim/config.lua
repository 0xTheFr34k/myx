-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6 Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Map Shift + l to cycle to the next buffer
vim.api.nvim_set_keymap('n', '<S-l>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })

-- Map Shift + h to cycle to the previous buffer
vim.api.nvim_set_keymap('n', '<S-h>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

-- Map Ctrl + S to save the file
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<S-f>', ":%!alejandra -qq<CR>", { noremap = true, silent = true })

vim.o.relativenumber = true

vim.api.nvim_set_keymap('n', '<CR>', '<cmd>FineCmdline<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', 'f', '<cmd>SearchBoxMatchAll show_matches=true clear_matches=false modifier=":\\c" <CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<S-r>', '<cmd>SearchBoxReplace show_matches=true clear_matches=false modifier=":\\c" <CR>', {noremap = true})

-- vim.keymap.set('n', '<leader>', ':SearchBoxIncSearch<CR>')

-- Copilot plugins are defined below:
lvim.plugins = {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup({
        suggestion = { enabled = false },
        panel = { enabled = false }
      })
    end
  },
  {
    "MunifTanjim/nui.nvim"
  },
  {
    "VonHeikemen/fine-cmdline.nvim"
  },
  {
    'MunifTanjim/nui.nvim'
  },
  {
-- https://github.com/VonHeikemen/searchbox.nvim
    'VonHeikemen/searchbox.nvim'
  }
}

-- Below config is required to prevent copilot overriding Tab with a suggestion
-- when you're just trying to indent!
local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end
local on_tab = vim.schedule_wrap(function(fallback)
  local cmp = require("cmp")
  if cmp.visible() and has_words_before() then
    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
  else
    fallback()
  end
end)
lvim.builtin.cmp.mapping["<Tab>"] = on_tab
