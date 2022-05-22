local vim = vim;

vim.g.neoformat_try_node_exe = 1;

vim.api.nvim_exec(
[[
    augroup fmt
        autocmd!
        autocmd BufWritePre *.js undojoin | Neoformat
    augroup END

]], true);
