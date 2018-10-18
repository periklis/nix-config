{}:''
# Configuration for Alacritty, the GPU enhanced terminal emulator

# Any items in the `env` entry below will be added as
# environment variables. Some entries may override variables
# set by alacritty it self.
env:
  # TERM env customization.
  #
  # If this property is not set, alacritty will set it to xterm-256color.
  #
  # Note that some xterm terminfo databases don't declare support for italics.
  # You can verify this by checking for the presence of `smso` and `sitm` in
  # `infocmp xterm-256color`.
  TERM: screen-256color

window:
  # Window dimensions in character columns and lines
  # (changes require restart)
  dimensions:
    columns: 80
    lines: 24

  # Adds this many blank pixels of padding around the window
  # Units are physical pixels; this is not DPI aware.
  # (change requires restart)
  padding:
    x: 2
    y: 2

  # Window decorations
  # Setting this to false will result in window without borders and title bar.
  decorations: false

# Display tabs using this many cells (changes require restart)
tabspaces: 4

# When true, bold text is drawn using the bright variant of colors.
draw_bold_text_with_bright_colors: true

# Font configuration (changes require restart)
font:
  # The normal (roman) font face to use.
  normal:
    family: Hack
    # Style can be specified to pick a specific face.
    style: Regular

  # The bold font face
  family:
    bold: Hack
    # Style can be specified to pick a specific face.
    style: Bold

  # The italic font face
  italic:
    family: Hack
    # Style can be specified to pick a specific face.
    style: Italic

  # Point size of the font
  size: 12.0

  # Offset is the extra space around each character. offset.y can be thought of
  # as modifying the linespacing, and offset.x as modifying the letter spacing.
  offset:
    x: 0
    y: 0

  # Glyph offset determines the locations of the glyphs within their cells with
  # the default being at the bottom. Increase the x offset to move the glyph to
  # the right, increase the y offset to move the glyph upward.
  glyph_offset:
    x: 0
    y: 0

  # Scale the font size based on the monitor's DPI. This will lead to bigger text on HiDPI
  # screens and make reading text a little easier.
  scale_with_dpi: true

  # OS X only: use thin stroke font rendering. Thin strokes are suitable
  # for retina displays, but for non-retina you probably want this set to
  # false.
  use_thin_strokes: true

# Should display the render timer
render_timer: false

# Use custom cursor colors. If true, display the cursor in the cursor.foreground
# and cursor.background colors, otherwise invert the colors of the cursor.
custom_cursor_colors: false

# Colors (Darktooth)
colors:

  # Default colors
  primary:
    background: '0x282828'
    foreground: '0xfdf4c1'

  # Normal colors
  normal:
    black:   '0x282828'
    red:     '0x9d0006'
    green:   '0x79740e'
    yellow:  '0xb57614'
    blue:    '0x076678'
    magenta: '0x8f3f71'
    cyan:    '0x00a7af'
    white:   '0xfdf4c1'

  # Bright colors
  bright:
    black:   '0x32302f'
    red:     '0xfb4933'
    green:   '0xb8bb26'
    yellow:  '0xfabd2f'
    blue:    '0x83a598'
    magenta: '0xd3869b'
    cyan:    '0x3fd7e5'
    white:   '0xffffc8'

  # Dim colors (Optional)
  dim:
    black:   '0x1d2021'
    red:     '0x421e1e'
    green:   '0x232b0f'
    yellow:  '0x4d3b27'
    blue:    '0x2b3c44'
    magenta: '0x4e3d45'
    cyan:    '0x205161'
    white:   '0xf4e8ba'

# Visual Bell
#
# Any time the BEL code is received, Alacritty "rings" the visual bell. Once
# rung, the terminal background will be set to white and transition back to the
# default background color. You can control the rate of this transition by
# setting the `duration` property (represented in milliseconds). You can also
# configure the transition function by setting the `animation` property.
#
# Possible values for `animation`
# `Ease`
# `EaseOut`
# `EaseOutSine`
# `EaseOutQuad`
# `EaseOutCubic`
# `EaseOutQuart`
# `EaseOutQuint`
# `EaseOutExpo`
# `EaseOutCirc`
# `Linear`
#
# To completely disable the visual bell, set its duration to 0.
#
visual_bell:
  animation: EaseOutExpo
  duration: 0

# Background opacity
background_opacity: 1.0

