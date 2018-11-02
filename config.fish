# ~/.config/fish/config.fish

#. ~/.config/fish/fish_prompt.fish

set fish_greeting '' # turn off greeting

function fish_title;end

alias vi 'vim'

bind yy fish_clipboard_copy
bind Y fish_clipboard_copy
bind p fish_clipboard_paste

set -g theme_color_scheme solarized-dark

fish_vi_key_bindings
set -U theme_nerd_fonts no
set -g theme_display_git_master_branch yes
