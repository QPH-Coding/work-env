local dap, dapui = require("dap"), require("dapui")

local debug_open = function()
  dapui.open()
  vim.api.nvim_command("DapVirtualTextEnable")
  vim.api.nvim_command("NvimTreeClose")
end

local function debug_close()
  dapui.close()
  dap.repl.close()
  vim.api.nvim_command("DapVirtualTextDisable")
end

dap.listeners.after.event_initialized["dapui_config"] = function()
  debug_open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  debug_close()
end
dap.listeners.before.event_exited["dapui_config"]     = function()
  debug_close()
end

dap.listeners.before.disconnect["dapui_config"]       = function()
  debug_close()
end

local dap_breakpoint                                  = {
  Breakpoint = {
    text = "",
    texthl = "LspDiagnosticsSignError",
    linehl = "",
    numhl = "",
  },
  BreakpointRejected = {
    text = "",
    texthl = "LspDiagnosticsSignHint",
    linehl = "",
    numhl = "",
  },
  Stopped = {
    text = "󰁕",
    texthl = "LspDiagnosticsSignInformation",
    linehl = "DiagnosticUnderlineInfo",
    numhl = "LspDiagnosticsSignInformation",
  }
}

dapui.setup {
  vim.fn.sign_define("DapBreakpoint", dap_breakpoint.Breakpoint),
  vim.fn.sign_define("DapStopped", dap_breakpoint.Stopped),
  vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.BreakpointRejected),
  controls = {
    element = "repl",
    enabled = true,
    icons = {
      disconnect = "",
      pause = "",
      play = "",
      run_last = "",
      step_back = "",
      step_into = "",
      step_out = "",
      step_over = "",
      terminate = ""
    }
  },
  element_mappings = {},
  expand_lines = true,
  floating = {
    border = "single",
    mappings = {
      close = { "q", "<Esc>" }
    }
  },
  force_buffers = true,
  icons = {
    collapsed = "",
    current_frame = "",
    expanded = ""
  },
  layouts = { {
    elements = { {
      id = "scopes",
      size = 0.25
    }, {
      id = "breakpoints",
      size = 0.25
    }, {
      id = "stacks",
      size = 0.25
    }, {
      id = "watches",
      size = 0.25
    } },
    position = "left",
    size = 40
  }, {
    elements = { {
      id = "repl",
      size = 0.5
    }, {
      id = "console",
      size = 0.5
    } },
    position = "bottom",
    size = 10
  } },
  mappings = {
    edit = "e",
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    repl = "r",
    toggle = "t"
  },
  render = {
    indent = 1,
    max_value_lines = 100
  }
}
