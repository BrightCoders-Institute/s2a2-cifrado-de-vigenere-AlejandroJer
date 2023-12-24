# frozen_string_literal: true

require 'libui'
require_relative './vigenere-cipher/vigenere'

# Iitialize the UI
UI = LibUI
UI.init
# Define the screen size
screen = UI.new_window('Vigenere Cipher', 800, 500, 1)
UI.window_set_margined(screen, 1)
# Make the quit event
UI.window_on_closing(screen) do
  UI.quit
  1
end
UI.control_show(screen)

# Initialize the Vigenere Cipher
v = Vigenere.new

# Make the main box
rbox = UI.new_vertical_box # rows box
UI.box_set_padded(rbox, 1)
cbox = UI.new_horizontal_box # columns box
UI.box_set_padded(cbox, 1)
UI.window_set_child(screen, rbox) # link the rows box to the screen
UI.box_append(rbox, cbox, 0) # link the columns box to the rows box

# Make the buttons
encrypt_btn = UI.new_button('Encrypt')
decrypt_btn = UI.new_button('Decrypt')
# link the button in the columns box
UI.box_append(cbox, encrypt_btn, 1)
UI.box_append(cbox, decrypt_btn, 1)

# Make the Input Group
group = UI.new_group('Input:')
UI.group_set_margined(group, 1)
UI.box_append(rbox, group, 1) # link the group to the rows box
# Make the second columns box
cbox2 = UI.new_horizontal_box
UI.box_set_padded(cbox2, 1)
UI.group_set_child(group, cbox2) # Link the second columns box to the group

# Make the text input
text_entry = UI.new_entry
UI.entry_set_text(text_entry, 'Text to encrypt')
UI.box_append(cbox2, text_entry, 1) # link the text input to the second columns box
key_entry = UI.new_entry
UI.entry_set_text(key_entry, 'Key')
UI.box_append(cbox2, key_entry, 1) # link the key input to the second columns box

# Make the Ouput Group
group2 = UI.new_group('Ouput:')
UI.group_set_margined(group2, 1)
UI.box_append(rbox, group2, 1) # link the group to the rows box
# Make the second rows box
rbox2 = UI.new_vertical_box
UI.box_set_padded(rbox2, 1)
UI.group_set_child(group2, rbox2) # Link the second rows box to the group
# Make the encrypted text output
ouput_entry = UI.new_entry
UI.box_append(rbox2, ouput_entry, 1) # link the encrypted text output to the second rows box

def get_inputs(ui, obj, text, key)
  obj.text = ui.entry_text(text).to_s
  obj.key = ui.entry_text(key).to_s
end

# Make the buttons work
UI.button_on_clicked(encrypt_btn) do
  get_inputs(UI, v, text_entry, key_entry)
  UI.entry_set_text(ouput_entry, v.encrypt)
end
UI.button_on_clicked(decrypt_btn) do
  get_inputs(UI, v, text_entry, key_entry)
  UI.entry_set_text(ouput_entry, v.decrypt)
end

UI.main
UI.uninit
