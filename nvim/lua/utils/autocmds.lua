local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
  clear = true,
})

-- set different indent to lua file
vim.api.nvim_create_autocmd("FileType", {
  group = myAutoGroup,
  pattern = "lua",
  command = "setlocal shiftwidth=2 tabstop=2"
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = myAutoGroup,
  pattern = {"*"},
  command = [[%s/\s\+$//e]],
})

-- open_on_setup
-- automatically open the tree when running setup if startup buffer is a directory
-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
vim.api.nvim_create_autocmd("VimEnter", {
  group = myAutoGroup,
  callback = function(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
      return
    end

    -- create a new, empty buffer
    vim.cmd.enew()

    -- wipe the directory buffer
    vim.cmd.bw(data.buf)

    -- change to the directory
    vim.cmd.cd(data.file)

    -- open the tree
    require("nvim-tree.api").tree.open()
  end
})

vim.api.nvim_create_autocmd("QuitPre", {
  group = myAutoGroup,
  callback = function() vim.cmd("NvimTreeClose") end,
})
