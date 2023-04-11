-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

require('icons')
local status, lualine = pcall(require, "lualine")
if not status then
    vim.notify("没有找到 lualine")
    return
end

-- stylua: ignore
local colors = {
    blue   = '#80a0ff',
    cyan   = '#79dac8',
    black  = '#080808',
    white  = '#c6c6c6',
    red    = '#ff5189',
    violet = '#d183e8',
    grey   = '#303030',
}

local bubbles_theme = {
    normal = {
        a = { fg = colors.black, bg = colors.violet },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.black, bg = colors.black },
    },
    insert = { a = { fg = colors.black, bg = colors.blue } },
    visual = { a = { fg = colors.black, bg = colors.cyan } },
    replace = { a = { fg = colors.black, bg = colors.red } },
    inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.black, bg = colors.black },
    },
}

lualine.setup {
    options = {
        theme = bubbles_theme,
        component_separators = '|',
        -- section_separators = { left = '', right = '' },
        section_separators = {}
    },
    sections = {
        lualine_a = {
            {
                'mode',
                icon = '󰌪 ',
                -- separator = { left = '' },
                right_padding = 2
            }
        },
        lualine_b = {
            {
                'diagnostics',
                -- Table of diagnostic sources, available sources are:
                --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
                -- or a function that returns a table as such:
                --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
                sources = { 'coc' },
                -- Displays diagnostics for the defined severity types
                sections = { 'error', 'warn', 'info', 'hint' },
                -- diagnostics_color = {
                --     -- Same values as the general color option can be used here.
                --     error = 'DiagnosticError', -- Changes diagnostics' error color.
                --     warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                --     info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                --     hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
                -- },
                symbols = {
                    error = Icons.Error,
                    warn = Icons.Warning,
                    info = Icons.Information,
                    hint = Icons.Hint
                },
                colored = true,           -- Displays diagnostics status in color if set to true.
                update_in_insert = false, -- Update diagnostics in insert mode.
                always_visible = false,   -- Show diagnostics even if there are none.
            },
            {
                'filename',
                file_status = true,     -- Displays file status (readonly status, modified status)
                newfile_status = false, -- Display new file status (new file means no write after created)
                path = 0,               -- 0: Just the filename
                -- 1: Relative path
                -- 2: Absolute path
                -- 3: Absolute path, with tilde as the home directory

                shorting_target = 40, -- Shortens path to leave 40 spaces in the window
                -- for other components. (terrible name, any suggestions?)
                symbols = {
                    modified = '*', -- Text to show when the file is modified.
                    readonly = '!', -- Text to show when the file is non-modifiable or readonly.
                    unnamed = '?',  -- Text to show for unnamed buffers.
                    newfile = '+',  -- Text to show for newly created file before first write
                }
            },
            -- { navic.get_location, cond = navic.is_available },
            { 'branch', icon = '' },

            -- tabs
            -- {
            --   'tabs',
            --   max_length = vim.o.columns / 3, -- Maximum width of tabs component.
            --   -- Note:
            --   -- It can also be a function that returns
            --   -- the value of `max_length` dynamically.
            --   mode = 0, -- 0: Shows tab_nr
            --   -- 1: Shows tab_name
            --   -- 2: Shows tab_nr + tab_name

            --   -- tabs_color = {
            --   --   -- Same values as the general color option can be used here.
            --   --   active = 'lualine_{section}_normal', -- Color for active tab.
            --   --   inactive = 'lualine_{section}_inactive', -- Color for inactive tab.
            --   -- },

            --   fmt = function(name, context)
            --     -- Show + if buffer is modified in tab
            --     local buflist = vim.fn.tabpagebuflist(context.tabnr)
            --     local winnr = vim.fn.tabpagewinnr(context.tabnr)
            --     local bufnr = buflist[winnr]
            --     local mod = vim.fn.getbufvar(bufnr, '&mod')

            --     return name .. (mod == 1 and ' +' or '')
            --   end
            -- }

            -- windows
            -- {
            --   'windows',
            --   show_filename_only = true, -- Shows shortened relative path when set to false.
            --   show_modified_status = true, -- Shows indicator when the window is modified.

            --   mode = 0, -- 0: Shows window name
            --   -- 1: Shows window index
            --   -- 2: Shows window name + window index

            --   max_length = vim.o.columns * 2 / 3, -- Maximum width of windows component,
            --   -- it can also be a function that returns
            --   -- the value of `max_length` dynamically.
            --   filetype_names = {
            --     TelescopePrompt = 'Telescope',
            --     dashboard = 'Dashboard',
            --     packer = 'Packer',
            --     fzf = 'FZF',
            --     alpha = 'Alpha'
            --   }, -- Shows specific window name for that filetype ( { `filetype` = `window_name`, ... } )

            --   disabled_buftypes = { 'quickfix', 'prompt' }, -- Hide a window if its buffer's type is disabled

            --   -- windows_color = {
            --   --   -- Same values as the general color option can be used here.
            --   --   active = 'lualine_{section}_normal', -- Color for active window.
            --   --   inactive = 'lualine_{section}_inactive', -- Color for inactive window.
            --   -- },
            -- }

            -- buffer
            -- {
            --   'buffers',
            --   show_filename_only = true, -- Shows shortened relative path when set to false.
            --   hide_filename_extension = false, -- Hide filename extension when set to true.
            --   show_modified_status = true, -- Shows indicator when the buffer is modified.

            --   mode = 0, -- 0: Shows buffer name
            --   -- 1: Shows buffer index
            --   -- 2: Shows buffer name + buffer index
            --   -- 3: Shows buffer number
            --   -- 4: Shows buffer name + buffer number

            --   max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
            --   -- it can also be a function that returns
            --   -- the value of `max_length` dynamically.
            --   filetype_names = {
            --     TelescopePrompt = 'Telescope',
            --     dashboard = 'Dashboard',
            --     packer = 'Packer',
            --     fzf = 'FZF',
            --     alpha = 'Alpha'
            --   }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

            --   -- buffers_color = {
            --   --   -- Same values as the general color option can be used here.
            --   --   active = 'lualine_{section}_normal', -- Color for active buffer.
            --   --   inactive = 'lualine_{section}_inactive', -- Color for inactive buffer.
            --   -- },

            --   symbols = {
            --     modified = ' ●', -- Text to show when the buffer is modified
            --     alternate_file = '#', -- Text to show to identify the alternate file
            --     directory = '', -- Text to show when the buffer is a directory
            --   },
            -- }
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {
            {
                'filetype',
                colored = true,    -- Displays filetype icon in color if set to true
                icon_only = false, -- Display only an icon for filetype
                -- icon = { align = 'right' }, -- Display filetype icon on the right hand side
                -- icon =    {'X', align='right'}
                -- Icon string ^ in table is ignored in filetype component
            },
            -- {
            --   'fileformat',
            --   symbols = {
            --     unix = '', -- e712
            --     dos = '', -- e70f
            --     mac = '', -- e711
            --   }
            -- },
            'progress'
        },
        lualine_z = {
            {
                'location',
                -- separator = { right = '' },
                left_padding = 2,
            },
        },
    },
    inactive_sections = {
        lualine_a = {
            {
                'filename',
                file_status = true,     -- Displays file status (readonly status, modified status)
                newfile_status = false, -- Display new file status (new file means no write after created)
                path = 0,               -- 0: Just the filename
                -- 1: Relative path
                -- 2: Absolute path
                -- 3: Absolute path, with tilde as the home directory

                shorting_target = 40, -- Shortens path to leave 40 spaces in the window
                -- for other components. (terrible name, any suggestions?)
                symbols = {
                    modified = '*', -- Text to show when the file is modified.
                    readonly = '!', -- Text to show when the file is non-modifiable or readonly.
                    unnamed = '?',  -- Text to show for unnamed buffers.
                    newfile = '+',  -- Text to show for newly created file before first write
                }
            }
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
    },
    tabline = {},
    extensions = { 'nvim-tree', 'toggleterm', 'symbols-outline' },
}
