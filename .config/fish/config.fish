set -U fish_greeting "🐟"

set PATH $PATH /opt/homebrew/bin


if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

# aliases
alias vim='nvim'
alias vi='nvim'
alias r='ranger'
alias ls='exa'
alias dots='~/scripts/dots.sh'
alias tim='~/bin/tim'

# functions
function cd..
  cd ..
end

function sudo
  if test "$argv" = !!
    eval command sudo $history[1]
  else
    command sudo $argv
  end
end
