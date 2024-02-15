local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft <CR>", "window left"},
    ["<C-l>"] = { "<cmd> TmuxNavigateRight <CR>", "window right"},
    ["<C-j>"] = { "<cmd> TmuxNavigateDown <CR>", "window down"},
    ["<C-k>"] = { "<cmd> TmuxNavigateUp <CR>", "window up"},
  }
}

local copilot_opts = { noremap = true, silent = true, replace_keycodes = true, nowait = true }

M.copilot = {
  i = {
    ["<C-l>"] = {
      function()
        vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
      end,
      "Copilot Accept",
      copilot_opts
    },
    ["<M-l>"] = {
      "<Plug>(copilot-accept-word)",
      "Copilot Accept Word",
      copilot_opts
    },
    ["<M-j>"] = {
      "<Plug>(copilot-accept-line)",
      "Copilot Accept Line",
      copilot_opts
    },
    ["<M-p>"] = {
      "<cmd> Copilot panel <CR>",
      "Copilot Panel",
      copilot_opts
    },
  }
}

return M
