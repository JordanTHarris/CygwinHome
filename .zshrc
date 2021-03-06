# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export TERM="xterm-256color"

# Locale
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

#export TEMP64="/c/cygwin64/tmp"
#export TMP64="/c/cygwin64/tmp"
#===============================================================================

# optionally set DEFAULT_USER in ~/.zshrc to your regular username to hide the
# “user@hostname” info when you’re logged in as yourself on your local machine.
DEFAULT_USER=Jordan
#===============================================================================

# Use Vim key bindings
#bindkey -v

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k-custom/powerlevel9k-custom"

# Powerlevel9k Theme Settings:
#===============================================================================
POWERLEVEL9K_MODE='awesome-patched'

# enable the vcs segment in general
POWERLEVEL9K_SHOW_CHANGESET=false
# just show the 6 first characters of changeset
#POWERLEVEL9K_CHANGESET_HASH_LENGTH=6


POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="┌─"
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="└─ "

# segment customization
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vimode)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

#POWERLEVEL9K_MODE='compatible'

# Disable right prompt
#POWERLEVEL9K_DISABLE_RPROMPT=true

# Source Files At Startup:
#===============================================================================
#source ~/Scripts/symlink_drives.sh  # Create symlink for drives at startup
#===============================================================================

# include Z (tool to speed up recent file commands)
. ~/z.sh

# Autoload zsh functions
autoload -Uz zcalc
autoload -Uz zmv

# Cursor color settings:
#===============================================================================
#set_cursor_color() {
#    # Plain iTerm2, no tmux
#    if [[ -n $ITERM_SESSION_ID ]] && [[ -z $TMUX ]]; then
#        printf '\033]Pl%s\033\\' "${1#\#}"
#    else  # Plain xterm or tmux, sequence is the same
#        printf '\033]12;%s\007' "$1"
#    fi
#}
#
## Taken from solarized colors
#export cursorColor="#2ecc71"
#
#zle-line-finish() { set_cursor_color $cursorColor }
#zle-line-init() { zle -K viins ; set_cursor_color $cursorColor }
#
##zle -N zle-keymap-select
#zle -N zle-line-finish
#zle -N zle-line-init
#===============================================================================

#export KEYTIMEOUT=1

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# Keep zsh-syntax-highlighting at the END
plugins=(
    git
    tmux
    web-search
    extract
    dircycle
    ant
#    vi-mode
    vundle
    colored-man
    zsh-syntax-highlighting
    history-substring-search
)

# Fix vi mode's history completion
#bindkey "^[OA" history-incremental-search-backward
#bindkey "^[OB" history-incremental-search-forward
#bindkey "^[[A" up-line-or-history
#bindkey "^[[B" down-line-or-history
#bindkey '^[[A' history-substring-search-up
#bindkey '^[[B' history-substring-search-down
#===============================================================================

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# Use Sublime Text with the command line
#alias subl="open '/c/Program Files/Sublime Text 3/sublime_text.exe'"
#alias nano="subl"

# My aliases
#===============================================================================
# Aliases for quickly handling config files
alias zshconfig="$EDITOR ~/.zshrc"
alias vimconfig="$EDITOR ~/.vimrc"
alias tmuxconfig="$EDITOR ~/.tmux.conf"
alias ideavimconfig="$EDITOR /c/Users/Jordan/.ideavimrc"
alias vsvimconfig="$EDITOR /c/Users/Jordan/.vimrc"
alias sourcezsh="source ~/.zshrc"
alias sourcetmux="tmux source-file ~/.tmux.conf"
#alias ohmyzsh="$EDITOR ~/.oh-my-zsh"

alias open="cygstart"

alias juce="cd /c/Programming/CPPLibraries/JUCE"
alias jucer="open '/c/Programming/CPPLibraries/JUCE/extras/Introjucer/Builds/VisualStudio2015/x64/Release/The Introjucer.exe'"

# ask before permanetely deleting file (use trash instead)
#alias rm='rm -i'
alias vs2015="open '/c/Program Files (x86)/Microsoft Visual Studio 14.0/Common7/IDE/devenv.exe'"
alias vsdiff="'/c/Program Files (x86)/Microsoft Visual Studio 14.0/Common7/IDE/vsDiffMerge.exe'"
#alias vs2013="open '/c/Program Files (x86)/Microsoft Visual Studio 12.0/Common7/IDE/devenv.exe'"
#alias intellij="open '/c/Program Files (x86)/JetBrains/IntelliJ IDEA 14.1.4/bin/idea64.exe'"
	# open Inbox by GMail
alias inbox="open '/c/Program Files (x86)/Google/Chrome/Application/chrome.exe' --new-tab-page-4 https://inbox.google.com/"
alias chrome="open '/c/Program Files (x86)/Google/Chrome/Application/chrome.exe' --new-tab-page-4"
alias cls="clear; clear;"
alias openhere="explorer ."		#open current directory in Windows Explorer

# Reset and sync local repository with remote branch, making it a "mirror image" of the remote
# (master). (!) This will destroy any local changes in the current branch
alias mirrorremote="git fetch origin && git reset --hard origin/master && git clean -f -d"

alias admin="cygstart --action=runas"

alias idearc="source ~/.ideazshrc"
#===============================================================================

# Command line calculator function:
calc(){ awk "BEGIN{ print $* }" ;}

# Open IntelliJ IDEA with a path to an IntelliJ project
function idea () {
    if (( $# == 0 )) then
        open '/c/Program Files (x86)/JetBrains/IntelliJ IDEA 14.1.4/bin/idea64.exe'
        return 1
    fi
    open "/c/Program Files (x86)/JetBrains/IntelliJ IDEA 14.1.4/bin/idea64.exe " "$(cygpath -aw $*)"
}

# Create a server with Browsersync for a single html file and sync it on saves.
function sync-single() {
    if (( $# == 0 )) then
        echo "Uses Browsersync to start a server and sync a"
        echo "single file with the browser.\n"
        echo "Example usage: \n\tsync-single \"index.html\""
        return 1
    else
        browser-sync start --server --files="$1" --index="$1"
    fi
}
#===============================================================================

# Plugin settings:

# History-Substring-Search plugin settings
setopt HIST_IGNORE_ALL_DUPS
#-------------------------------------------------------------------------------

# Vim SuperMan plugin settings

vman() {
  vim -c "SuperMan $*"

  if [ "$?" != "0" ]; then
    echo "No manual entry for $*"
  fi
}
#===============================================================================

# Zsh Completion:

# Use completion of man command with vman
compdef vman="man"
#-------------------------------------------------------------------------------

# Completion for Tmuxinator
source ~/.gem/ruby/gems/tmuxinator-0.6.11/completion/tmuxinator.zsh
#===============================================================================

# Autostart Tmux with default Tmux layout (Tmuxinator)
# if [ -z "$TMUX" ]; then
#   mux default
# fi
#===============================================================================

# Load "default" Tmux config using Tmuxinator
# mux default
