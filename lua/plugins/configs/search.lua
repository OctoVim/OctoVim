local status_ok, sr = pcall(require, "search-replace")

if not status_ok then
	return
end

sr.setup({
	default_replace_single_buffer_options = "gcI",
	default_replace_multi_buffer_options = "egcI",
})
