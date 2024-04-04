vim.filetype.add({
  extension = {
    tf = 'terraform',
    yaml = function(path, _)
      if string.match(path, '%.playbook.yaml') then
        return 'yaml.ansible'
      end
      return 'yaml'
    end,
  },
})
