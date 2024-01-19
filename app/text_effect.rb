class Text
  def initialize label_hash
    @l = label_hash.dup

    # defaults
    @l.vertical_alignment_enum = @l[:vertical_alignment] || 0
    @l.blendmode_enum = @l[:blendmode_enum] || 0
    @l.font = @l[:font] || "font.ttf"

    @x = @l.x
    @y = @l.y
    @l.x = 0
    @l.y = 0
    @width, @height = $gtk.args.gtk.calcstringbox(@l.text, @l.size_enum, @l.font)
    @id = "#{@l.text}-#{@l.size_enum}-#{@l.font}"
    @created_at = $gtk.args.tick_count

    # render the label into a render target at id
    $gtk.args.outputs[@id].w = @width + 1
    $gtk.args.outputs[@id].h = @height
    $gtk.args.outputs[@id].labels << @l
  end

  def expired?(duration, diff, num)
    $gtk.args.tick_count > @created_at + (duration + diff * num)
  end

  def reset!
    @created_at = $gtk.args.tick_count
  end
end

class SlideVertical < Text

  def initialize(label_hash, num: 50, dist: 50, diff: 5, duration: 60, repeat: false, easer: :smooth_stop_quart)
    super(label_hash)

    @num = num
    @dist = dist
    @diff = diff
    @duration = duration
    @repeat = repeat
    @easer = easer
  end

  def render
    slices = []
    slice_width = @width / @num

    if expired?(@duration, @diff, @num)
      if @repeat
        reset!
      else
        return {x: @x, y: @y, w: @width, h: @height, path: @id}
      end
    end

    @num.times do |index|
      ease = $gtk.args.easing.ease(@created_at, $gtk.args.tick_count - index * @diff, @duration, @easer)
      r = ease.remap(0, 1, -@dist, 0)
      a = ease.remap(0, 1, 0, 255)
      slices << {
        x: @x + (slice_width * index), y: @y + r,
        w: slice_width, h: @height,
        path: @id,
        source_x: slice_width * index, source_w: slice_width, a: a
      }
    end

    return slices
  end
end

class SlideHorizontal < Text

  def initialize(label_hash, num: 10, dist: 100, diff: 5, duration: 60, repeat: false, easer: :smooth_stop_quart)
    super(label_hash)

    @num = num
    @dist = dist
    @diff = diff
    @duration = duration
    @repeat = repeat
    @easer = easer
  end

  def render
    slices = []
    slice_height = @height / @num

    if expired?(@duration, @diff, @num)
      if @repeat
        reset!
      else
        return {x: @x, y: @y, w: @width, h: @height, path: @id}
      end
    end

    @num.times do |index|
      ease = $gtk.args.easing.ease(@created_at, $gtk.args.tick_count - index * @diff, @duration, @easer)
      r = ease.remap(0, 1, -@dist, 0)
      a = ease.remap(0, 1, 0, 255)
      slices << {
        x: @x + r, y: @y + (slice_height * index),
        w: @width, h: slice_height,
        path: @id,
        source_y: slice_height * index, source_h: slice_height, a: a
      }
    end

    return slices
  end
end

class WaveVertical < Text

  def initialize(label_hash, num: 50, amp: 5, freq: 10, diff: 5)
    super(label_hash)

    @num = num
    @amp = amp
    @freq = freq
    @diff = diff
  end

  def render
    slices = []
    slice_width = (@width / @num).to_i
    @num.times do |index|
      r = Math::sin(($gtk.args.tick_count + index * @diff) / @freq).remap(-1, 1, -@amp, @amp)
      slice_index = slice_width * index
      slices << {
        x: @x + slice_index, y: @y + r,
        w: slice_width, h: @height,
        path: @id,
        source_x: slice_index, source_w: slice_width,
      }
    end

    return slices
  end
end

class WaveHorizontal < Text

  def initialize(label_hash, num: 10, amp: 5, freq: 10, diff: 5)
    super(label_hash)

    @num = num
    @amp = amp
    @freq = freq
    @diff = diff
  end

  def render
    slices = []
    slice_height = (@height / @num).to_i
    @num.times do |index|
      r = Math::sin(($gtk.args.tick_count + index * @diff) / @freq).remap(-1, 1, -@amp, @amp)
      slices << {
        x: @x + r, y: @y + (slice_height * index),
        w: @width, h: slice_height,
        path: @id,
        source_y: slice_height * index, source_h: slice_height,
      }
    end

    return slices
  end
end