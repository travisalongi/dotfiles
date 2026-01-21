return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local fzf = require("fzf-lua")

      fzf.setup({
        files = {
          fd_opts = "--hidden --no-ignore",
          actions = {
            -- send selected files to qf and open the list
            ["ctrl-q"] = function(selected)
              fzf.actions.file_sel_to_qf(selected)
              vim.cmd("copen")
            end,
          },
        },

        buffers = {
          actions = {
            -- delete buffer and reload list
            ["ctrl-d"] = { fn = fzf.actions.buf_del, reload = true },
            -- optional: send selected buffers to qf
            ["ctrl-q"] = function(selected)
              fzf.actions.buf_sel_to_qf(selected)
              vim.cmd("copen")
            end,
          },
        },

        oldfiles = { include_current_session = true },

        previewers = {
          bat = {
            cmd  = "bat",
            args = "--color=always --style=numbers,changes",
          },
        },

        keymap = {
          fzf = {
            -- make Ctrl-Q “select-all + accept” so it triggers our action above
            ["ctrl-q"] = "select-all+accept",
            -- (optional) nicer multi-select:
            ["tab"] = "toggle+down",
            ["shift-tab"] = "toggle+up",
          },
        },
      })

      fzf.register_ui_select()

      vim.keymap.set("n", "<leader>te", ":FzfLua<CR>")
      vim.keymap.set("n", "<leader>fz", ":FzfLua<CR>")
    end,
  }
}

