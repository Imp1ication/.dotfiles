local M = {}

-- 模型清單
M.available_models = {
	"meta-llama/llama-4-maverick:free",
	"meta-llama/llama-4-scout:free",
	"deepseek/deepseek-chat-v3-0324:free",
}

-- 各策略對應的預設模型
M.current_models = {
	chat = "meta-llama/llama-4-maverick:free",
	inline = "meta-llama/llama-4-maverick:free",
}

--- 選擇模型
---@param target "chat"|"inline"
function M.select_model(target)
	vim.ui.select(M.available_models, {
		prompt = "Select " .. target .. " model:",
	}, function(choice)
		if choice then
			M.current_models[target] = choice
			vim.notify("\nSelected " .. target .. " model: " .. choice)
		end
	end)
end

--- 取得模型
---@param target "chat"|"inline"
---@return string
function M.get_model(target)
	return M.current_models[target]
end

return M
