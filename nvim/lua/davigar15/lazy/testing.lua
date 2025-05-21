return {
	"preservim/vimux",
	{
		"vim-test/vim-test",
		keys = {
			{ "<leader>t", ":TestNearest<CR>", desc = "Run nearest test" },
			{ "<leader>T", ":TestFile<CR>", desc = "Run test file" },
			{ "<leader>L", ":TestLast<CR>", desc = "Run last test" },
			{ "<leader>v", ":TestVisit<CR>", desc = "Visit file where last test was run" },
		},
		config = function()
			-- Define the DockerTransform function in Lua

			local function docker_transform(cmd)
				-- Match the test file and test name from the original command
				local test_path = cmd:match("poetry run pytest%s+(.*)")
				if not test_path then
					-- fallback to original if doesn't match expected pattern
					return cmd
				end

				return 'docker compose run --rm -e COMMAND="' .. test_path .. '" python_pytest'
			end

			-- Set the function in the global vim.g table
			vim.g["test#custom_transformations"] = {
				docker = docker_transform,
			}

			-- Set the transformation to use 'docker'
			vim.g["test#transformation"] = "docker"
			vim.g["test#strategy"] = "vimux"
		end,
	},
}
