return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",

  -- Pack
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.cpp" },
  {
    "Civitasv/cmake-tools.nvim",
    enabled = false,
  }
}
