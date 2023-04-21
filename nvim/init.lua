-- global
require("utils.global-functions")
require("utils.autocmds")
require("utils.lazy-init")

-- basic setting
require("basic")

-- plugins
require("lazy").setup("plugins")
