-- Open dashboard automatically when Neovim starts without a file
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Check if the argument list is empty and the buffer list is also empty
    if vim.fn.argc() == 0 and vim.fn.line2byte('$') == -1 then
      -- Replace with the command to open snacks.dashboard
      vim.cmd(":lua Snacks.dashboard()") -- Replace with actual command
    end
  end,
})
