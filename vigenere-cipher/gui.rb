require 'libui'
require_relative 'vigenere.rb'

# Iitialize the UI
UI = LibUI
init = UI.init
# Define the screen size
screen = UI.new_window('Vigenere Cipher', 800, 500, 1)
UI.window_set_margined(screen, 1)
# Make the quit event
UI.window_on_closing(screen) do
  puts 'Bye Bye'
  UI.quit
  1
end
UI.control_show(screen)

# Initialize the Vigenere Cipher
v = Vigenere.new
# flags
inputText = false
inputKey = false
inputEncryptedText = false


# Make the main box
rbox = UI.new_vertical_box # rows box
UI.box_set_padded(rbox, 1)
cbox = UI.new_horizontal_box # columns box
UI.box_set_padded(cbox, 1)
UI.window_set_child(screen, rbox) # link the rows box to the screen
UI.box_append(rbox, cbox, 0) # link the columns box to the rows box
# Make the buttons
encryptBtn = UI.new_button('Encrypt')
decryptBtn = UI.new_button('Decrypt')
# link the button in the columns box
UI.box_append(cbox, encryptBtn, 1)
UI.box_append(cbox, decryptBtn, 1)
# Make the Input Group
group = UI.new_group('Input:')
UI.group_set_margined(group, 1)
UI.box_append(rbox, group, 1) # link the group to the rows box
# Make the second columns box
cbox2 = UI.new_horizontal_box
UI.box_set_padded(cbox2, 1)
UI.group_set_child(group, cbox2) # Link the second columns box to the group
# Make the text input
text = UI.new_entry
UI.entry_set_text(text, 'Text to encrypt')
UI.box_append(cbox2, text, 1) # link the text input to the second columns box
key = UI.new_entry
UI.entry_set_text(key, 'Key')
UI.box_append(cbox2, key, 1) # link the key input to the second columns box
# Make the Ouput Group
group2 = UI.new_group('Ouput:')
UI.group_set_margined(group2, 1)
UI.box_append(rbox, group2, 1) # link the group to the rows box
# Make the second rows box
rbox2 = UI.new_vertical_box
UI.box_set_padded(rbox2, 1)
UI.group_set_child(group2, rbox2) # Link the second rows box to the group
# Make the encrypted text output
encryptedText = UI.new_entry
UI.box_append(rbox2, encryptedText, 1) # link the encrypted text output to the second rows box
# error = UI.new_entry
# UI.entry_set_text(error, 'Error: None')
# UI.box_append(rbox2, error, 0) # link the error output to the second rows box

# Make the buttons work
UI.button_on_clicked(encryptBtn) do
  v.SetText(UI.entry_text(text).to_s)
  v.SetKey(UI.entry_text(key).to_s)
  UI.entry_set_text(encryptedText, v.Encrypt)
end
UI.button_on_clicked(decryptBtn) do
  v.SetText(UI.entry_text(text).to_s)
  v.SetKey(UI.entry_text(key).to_s)
  UI.entry_set_text(encryptedText, v.Decrypt)
end


UI.main
UI.uninit