# Mouse bindings
#
# Currently doesn't support modifiers. Both the `mouse` and `action` fields must
# be specified.
#
# Values for `mouse`:
# - Middle
# - Left
# - Right
# - Numeric identifier such as `5`
#
# Values for `action`:
# - Paste
# - PasteSelection
# - Copy (TODO)
mouse_bindings:
  - { mouse: Middle, action: PasteSelection }

mouse:
  # Click settings
  #
  # The `double_click` and `triple_click` settings control the time
  # alacritty should wait for accepting multiple clicks as one double
  # or triple click.
  double_click: { threshold: 300 }
  triple_click: { threshold: 300 }

  # Faux Scrollback
  #
  # The `faux_scrollback_lines` setting controls the number
  # of lines the terminal should scroll when the alternate
  # screen buffer is active. This is used to allow mouse
  # scrolling for applications like `man`.
  #
  # To disable this completely, set `faux_scrollback_lines` to 0.
  faux_scrollback_lines: 1

selection:
  semantic_escape_chars: ",│`|:\"' ()[]{}<>"

dynamic_title: true

hide_cursor_when_typing: true

# Style of the cursor
#
# Values for 'cursor_style':
# - Block
# - Underline
# - Beam
cursor_style: Block

# Whether the cursor should be a hollow block on window focus loss
unfocused_hollow_cursor: true

# Live config reload (changes require restart)
live_config_reload: true

# Shell
#
# You can set shell.program to the path of your favorite shell, e.g. /bin/fish.
# Entries in shell.args are passed unmodified as arguments to the shell.
#
shell:
  program: /run/current-system/sw/bin/zsh
  args:
    - --login

