-- require("full-border"):setup()
-- require("simple-status"):setup()
require("no-status"):setup()
require('duckdb'):setup(
    {
         mode = "summarized",
         -- mode = "standard",
         minmax_columnwidth = 10,
    }
)
