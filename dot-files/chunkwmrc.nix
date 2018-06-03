{}:''
#!/bin/bash

chunkc core::log_file stdout
chunkc core::log_level warn
chunkc core::plugin_dir ~/.chunkwm_plugins
chunkc core::hotload 0

chunkc set global_desktop_mode           bsp
chunkc set global_desktop_offset_top     0
chunkc set global_desktop_offset_bottom  0
chunkc set global_desktop_offset_left    0
chunkc set global_desktop_offset_right   0
chunkc set global_desktop_offset_gap     0

chunkc set desktop_padding_step_size     10.0
chunkc set desktop_gap_step_size         5.0

chunkc set bsp_spawn_left                1
chunkc set bsp_optimal_ratio             1.618
chunkc set bsp_split_mode                optimal
chunkc set bsp_split_ratio               0.5

chunkc set monitor_focus_cycle           1
chunkc set window_focus_cycle            monitor

chunkc set mouse_follows_focus           intrinsic
chunkc set window_float_next             0
chunkc set window_region_locked          1

chunkc set mouse_move_window             \"fn 1\"
chunkc set mouse_resize_window           \"fn 2\"
chunkc set mouse_motion_interval         35

chunkc set preselect_border_color        0xffd75f5f
chunkc set preselect_border_width        5

chunkc set window_float_topmost          0
chunkc set window_fade_inactive          0
chunkc set window_fade_alpha             0.85
chunkc set window_fade_duration          0.25
chunkc set window_use_cgs_move           0

chunkc set focused_border_color          0xff0f6288
chunkc set focused_border_width          1
chunkc set focused_border_radius         0
chunkc set focused_border_skip_floating  0

chunkc set ffm_bypass_modifier           fn

chunkc core::load border.so
chunkc core::load tiling.so
chunkc core::load ffm.so

chunkc tiling::rule --owner Finder --name Copy --state float
chunkc tiling::rule --owner \"App Store\" --state float
chunkc tiling::rule --owner Emacs --except "^$" --state tile
chunkc tiling::rule --owner \"Microsoft Outlook\" --subrole AXStandardWindow --state tile
chunkc tiling::rule --owner Terminal --except "^$" --state tile
chunkc tiling::rule --owner \"System Preferences\" --subrole AXStandardWindow --state tile
''