# Key bindings
#
# Each binding is defined as an object with some properties. Most of the
# properties are optional. All of the alphabetical keys should have a letter for
# the `key` value such as `V`. Function keys are probably what you would expect
# as well (F1, F2, ..). The number keys above the main keyboard are encoded as
# `Key1`, `Key2`, etc. Keys on the number pad are encoded `Number1`, `Number2`,
# etc.  These all match the glutin::VirtualKeyCode variants.
#
# A list with all available `key` names can be found here:
# https://docs.rs/glutin/*/glutin/enum.VirtualKeyCode.html#variants
#
# Possible values for `mods`
# `Command`, `Super` refer to the super/command/windows key
# `Control` for the control key
# `Shift` for the Shift key
# `Alt` and `Option` refer to alt/option
#
# mods may be combined with a `|`. For example, requiring control and shift
# looks like:
#
# mods: Control|Shift
#
# The parser is currently quite sensitive to whitespace and capitalization -
# capitalization must match exactly, and piped items must not have whitespace
# around them.
#
# Either an `action`, `chars`, or `command` field must be present.
#   `action` must be one of `Paste`, `PasteSelection`, `Copy`, or `Quit`.
#   `chars` writes the specified string every time that binding is activated.
#     These should generally be escape sequences, but they can be configured to
#     send arbitrary strings of bytes.
#   `command` must be a map containing a `program` string, and `args` array of
#     strings. For example:
#     - { ... , command: { program: "alacritty", args: ["-e", "vttest"] } }
key_bindings:
  # Emacs Keybindings for Meta bound on MacOS Cmd key
  - { key: A,         mods: Command,       chars: "\x1ba"                       }
  - { key: B,         mods: Command,       chars: "\x1bb"                       }
  - { key: C,         mods: Command,       chars: "\x1bc"                       }
  - { key: D,         mods: Command,       chars: "\x1bd"                       }
  - { key: E,         mods: Command,       chars: "\x1be"                       }
  - { key: F,         mods: Command,       chars: "\x1bf"                       }
  - { key: G,         mods: Command,       chars: "\x1bg"                       }
  - { key: H,         mods: Command,       chars: "\x1bh"                       }
  - { key: I,         mods: Command,       chars: "\x1bi"                       }
  - { key: J,         mods: Command,       chars: "\x1bj"                       }
  - { key: K,         mods: Command,       chars: "\x1bk"                       }
  - { key: L,         mods: Command,       chars: "\x1bl"                       }
  - { key: M,         mods: Command,       chars: "\x1bm"                       }
  - { key: N,         mods: Command,       chars: "\x1bn"                       }
  - { key: O,         mods: Command,       chars: "\x1bo"                       }
  - { key: P,         mods: Command,       chars: "\x1bp"                       }
  - { key: Q,         mods: Command,       chars: "\x1bq"                       }
  - { key: R,         mods: Command,       chars: "\x1br"                       }
  - { key: S,         mods: Command,       chars: "\x1bs"                       }
  - { key: T,         mods: Command,       chars: "\x1bt"                       }
  - { key: U,         mods: Command,       chars: "\x1bu"                       }
  - { key: V,         mods: Command,       chars: "\x1bv"                       }
  - { key: W,         mods: Command,       chars: "\x1bw"                       }
  - { key: X,         mods: Command,       chars: "\x1bx"                       }
  - { key: Y,         mods: Command,       chars: "\x1by"                       }
  - { key: Z,         mods: Command,       chars: "\x1bz"                       }
  - { key: A,         mods: Command|Shift, chars: "\x1bA"                       }
  - { key: B,         mods: Command|Shift, chars: "\x1bB"                       }
  - { key: C,         mods: Command|Shift, chars: "\x1bC"                       }
  - { key: D,         mods: Command|Shift, chars: "\x1bD"                       }
  - { key: E,         mods: Command|Shift, chars: "\x1bE"                       }
  - { key: F,         mods: Command|Shift, chars: "\x1bF"                       }
  - { key: G,         mods: Command|Shift, chars: "\x1bG"                       }
  - { key: H,         mods: Command|Shift, chars: "\x1bH"                       }
  - { key: I,         mods: Command|Shift, chars: "\x1bI"                       }
  - { key: J,         mods: Command|Shift, chars: "\x1bJ"                       }
  - { key: K,         mods: Command|Shift, chars: "\x1bK"                       }
  - { key: L,         mods: Command|Shift, chars: "\x1bL"                       }
  - { key: M,         mods: Command|Shift, chars: "\x1bM"                       }
  - { key: N,         mods: Command|Shift, chars: "\x1bN"                       }
  - { key: O,         mods: Command|Shift, chars: "\x1bO"                       }
  - { key: P,         mods: Command|Shift, chars: "\x1bP"                       }
  - { key: Q,         mods: Command|Shift, chars: "\x1bQ"                       }
  - { key: R,         mods: Command|Shift, chars: "\x1bR"                       }
  - { key: S,         mods: Command|Shift, chars: "\x1bS"                       }
  - { key: T,         mods: Command|Shift, chars: "\x1bT"                       }
  - { key: U,         mods: Command|Shift, chars: "\x1bU"                       }
  - { key: V,         mods: Command|Shift, chars: "\x1bV"                       }
  - { key: X,         mods: Command|Shift, chars: "\x1bX"                       }
  - { key: Y,         mods: Command|Shift, chars: "\x1bY"                       }
  - { key: Z,         mods: Command|Shift, chars: "\x1bZ"                       }
  - { key: Key1,      mods: Command,       chars: "\x1b1"                       }
  - { key: Key2,      mods: Command,       chars: "\x1b2"                       }
  - { key: Key3,      mods: Command,       chars: "\x1b3"                       }
  - { key: Key4,      mods: Command,       chars: "\x1b4"                       }
  - { key: Key5,      mods: Command,       chars: "\x1b5"                       }
  - { key: Key6,      mods: Command,       chars: "\x1b6"                       }
  - { key: Key7,      mods: Command,       chars: "\x1b7"                       }
  - { key: Key8,      mods: Command,       chars: "\x1b8"                       }
  - { key: Key9,      mods: Command,       chars: "\x1b9"                       }
  - { key: Key0,      mods: Command,       chars: "\x1b0"                       }
  - { key: Space,     mods: Control,       chars: "\x00"                        } # Ctrl + Space
  - { key: Grave,     mods: Command,       chars: "\x1b`"                       } # Command + `
  - { key: Grave,     mods: Command|Shift, chars: "\x1b~"                       } # Command + ~
  - { key: Period,    mods: Alt,       chars: "\x1b."                           } # Command + .
  - { key: Comma,     mods: Alt,       chars: "\x1b,"                           } # Command + ,
  - { key: Key8,      mods: Command|Shift, chars: "\x1b*"                       } # Command + *
  - { key: Key3,      mods: Command|Shift, chars: "\x1b#"                       } # Command + #
  - { key: Period,    mods: Command|Shift, chars: "\x1b>"                       } # Command + >
  - { key: Comma,     mods: Command|Shift, chars: "\x1b<"                       } # Command + <
  - { key: Minus,     mods: Command|Shift, chars: "\x1b_"                       } # Command + _
  - { key: Key5,      mods: Command|Shift, chars: "\x1b%"                       } # Command + %
  - { key: Key6,      mods: Command|Shift, chars: "\x1b^"                       } # Command + ^
  - { key: Backslash, mods: Command,       chars: "\x1b\\"                      } # Command + \
  - { key: Backslash, mods: Command|Shift, chars: "\x1b|"                       } # Command + |
  - { key: Y,         mods: Control,       action: Paste                        }
  - { key: W,         mods: Command,       action: Copy                         }
  - { key: Paste,                          action: Paste                        }
  - { key: Copy,                           action: Copy                         }
  - { key: Q,        mods: Command,        action: Quit                         }
  - { key: Home,                           chars: "\x1bOH",   mode: AppCursor   }
  - { key: Home,                           chars: "\x1b[H",   mode: ~AppCursor  }
  - { key: End,                            chars: "\x1bOF",   mode: AppCursor   }
  - { key: End,                            chars: "\x1b[F",   mode: ~AppCursor  }
  - { key: Key0,     mods: Command,        action: ResetFontSize                }
  - { key: Equals,   mods: Command,        action: IncreaseFontSize             }
  - { key: Minus,    mods: Command,        action: DecreaseFontSize             }
  - { key: PageUp,   mods: Shift,          chars: "\x1b[5;2~"                   }
  - { key: PageUp,   mods: Control,        chars: "\x1b[5;5~"                   }
  - { key: PageUp,                         chars: "\x1b[5~"                     }
  - { key: PageDown, mods: Shift,          chars: "\x1b[6;2~"                   }
  - { key: PageDown, mods: Control,        chars: "\x1b[6;5~"                   }
  - { key: PageDown,                       chars: "\x1b[6~"                     }
  - { key: Tab,      mods: Shift,          chars: "\x1b[Z"                      }
  - { key: Back,                           chars: "\x7f"                        }
  - { key: Back,     mods: Alt,            chars: "\x1b\x7f"                    }
  - { key: Insert,                         chars: "\x1b[2~"                     }
  - { key: Delete,                         chars: "\x1b[3~"                     }
  - { key: Left,     mods: Shift,          chars: "\x1b[1;2D"                   }
  - { key: Left,     mods: Control,        chars: "\x1b[1;5D"                   }
  - { key: Left,     mods: Alt,            chars: "\x1b[1;3D"                   }
  - { key: Left,                           chars: "\x1b[D",   mode: ~AppCursor  }
  - { key: Left,                           chars: "\x1bOD",   mode: AppCursor   }
  - { key: Right,    mods: Shift,          chars: "\x1b[1;2C"                   }
  - { key: Right,    mods: Control,        chars: "\x1b[1;5C"                   }
  - { key: Right,    mods: Alt,            chars: "\x1b[1;3C"                   }
  - { key: Right,                          chars: "\x1b[C",   mode: ~AppCursor  }
  - { key: Right,                          chars: "\x1bOC",   mode: AppCursor   }
  - { key: Up,       mods: Shift,          chars: "\x1b[1;2A"                   }
  - { key: Up,       mods: Control,        chars: "\x1b[1;5A"                   }
  - { key: Up,       mods: Alt,            chars: "\x1b[1;3A"                   }
  - { key: Up,                             chars: "\x1b[A",   mode: ~AppCursor  }
  - { key: Up,                             chars: "\x1bOA",   mode: AppCursor   }
  - { key: Down,     mods: Shift,          chars: "\x1b[1;2B"                   }
  - { key: Down,     mods: Control,        chars: "\x1b[1;5B"                   }
  - { key: Down,     mods: Alt,            chars: "\x1b[1;3B"                   }
  - { key: Down,                           chars: "\x1b[B",   mode: ~AppCursor  }
  - { key: Down,                           chars: "\x1bOB",   mode: AppCursor   }
  - { key: F1,                             chars: "\x1bOP"                      }
  - { key: F2,                             chars: "\x1bOQ"                      }
  - { key: F3,                             chars: "\x1bOR"                      }
  - { key: F4,                             chars: "\x1bOS"                      }
  - { key: F5,                             chars: "\x1b[15~"                    }
  - { key: F6,                             chars: "\x1b[17~"                    }
  - { key: F7,                             chars: "\x1b[18~"                    }
  - { key: F8,                             chars: "\x1b[19~"                    }
  - { key: F9,                             chars: "\x1b[20~"                    }
  - { key: F10,                            chars: "\x1b[21~"                    }
  - { key: F11,                            chars: "\x1b[23~"                    }
  - { key: F12,                            chars: "\x1b[24~"                    }
  - { key: F1,       mods: Shift,          chars: "\x1b[1;2P"                   }
  - { key: F2,       mods: Shift,          chars: "\x1b[1;2Q"                   }
  - { key: F3,       mods: Shift,          chars: "\x1b[1;2R"                   }
  - { key: F4,       mods: Shift,          chars: "\x1b[1;2S"                   }
  - { key: F5,       mods: Shift,          chars: "\x1b[15;2~"                  }
  - { key: F6,       mods: Shift,          chars: "\x1b[17;2~"                  }
  - { key: F7,       mods: Shift,          chars: "\x1b[18;2~"                  }
  - { key: F8,       mods: Shift,          chars: "\x1b[19;2~"                  }
  - { key: F9,       mods: Shift,          chars: "\x1b[20;2~"                  }
  - { key: F10,      mods: Shift,          chars: "\x1b[21;2~"                  }
  - { key: F11,      mods: Shift,          chars: "\x1b[23;2~"                  }
  - { key: F12,      mods: Shift,          chars: "\x1b[24;2~"                  }
  - { key: F1,       mods: Control,        chars: "\x1b[1;5P"                   }
  - { key: F2,       mods: Control,        chars: "\x1b[1;5Q"                   }
  - { key: F3,       mods: Control,        chars: "\x1b[1;5R"                   }
  - { key: F4,       mods: Control,        chars: "\x1b[1;5S"                   }
  - { key: F5,       mods: Control,        chars: "\x1b[15;5~"                  }
  - { key: F6,       mods: Control,        chars: "\x1b[17;5~"                  }
  - { key: F7,       mods: Control,        chars: "\x1b[18;5~"                  }
  - { key: F8,       mods: Control,        chars: "\x1b[19;5~"                  }
  - { key: F9,       mods: Control,        chars: "\x1b[20;5~"                  }
  - { key: F10,      mods: Control,        chars: "\x1b[21;5~"                  }
  - { key: F11,      mods: Control,        chars: "\x1b[23;5~"                  }
  - { key: F12,      mods: Control,        chars: "\x1b[24;5~"                  }
  - { key: F1,       mods: Alt,            chars: "\x1b[1;6P"                   }
  - { key: F2,       mods: Alt,            chars: "\x1b[1;6Q"                   }
  - { key: F3,       mods: Alt,            chars: "\x1b[1;6R"                   }
  - { key: F4,       mods: Alt,            chars: "\x1b[1;6S"                   }
  - { key: F5,       mods: Alt,            chars: "\x1b[15;6~"                  }
  - { key: F6,       mods: Alt,            chars: "\x1b[17;6~"                  }
  - { key: F7,       mods: Alt,            chars: "\x1b[18;6~"                  }
  - { key: F8,       mods: Alt,            chars: "\x1b[19;6~"                  }
  - { key: F9,       mods: Alt,            chars: "\x1b[20;6~"                  }
  - { key: F10,      mods: Alt,            chars: "\x1b[21;6~"                  }
  - { key: F11,      mods: Alt,            chars: "\x1b[23;6~"                  }
  - { key: F12,      mods: Alt,            chars: "\x1b[24;6~"                  }
  - { key: F1,       mods: Command,        chars: "\x1b[1;3P"                   }
  - { key: F2,       mods: Command,        chars: "\x1b[1;3Q"                   }
  - { key: F3,       mods: Command,        chars: "\x1b[1;3R"                   }
  - { key: F4,       mods: Command,        chars: "\x1b[1;3S"                   }
  - { key: F5,       mods: Command,        chars: "\x1b[15;3~"                  }
  - { key: F6,       mods: Command,        chars: "\x1b[17;3~"                  }
  - { key: F7,       mods: Command,        chars: "\x1b[18;3~"                  }
  - { key: F8,       mods: Command,        chars: "\x1b[19;3~"                  }
  - { key: F9,       mods: Command,        chars: "\x1b[20;3~"                  }
  - { key: F10,      mods: Command,        chars: "\x1b[21;3~"                  }
  - { key: F11,      mods: Command,        chars: "\x1b[23;3~"                  }
  - { key: F12,      mods: Command,        chars: "\x1b[24;3~"                  }
''
