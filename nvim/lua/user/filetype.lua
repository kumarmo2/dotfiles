vim.filetype.add({
  extension = {
    tf = 'terraform',
    yaml = function(path, _)
      if string.match(path, '%.playbook.yaml') then
        return 'yaml.ansible'
      end
      if string.find(path, 'docker-compose', 1, true) then -- to not treat '-' in 'docker-compose' as special interpretation,
        -- fourth parameter is passed as true
        return 'yaml.docker-compose'
      end
      return 'yaml'
    end,
    conf = 'ini',
  },
})
