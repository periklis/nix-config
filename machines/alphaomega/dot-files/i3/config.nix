{alsaUtils, light}: ''
# i3 config file (v4)
#
# Please see https://i3wm.org/docs/userguide.html for a complete reference!

set $mod Mod4

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
font pango:Hack 10

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# Make the currently focused window a scratchpad
bindsym $mod+Shift+minus move scratchpad

# Show the first scratchpad window
bindsym $mod+minus scratchpad show

# Take a screenshot
bindsym Ctrl+Print exec scrot '%Y-%m-%d-%s_screenshot_$wx$h.jpg' -e 'mv $f ~/Pictures/'

# start a terminal
bindsym $mod+Return exec alacritty

# kill focused window
bindsym $mod+Shift+q kill

# start dmenu (a program launcher)
bindsym $mod+d exec "rofi -show combi"

# change focus
bindsym $mod+h focus left
bindsym $mod+l focus right
bindsym $mod+j focus up
bindsym $mod+k focus down
bindsym $mod+semicolon focus right

# move focused window
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Right move right
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+semicolon move right

# split in horizontal orientation
bindsym $mod+Shift+h split h

# split in vertical orientation
bindsym $mod+Shift+v split v

# enter fullscreen mode for the focused container
bindsym $mod+shift+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+Shift+s layout stacking
bindsym $mod+Shift+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
bindsym $mod+z focus child

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# switch to workspace
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8
bindsym $mod+9 workspace $ws9
bindsym $mod+0 workspace $ws10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3
bindsym $mod+Shift+4 move container to workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5
bindsym $mod+Shift+6 move container to workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8
bindsym $mod+Shift+9 move container to workspace $ws9
bindsym $mod+Shift+0 move container to workspace $ws10

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# lock screen
bindsym $mod+Shift+l exec "i3lock-fancy"
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

bindcode 121 exec --no-startup-id ${alsaUtils}/bin/amixer -q sset Master toggle
bindcode 122 exec --no-startup-id ${alsaUtils}/bin/amixer -q sset Master 5%-
bindcode 123 exec --no-startup-id ${alsaUtils}/bin/amixer -q sset Master 5%+
bindcode 198 exec --no-startup-id ${alsaUtils}/bin/amixer -q sset Capture toggle
bindcode 232 exec --no-startup-id ${light}/bin/light -U 5
bindcode 233 exec --no-startup-id ${light}/bin/light -A 5
bindcode 245 exec --no-startup-id /run/wrappers/bin/bluetooth toggle

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym semicolon resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}

bindsym $mod+r mode "resize"

mode "screen" {
        bindsym o exec --no-startup-id grobi apply Office
        bindsym h exec --no-startup-id grobi apply HomeOffice
        bindsym m exec --no-startup-id grobi apply Mobile
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindcode 235 mode "default"
}

bindcode 235 mode "screen"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
    font pango:DejaVu Sans Mono, FontAwesome 12
    position bottom
    status_command i3status-rs ~/.config/i3/status.toml
    binding_mode_indicator yes
    colors {
        separator #666666
        background #222222
        statusline #dddddd
        focused_workspace #0088CC #0088CC #ffffff
        active_workspace #333333 #333333 #ffffff
        inactive_workspace #333333 #333333 #888888
        urgent_workspace #2f343a #900000 #ffffff
    }
}

assign [class="Firefox"] 1
assign [class="Emacs"] 2
assign [class="Slack"] 3

exec --no-startup-id firefox
exec --no-startup-id emacs
exec --no-startup-id slack
''
