# Hello message
echo "\n---------------------------"
echo " Hello from MacBook .zshrc"
echo " brew update updates the above downloaded git repository with the latest code from GitHub."
echo " brew upgrade updates the actual packages to match the versions in the updated local git repository."
echo " copybuffer - control + o to copy buffer of current line before exec"
echo " use Ctrl + XX to move between current position and start of line"
echo " diff -r --side-by-side seq.txt seq2.txt "
echo ' ls -laR or ls -lAR'
echo " ping -c 3 google.com"
echo "---------------------------\n"
head -2 bible_verse

# Make vim my EDITOR permanenty
export EDITOR=vim
export VISUAL=vim

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.  Initialization code that may require console input (password prompts, [y/n] confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/leedre/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
   zsh-autosuggestions
   copydir
   # dirhistory
   copyfile
   # Use copybuffer from current command line with ctrl + o
   copybuffer
   web-search
   # vi-mode
)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#===============================================================
#=========================== Alias =============================
#===============================================================
#ls alias
# alias l='ls -AF' # -A list all entries except for . and .. and sets for super user
# alias l='ls -CF' # -A list all entries except for . and .. and sets for super user
# alias ll='ls -alF'
# alias la='ls -A'
# alias l='ls -AF' # -A list all entries except for . and .. and sets for super user
# alias l='ls -C'  #-C force multi-column output and -f means output is not sorted
# alias l='ls -Cf'  #-C force multi-column output and -f means output is not sorted

# New alias that I copied from kali linux zshrc file
alias ll='ls -lahF'
alias la='ls -AF'
alias l='ls -CF'
alias li='ls -shitF'
alias lm='ls -ltr'
alias lss='ls -R'

# ls alias for exa
# alias l='exa'
# alias la='exa -a'
# alias ll='exa -lah'
# alias ls='exa --color=auto'
# alias ls='ls --classify --tabsize=0 --group-directories-first --literal --color=auto --show-control-chars --human-readable'

# bat replaces less for better syntax and highlighting
alias less='bat'

# Copy the PWD to the clipboard using pbcopy app
alias cpwd="pwd | tr -d '\n' | pbcopy && echo 'pwd copied to clipboard'"

# Create a folder and cd into it
function mkcd() { mkdir -p "$@" && "$_"; }

# Confirmation when moving or removing files
# verbose  flag displays message
alias mv='mv -vn'
alias rm='rm -iv'

#==============================================================
#======================== Git Alias ===========================
#==============================================================
# Create alias for git commands
# alias gdca - git diff --cached
# gpf! - git push --force
# grhh - git reset --hard
alias gs='git status -sb'    # Displays 2 lines with branch and untracked file
alias gss='git status'
alias gpull='git pull'
alias gpush='git push'
alias gaa='git add .'
alias gd='git diff | mate'
#alias gau='git add --update'
#alias gc='git commit -m'
alias gc='git commit -v'      # -v flag aka --verbose shows the diff of the change
alias gca='git commit -v -a'
alias gb='git --no-pager branch'
alias gba='git --no-pager  branch -a'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcot='git checkout -t'
alias gcotb='git checkout --track -b'
alias glr='git --no-pager log --oneline'
alias gl='git --no-pager log --oneline --reverse'
alias gcd='git checkout -'
#alias gll='git log --oneline --decorate --graph'
alias gll='git --no-pager log'
#alias glogp='git log --pretty=format:"%h %s" --graph'
#alias glog='git --no-pager log -n 20 --pretty=format:%h%x09%an%x09%ad%x09%s --date=short --no-merges'
alias glog='git rev-list --all --pretty=oneline'


#==============================================================
#======================== Folder Alias ========================
#==============================================================

# Alias to open .zshrc from any pwd
alias zrc="$EDITOR $HOME/.zshrc"

# Alias to open .vimrc from any pwd
alias vrc="$EDITOR $HOME/.vimrc"

# Source ~/.zshrc
# Or type exec zsh in command line
alias so="source $HOME/.zshrc"

# Move pwd to $HOME
alias h="cd $HOME/"

# Shortcut for cd ..
alias b="cd ../"

# Change directory to MacOS downloads folder
alias dl="cd /Users/leedre/Downloads"

# Change directory to run control folder
alias dot="cd $HOME/.config/dot_files"

# Change directory to config folder
alias cf="cd $HOME/.config"

# Change directory to last accessed folder just like alt + d function in CLUT extension
alias d="cd -"

# Alias cat to bat
alias cat='bat --style=plain'

# Alias c to cat
alias c='bat'

# Alias for yabai folder
alias ybf='cd $HOME/.config/yabai'

# Alias for yabairc
alias ybrc="cd $HOME/.config/yabai ; vim yabairc"

# Alias for skhd folder
alias skf='cd $HOME/.config/skhd'

# Alias for skhdrc
alias skrc="cd $HOME/.config/skhd ; vim skhdrc "

# Brew services start and stop alias for yabai
alias start='brew services start yabai'
alias stop='brew services stop yabai'

# Alias reload yabai
alias reload="stop && start"

# Alias syntax
# alias <flag> <alias_name>="command"

# Run last command
# alias again="!!"

# Get ip address for macos
alias ipadd="ipconfig getifaddr en0"

# Plugin vi-mode 
# VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
# VI_MODE_SET_CURSOR=true

# Warning: Homebrew's sbin was not found in your PATH but you have installed
# The fix was this:
export PATH="/usr/local/sbin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Sources zsh shell syntax highlighting which must be at the end of the file
# source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /Users/leedre/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $ZSH/oh-my-zsh.sh
