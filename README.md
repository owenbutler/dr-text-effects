# dr-text-effects

Small library and example code to create text effects in DragonRuby

### Demo

https://github.com/owenbutler/dr-text-effects/assets/179979/5b378317-beee-48f7-8edc-df743c10c101

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
    args.state.wavy = WaveHorizontal.new( {
      x: 150, y: 300, text: "The quick brown fox", size_enum: 30,
    })
  end

  args.outputs.sprites << args.state.wavy.render
end
```

![GIF 19-01-2024 11-26-39 AM](https://github.com/owenbutler/dr-text-effects/assets/179979/3a70ba38-abd3-4628-be1e-7eb71735759a)

## TODO

- Add support for resetting effect
- Add support for non repeating effects
- Add more expansive examples
