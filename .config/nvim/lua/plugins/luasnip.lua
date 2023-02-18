return {
	"L3MON4D3/LuaSnip",
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	config = function()
		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/user/snippets/" })
	end,
}
