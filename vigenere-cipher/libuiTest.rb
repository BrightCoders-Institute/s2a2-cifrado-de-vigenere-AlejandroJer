require 'libui'

UI = LibUI
init = UI.init





def color(r, g, b, a)
  handler = UI::FFI::AreaHandler.malloc
  handler.to_ptr.free = Fiddle::RUBY_FREE
  b = UI::FFI::DrawBrush.malloc
  b.to_ptr.free = Fiddle::RUBY_FREE
  handler_draw_event = Fiddle::Closure::BlockCaller.new(0, [1, 1, 1]) do |_, _, adp|
    area_draw_params = UI::FFI::AreaDrawParams.new(adp)
    path = UI.draw_new_path(0)
    UI.draw_path_add_rectangle(path, 0, 0, area_draw_params.AreaWidth, area_draw_params.AreaHeight)
    UI.draw_path_end(path)
    b.Type = 0
    b.R, b.G, b.B, b.A = r, g, b, a
    UI.draw_fill(area_draw_params.Context, path, b)
    UI.draw_free_path(path)
  end

  do_nothing = Fiddle::Closure::BlockCaller.new(0, [0]) {}
  key_event  = Fiddle::Closure::BlockCaller.new(1, [0]) { 0 }

  handler.Draw = handler_draw_event
  handler.MouseEvent = do_nothing
  handler.MouseCrossed = do_nothing
  handler.DragBroken = do_nothing
  handler.KeyEvent = key_event

  area = UI.new_area(handler)
  area
end



hbox = UI.new_vertical_box
UI.box_set_padded(hbox, 1)
vbox = UI.new_horizontal_box
UI.box_set_padded(vbox, 1)




screen = UI.new_window('Vigenere Cipher', 800, 500, 1)
UI.window_set_margined(screen, 1)

UI.window_set_child(screen, hbox)
UI.box_append(hbox, vbox, 0)
areaCyan = color(0.4, 0.8, 0.8, 1.0)
UI.box_append(vbox, areaCyan, 1)
areaPurple = color(0.6, 0.1, 0.6, 1.0)
UI.box_append(vbox, areaPurple, 1)

group = UI.new_group('Vigenere Cipher')
UI.group_set_margined(group, 1)
UI.box_append(hbox, group, 1)

vbox2 = UI.new_horizontal_box
UI.box_set_padded(vbox, 1)

UI.group_set_child(group, vbox2)
areaBlue = color(0.2, 0.1, 0.4, 1.0)
UI.box_append(vbox2, areaBlue, 1)
areaPink = color(0.8, 0.5, 0.4, 1.0)
UI.box_append(vbox2, areaPink, 1)


group2 = UI.new_group('Vigenere Cipher')
UI.group_set_margined(group2, 1)
UI.box_append(hbox, group2, 1)

hbox2 = UI.new_vertical_box
UI.box_set_padded(hbox2, 1)

UI.group_set_child(group2, hbox2)
areaTurquoise = color(0.0, 1.0, 0.0, 1.0)
UI.box_append(hbox2, areaTurquoise, 1)
areawhite = color(0.8, 0.8, 0.8, 1.0)
UI.box_append(hbox2, areawhite, 0)




UI.window_on_closing(screen) do
  puts 'Bye Bye'
  UI.quit
  1
end

UI.control_show(screen)

UI.main
UI.uninit
