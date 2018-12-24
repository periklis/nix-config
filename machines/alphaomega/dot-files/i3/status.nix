{}: ''
theme = "solarized-dark"
icons = "awesome"

[[block]]
block = "backlight"
device = "intel_backlight"

[[block]]
block = "battery"
interval = 10
show = "both"

[[block]]
block = "disk_space"
path = "/"
alias = "/"
info_type = "available"
unit = "GB"
interval = 20
warning = 20.0
alert = 10.0

[[block]]
block = "memory"
display_type = "memory"
format_mem = "{Mup}%"
format_swap = "{SUp}%"

[[block]]
block = "cpu"
interval = 1

[[block]]
block = "load"
interval = 1
format = "{1m}"

[[block]]
block = "sound"

[[block]]
block = "time"
interval = 60
format = "%a %Y-%m-%d %R"
''
