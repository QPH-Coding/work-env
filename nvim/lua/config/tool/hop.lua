local G = require('G')
require 'hop'.setup {
    -- Hop configuration goes there
}
local opt = { noremap = true, silent = true }
G.map("n", "<leader><space>w", ":HopWord<CR>", opt)
G.map("n", "<leader><space>e", ":HopChar2<CR>", opt)
G.map("n", "<leader><space>r", ":HopChar1<CR>", opt)
