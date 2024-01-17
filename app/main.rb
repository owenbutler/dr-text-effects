require 'app/text_effect.rb'

def tick args

  if args.tick_count == 0
    init args
  end

  args.outputs.background_color = [242, 243, 245]

  args.outputs.sprites << args.state.wavy_h.wave_h
  args.outputs.sprites << args.state.wavy_v.wave_v
  args.outputs.sprites << args.state.slide_h.slide_h(repeat: true)
  args.outputs.sprites << args.state.slide_h2.slide_h(dist: -100, repeat: true)
  #args.outputs.sprites << args.state.slide_v.slide_v(dist: -50, repeat: true, diff: 2)
  args.outputs.sprites << args.state.slide_v.render
  args.outputs.sprites << args.state.slide_v2.render

  if args.inputs.keyboard.key_held.backspace
    args.outputs.primitives << args.gtk.framerate_diagnostics_primitives
  end
end

def init args
  args.state.wavy_h = Text.new( {
      x: 150, y: 600, text: "The quick brown wavy text", size_enum: 30, r: 0, g: 0, b: 0,
    } )
  args.state.wavy_v = Text.new( {
      x: 150, y: 500, text: "The quick brown wavy vtext", size_enum: 30, r: 0, g: 0, b: 0,
    } )
  args.state.slide_h = Text.new( {
      x: 150, y: 400, text: "The quick brown slidey text", size_enum: 30, r: 0, g: 0, b: 0,
    } )
  args.state.slide_h2 = Text.new( {
      x: 150, y: 300, text: "The quick brown slidey text", size_enum: 30, r: 0, g: 0, b: 0,
    } )
  args.state.slide_v = SlideVertical.new( {
      x: 150, y: 200, text: "The quick brown slidev text", size_enum: 30, r: 0, g: 0, b: 0,
    }, dist: -50, repeat: true, diff: 2 )
  args.state.slide_v2 = SlideVertical.new( {
      x: 150, y: 100, text: "The quick brown slidev text", size_enum: 30, r: 0, g: 0, b: 0,
    }, dist: 50, repeat: true, diff: 2 )
end
