vim.api.nvim_set_keymap("n", "z=", ":lua ShowSpellSuggestions()<CR>", { noremap = true, silent = true })

function ShowSpellSuggestions()
  local word = vim.fn.expand("<cword>") -- Get the current word under the cursor
  local suggestions = vim.fn.spellsuggest(word)

  if #suggestions == 0 then
    vim.notify("No suggestions available", vim.log.levels.INFO)
    return
  end

  vim.ui.select(suggestions, {
    prompt = "Spell Suggestions for '" .. word .. "':",
    kind = "spell_suggestions",
  }, function(choice)
    if choice then
      vim.cmd("normal! ciw" .. choice) -- Replace the misspelled word with the selected suggestion
    end
  end)
end

