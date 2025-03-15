#!/bin/sh

# profile file, runs on login. Environmental variables are set here

# add all directories in '~/.local/bin' to $PATH
export PATH="$HOME/.local/bin:$PATH"

unsetopt PROMPT_SP 2>/dev/null

# default programs:
export EDITOR="e"
export TERMINAL="kitty"
export TERMINAL_PROG="kitty"
export BROWSER="firefox"

# ~/ clean-up:
# xdg directories:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
# zsh:
export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_STATE_HOME/history"

# x11, graphical environment:
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/settings.ini"
export XMODMAPRC="$HOME/.config/x11/xmodmap"

# other:
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_DATA_HOME/go/mod"
export GARGO_HOME="$XDG_DATA_HOME/cargo"
export UNISON="$XDG_DATA_HOME/unison"
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"

export LESSHISTFILE="$XDG_DATA_HOME/less/history"
export LESSKEY="$XDG_DATA_HOME/less/keys"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='p:preview-tui'
export USE_PISTOL=1
alias nnn='nnn -Pp'

# general program settings:
export LESS="R"
export LESSOPEN="| /usr/bin/highlight -0 ansi %s 2>/dev/null"
export MOZ_USE_XINPUT2=1
export BAT_THEME="ansi"

if [ -f ~/.config/x11/.xmodmap ]; then
  xmodmap ~/.config/x11/.xmodmap
fi

# loading shortcuts:
[ ! -f "$XDG_CONFIG_HOME/shell/shortcutrc" ] && setsid -f shortcuts >/dev/null 2>&1
