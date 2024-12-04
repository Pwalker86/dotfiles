return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "main",
	dependencies = {
		{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
		{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
	},
	build = "make tiktoken", -- Only on MacOS or Linux
	opts = {
		-- See Configuration section for options
		question_header = "## User ",
		answer_header = "## Copilot ",
		error_header = "## Error ",
	},
	-- See Commands section for default commands if you want to lazy load on them
	config = function(_, opts)
		local chat = require("CopilotChat")
		local select = require("CopilotChat.select")
		-- Use unnamed register for the selection
		opts.selection = select.unnamed

		chat.setup(opts)
		-- Function to prompt Copilot for YARD documentation
		local function generate_yard_docs()
			local current_buffer = vim.api.nvim_get_current_buf()
			local start_line, start_col = unpack(vim.fn.getpos("'<"), 2, 3)
			local end_line, end_col = unpack(vim.fn.getpos("'>"), 2, 3)

			-- Get the selected lines
			local selected_lines = vim.api.nvim_buf_get_lines(current_buffer, start_line - 1, end_line, false)
			local selected_text = table.concat(selected_lines, "\n")

			-- Define the YARD prompt
			local prompt = "# Generate YARD documentation for the following Ruby code:\n" .. selected_text

			chat.ask(prompt, { selection = opts.selection })
		end
		-- Insert the prompt comment above the current line
		-- vim.api.nvim_buf_set_lines(
		-- 	current_buffer,
		-- 	vim.fn.line(".") - 1,
		-- 	vim.fn.line(".") - 1,
		-- 	false,
		-- 	vim.split(prompt, "\n")
		-- )

		-- Create a command to call the function
		vim.api.nvim_create_user_command("GenerateYARD", generate_yard_docs, {})

		vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
			chat.ask(args.args, { selection = select.visual })
		end, { nargs = "*", range = true })

		-- Inline chat with Copilot
		vim.api.nvim_create_user_command("CopilotChatInline", function(args)
			chat.ask(args.args, {
				selection = select.visual,
				window = {
					layout = "float",
					relative = "cursor",
					width = 1,
					height = 0.4,
					row = 1,
				},
			})
		end, { nargs = "*", range = true })

		-- Restore CopilotChatBuffer
		vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
			chat.ask(args.args, { selection = select.buffer })
		end, { nargs = "*", range = true })
	end,
	event = { "VeryLazy" },
	keys = {
		-- Show prompts actions with telescope
		{
			"<leader>ap",
			function()
				local actions = require("CopilotChat.actions")
				require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
			end,
			desc = "CopilotChat - Prompt actions",
		},
		{
			"<leader>ap",
			":lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions({selection = require('CopilotChat.select').visual}))<CR>",
			mode = "x",
			desc = "CopilotChat - Prompt actions",
		},
		-- Code related commands
		{ "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
		{ "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
		{ "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
		{ "<leader>aR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
		{ "<leader>an", "<cmd>CopilotChatBetterNamings<cr>", desc = "CopilotChat - Better Naming" },
		{ "<leader>av", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
		-- Fix the issue with diagnostic
		{ "<leader>af", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostic" },
		-- Chat with Copilot in visual mode
		{
			"<leader>av",
			":CopilotChatVisual",
			mode = "x",
			desc = "CopilotChat - Open in vertical split",
		},
		{
			"<leader>ax",
			":CopilotChatInline<cr>",
			mode = "x",
			desc = "CopilotChat - Inline chat",
		},
		-- Custom input for CopilotChat
		{
			"<leader>ai",
			function()
				local input = vim.fn.input("Ask Copilot: ")
				if input ~= "" then
					vim.cmd("CopilotChat " .. input)
				end
			end,
			desc = "CopilotChat - Ask input",
		},
		-- Quick chat with Copilot
		{
			"<leader>aq",
			function()
				local input = vim.fn.input("Quick Chat: ")
				if input ~= "" then
					vim.cmd("CopilotChatBuffer " .. input)
				end
			end,
			desc = "CopilotChat - Quick chat",
		},
	},
}
