vim.opt.shadafile = "NONE" -- This is for performance gain

-- Order Matters
require("user.core.essential-keybindings")
require("user/lazy_bootstrap")
require("impatient")

-- Core
-- require("user") -- user => init.lua
require("user.core.options")
require("user.core.general")
require("user.core.keymaps")
require("user.core.languages")

-- Config
require("user.config.cmp")
require("user.config.hop")
require("user.config.html")

vim.opt.shadafile = "" -- This is for performance gain
