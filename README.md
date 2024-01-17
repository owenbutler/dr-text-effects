# dr-text-effects

Small library and example code to create text effects in DragonRuby

### Demo

https://github.com/owenbutler/DR-particles/assets/179979/61dfcc1c-62e3-4a2c-b523-01d9a6e49820

The labels used to create the effects above can be found in [main.rb](app/main.rb)

## Installation

Preferred install is via DragonRuby builtin [download_stb_rb](https://docs.dragonruby.org/#-----download_stb_rb(_raw)-)

First, download the lib using the above method, in the DragonRuby Console:

```
$gtk.download_stb_rb "https://github.com/owenbutler/dr-text-effects/blob/main/app/text_effect.rb"
```

By default, this will download the lib to `owenbutler/dr-text-effects/text_effect.rb`

Include the following in your `main.rb`:

```
require 'owenbutler/dr-text-effects/text_effect.rb'
```

For more control over where the lib is downloaded, see the docs for [download_stb_rb](https://docs.dragonruby.org/#-----download_stb_rb(_raw)-)

## Usage

Minimal example:

```ruby
require 'owenbutler/dr-text-effects/text_effect.rb'

def tick args

  if args.tick_count == 0
    args.state.wavy = Text.new( {
      x: 150, y: 300, text: "The quick brown fox", size_enum: 30,
    })
  end

  args.outputs.sprites << args.state.wavy.wave_h
end
```

## TODO

- Add support for resetting effect
- Add support for non repeating effects
- Add more expansive examples
