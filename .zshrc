# 1. ENVIRONMENT & PATH
export KEQING_DOTS_ROOT="$HOME/keqing-dots"
export -U PATH="$HOME/.local/bin:$PATH"

# 2. SHELL OPTIONS & HISTORY
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt appendhistory
typeset -g _hist_cmd=""
zshaddhistory() { return 1; }
preexec() { _hist_cmd="$1"; }
precmd() {
  local s=$?
  [[ $s -eq 0 && -n "$_hist_cmd" ]] && print -s -- "$_hist_cmd"
  _hist_cmd=""
}

# 3. AUTOCOMPLETION & PLUGINS
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# 4. CORE FUNCTIONS
validate() { command -v $1 > /dev/null 2>&1; }
fetch() { validate fastfetch && fastfetch; }
message() {
  printf '\e[38;2;154;96;212m'
  cat <<'EOF' | sed 's/^/      /'

    __ __                     _                  
   / //_/   ___     ____ _   (_)  ____     ____ _
  / ,<     / _ \   / __ `/  / /  / __ \   / __ `/
 / /| |   /  __/  / /_/ /  / /  / / / /  / /_/ /
/_/ |_|   \___/   \__, /  /_/  /_/ /_/   \__, /
                    /_/                 /____/
      
EOF
  printf '\e[0m'
}
greet() { [[ -z "$TERM_PROGRAM" && -z "$TERMINAL_EMULATOR" ]] && { message; fetch; }; }
clear() { command clear 2>/dev/null || printf '\033[H\033[2J\033[3J'; greet; }

# 5. DEVELOPMENT TOOLS
clearpycache() { find . -type d -name "__pycache__" -exec rm -rf {} +; }

own-code() {
  sudo chown -R $USER /opt/vscodium-bin/resources/app/out
}

run() {
  local filename="$1" compiler="g++"
  [[ "$filename" == *.c ]] && compiler="gcc"
  $compiler "$filename" -o main && ./main
}

autologin-log() { validate bat && bat /tmp/login-$UID.log; }

# 7. ALIASES
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias update="$KEQING_DOTS_ROOT/scripts/update"

# 8. EXTERNAL SOURCING
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
CONDA_SRC="/opt/miniconda3/etc/profile.d/conda.sh"
[ -f "$CONDA_SRC" ] && source "$CONDA_SRC"
for f in "$KEQING_DOTS_ROOT/source/"*.sh(N); do source "$f"; done

# 9. STARTUP EXECUTION
greet

# 10. EXTERNAL TOOL INITIALIZATION
validate starship && eval "$(starship init zsh)"
validate zoxide && eval "$(zoxide init zsh --cmd cd)"
