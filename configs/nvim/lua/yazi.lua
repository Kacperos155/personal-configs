local M = {}

local function check_executable()
  if vim.fn.executable('yazi') == 1 then
    return true
  else
    vim.notify(
      "[Yazi] Executable was not found in the PATH!",
      vim.log.levels.ERROR
    )
    return false
  end
end

local function get_files(chooser_file)
  assert(vim.fn.filereadable(chooser_file) == 1)
  local files = {}

  for _, line in ipairs(vim.fn.readfile(chooser_file)) do
    if line ~= '' then
      table.insert(files, line)
    end
  end

  return files
end

local function open_files(files)
  if (files == nil) or (#files == 0) then
    vim.notify("[Yazi] No file was selected!", vim.log.levels.INFO)
    return false
  end

  for index, raw_file_path in ipairs(files) do
    local file_path = vim.fn.fnameescape(raw_file_path)

    if index == 1 then
      vim.cmd.edit(file_path)
    else
      vim.cmd.badd(file_path)
    end
  end

  return true
end

function M.pick_files()
  if not check_executable() then
    return
  end

  local origin_window = vim.api.nvim_get_current_win()
  local origin_buffer = vim.api.nvim_win_get_buf(origin_window)

  -- Create and select a temporary scratch-buffer for terminal.
  local terminal_buffer = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_win_set_buf(origin_window, terminal_buffer)
  vim.wo[origin_window].winfixbuf = true

  -- Create a temporary file for Yazi output.
  local chooser_file = vim.fn.tempname()

  vim.fn.jobstart(
    { 'yazi', '--chooser-file', chooser_file },
    {
      term = true,
      on_exit = function()
        -- Parse and clean up the result of running Yazi.
        vim.schedule(function()
          local files = {}

          -- Check if the chooser file exists.
          if vim.fn.filereadable(chooser_file) == 1 then
            files = get_files(chooser_file)

            if vim.fn.delete(chooser_file) ~= 0 then
              vim.notify(
                "[Yazi] Temporary file deletion failed: '" .. chooser_file .. "'!",
                vim.log.levels.ERROR
              )
            end
          end

          -- Open files in the original window.
          if vim.api.nvim_win_is_valid(origin_window) then
            vim.api.nvim_win_call(origin_window, function()
              vim.wo[origin_window].winfixbuf = false

              if (not open_files(files)) and (vim.api.nvim_buf_is_valid(origin_buffer)) then
                vim.api.nvim_win_set_buf(origin_window, origin_buffer)
              end
            end)
          end

          -- Remove the temporary buffer without throwing errors.
          pcall(vim.api.nvim_buf_delete, terminal_buffer, { force = true })
        end)
      end
    })

  -- Change mode to 'terminal'.
  vim.cmd.startinsert()
end

return M
