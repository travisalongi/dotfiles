require("cmp").setup({
  -- other settings
  sources = {
    -- other sources
    {
      name = "dictionary",
      keyword_length = 2,
    },
  }
})

require("cmp_dictionary").setup({
  paths = { "/usr/share/dict/words" },
  exact_length = 2,
})
