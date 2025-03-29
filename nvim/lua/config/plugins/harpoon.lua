return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup({
      settings = {
        save_on_toggle = true,
      },

      default = {
        select_with_nil = true,
      }
    })
    local last_two_files = { nil, nil }

    -- Create an autogroup for our autocommands
    local augroup = vim.api.nvim_create_augroup("Harpoon", { clear = true })

    -- Track last two opened files
    vim.api.nvim_create_autocmd("BufEnter", {
      group = augroup,
      callback = function()
        local current_file = vim.api.nvim_buf_get_name(0)
        if current_file ~= "" and (last_two_files[1] == nil or current_file ~= last_two_files[1]) then
          last_two_files[2] = last_two_files[1]
          last_two_files[1] = current_file
        end
      end
    })

    --Add files on harpoon list when opening them
    --
    -- vim.api.nvim_create_autocmd("BufRead", {
    --   group = augroup,
    --   callback = function()
    --     local current_file = vim.api.nvim_buf_get_name(0)
    --     -- Only add if it's a real file and readable
    --     if current_file and vim.fn.filereadable(current_file) == 1 then
    --       -- Convert to relative path
    --       local relative_path = vim.fn.fnamemodify(current_file, ":~:.")
    --
    --       -- Check if file is already in harpoon list
    --       local list = harpoon:list()
    --       local exists = false
    --       for _, item in ipairs(list) do
    --         if item.value == relative_path then
    --           exists = true
    --           break
    --         end
    --       end
    --
    --       -- Only add if it doesn't exist
    --       if not exists then
    --         list:add({
    --           value = relative_path,
    --           context = {
    --             opened_at = os.time(),
    --           }
    --         })
    --       end
    --     end
    --   end
    -- })

    -- Your existing keymaps
    vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end)

    -- Toggle between last two files
    vim.keymap.set("n", "<leader><Tab>", function()
      if last_two_files[2] then
        -- Swap the files
        last_two_files[1], last_two_files[2] = last_two_files[2], last_two_files[1]
        -- Open the file
        vim.cmd('edit ' .. vim.fn.fnameescape(last_two_files[1]))
      end
    end)
  end
}
