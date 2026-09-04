vim.lsp.config("pyright", {
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "standard",
				autoSearchPaths = true,
				diagnosticMode = "workspace",
			},
		},
	},
	-- pyright doesn't reliably discover a project's virtualenv on its own, so
	-- walk up from the workspace root for a .venv/venv and hand it the
	-- interpreter. A per-project pyrightconfig.json still overrides this.
	before_init = function(params, config)
		local root = config.root_dir or (params.rootUri and vim.uri_to_fname(params.rootUri)) or vim.fn.getcwd()
		local venv = vim.fs.find({ ".venv", "venv" }, {
			path = root,
			upward = true,
			type = "directory",
		})[1]
		if venv and vim.fn.executable(venv .. "/bin/python") == 1 then
			config.settings.python.pythonPath = venv .. "/bin/python"
		end
	end,
})
