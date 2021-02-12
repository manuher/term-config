# ~/.config/fish/config.fish

#. ~/.config/fish/fish_prompt.fish

set fish_greeting '' # turn off greeting

function fish_title;end

alias vi 'nvim'
alias vim 'nvim'

bind yy fish_clipboard_copy
bind Y fish_clipboard_copy
bind p fish_clipboard_paste

set -g theme_color_scheme terminal2

fish_vi_key_bindings
set -U theme_nerd_fonts yes
set -g theme_display_git_master_branch yes

set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell"
    source "$BASE16_SHELL/profile_helper.fish"
end

function git-prune
  git remote prune origin
  git fetch -p && for branch in (git branch -vv | grep ': gone]' | awk '{print $1}'); git branch -D $branch; end
end
