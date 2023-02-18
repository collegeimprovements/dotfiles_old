return {
	require("luasnip").snippet({ trig = "hi" }, { t("Hello, world!") }),
	-- To return multiple snippets, use one `return` statement per snippet file
	-- and return a table of Lua snippets.

	require("luasnip").snippet(
		{ trig = "hr", dscr = "The hyperref package's href{}{} command (for url links)" },
		fmta(
			[[
        \href{<>}{<>}
      ]],
			{
				i(1, "url"),
				i(2, "display name"),
			}
		)
	),
	require("luasnip").snippet({ trig = "foo" }, { t("Another snippet.") }),
	require("luasnip").snippet(
		{ trig = "ii", dscr = "IO.inspect with label" },
		fmta(
			[[
        IO.inspect(label: "<>")
      ]],
			{
				i(1, "HERE:"),
			}
		)
	),
	require("luasnip").snippet(
		{ trig = "ic", dscr = "IO.inspect with label" },
		fmta(
			[[
        IO.inspect(<>,label: "<>")
      ]],
			{
				i(1, "thing_to_inspect:"),
				i(2, "HERE:"),
			}
		)
	),
	require("luasnip").parser.parse_snippet("mf", "$TM_FILENAME - $TM_CURRENT_LINE"),
}
