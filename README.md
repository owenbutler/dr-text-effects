# dr-text-effects

Small library and example code to create text effects in DragonRuby

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

![quick-brown](https://github.com/owenbutler/dr-text-effects/assets/179979/6a655fa9-7697-4cef-beed-84093ab93bd7)

## Effect Types

The following effects are supported:

- WaveHorizontal
- WaveVertical
- SlideHorizontal
- SlideVertical

https://github.com/owenbutler/dr-text-effects/assets/179979/5b378317-beee-48f7-8edc-df743c10c101

The example code used to create the effects above can be found in [main.rb](app/main.rb)

## TODO

- Add support for non repeating effects
