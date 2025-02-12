-- Define the function to save the image from the clipboard
local function save_image()
  local output_dir = vim.fn.getcwd() .. "/images/"

  -- Prompt the user for the image name
  vim.ui.input({ prompt = "Enter image name (without extension): " }, function(input)
    if input == nil or input == "" then
      print("No name provided. Image not saved.")
      return
    end

    local output_file = output_dir .. input .. ".png"

    -- Ensure the output directory exists
    vim.fn.mkdir(output_dir, "p")

    -- Save clipboard content as an image
    os.execute("xclip -selection clipboard -t image/png -o > " .. output_file)

    print("Image saved to: " .. output_file)
  end)
end

-- Create a command to run the function
vim.api.nvim_create_user_command("SaveClipboardImage", save_image, {})

-- Map <leader>p to the command
-- vim.api.nvim_set_keymap("n", "<leader>p", ":SaveClipboardImage<CR>", { noremap = true, silent = true })
