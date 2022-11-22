local vim = vim;



toggle_cmd_height = function()
  if vim.o.cmdheight > 0 then
    vim.o.cmdheight = 0;
    return;
  end
  vim.o.cmdheight = 1;


end
