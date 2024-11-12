# Slavic Theme for Zsh, forked and adapted from Toaster theme

# Define colors
__slavic_color_orange="%F{214}"
__slavic_color_blue="%F{81}"
__slavic_color_green="%F{46}"
__slavic_color_yellow="%F{229}"
__slavic_color_pink="%F{197}"
__slavic_color_grey="%F{237}"
__slavic_color_white="%F{255}"
__slavic_color_purple="%F{141}"
__slavic_color_lilac="%F{183}"

# Function to print colored text
__slavic_color_echo() {
  echo -n "${1}${2}%f"
}

# Function to get current folder
__slavic_current_folder() {
  if [[ "$PWD" == "/" ]]; then
    echo -n "/"
  else
    basename "$PWD"
  fi
}

# Function to get git status codes
__slavic_git_status_codes() {
  git status --porcelain 2>/dev/null | sed -E 's/(^.{3}).*/\1/' | tr -d ' \n'
}

# Function to get git branch name
__slavic_git_branch_name() {
  git rev-parse --abbrev-ref HEAD 2>/dev/null
}

# Function to display a rainbow icon based on status
__slavic_rainbow() {
  if [[ "$1" == *"$3"* ]]; then
    __slavic_color_echo "$2" "彡ミ"
  fi
}

# Function to display git status icons
__slavic_git_status_icons() {
  local git_status="$(__slavic_git_status_codes)"

  __slavic_rainbow "$git_status" "$__slavic_color_pink" 'D'
  __slavic_rainbow "$git_status" "$__slavic_color_orange" 'R'
  __slavic_rainbow "$git_status" "$__slavic_color_white" 'C'
  __slavic_rainbow "$git_status" "$__slavic_color_green" 'A'
  __slavic_rainbow "$git_status" "$__slavic_color_blue" 'U'
  __slavic_rainbow "$git_status" "$__slavic_color_lilac" 'M'
  __slavic_rainbow "$git_status" "$__slavic_color_grey" '?'
}

# Function to display git status
__slavic_git_status() {
  local branch_name="$(__slavic_git_branch_name)"

  # Check if inside a git repository
  if [[ -n "$branch_name" ]]; then
    __slavic_color_echo "$__slavic_color_blue" " ☭ "
    __slavic_color_echo "$__slavic_color_white" "$branch_name"

    if [[ -n "$(__slavic_git_status_codes)" ]]; then
      __slavic_color_echo "$__slavic_color_pink" ' ●'
      __slavic_color_echo "$__slavic_color_white" ' (^._.^)ﾉ'
      __slavic_git_status_icons
    else
      __slavic_color_echo "$__slavic_color_green" ' ○'
    fi
  fi
}

# Zsh mode prompt (similar to fish_mode_prompt)
zsh_mode_prompt() {
  printf "%b[" "$__slavic_color_lilac"
  case $KEYMAP in
    vicmd)
      printf "%b" "%F{red}n"
      ;;
    main|viins)
      printf "%b" "%F{green}i"
      ;;
    visual)
      printf "%b" "%F{magenta}v"
      ;;
    *)
      printf "%b" "%F{yellow}?"
      ;;
  esac
  printf "%b] " "$__slavic_color_lilac"
}

# Main prompt function with proper line handling
PROMPT='%{$(__slavic_color_echo "$__slavic_color_purple" "$(__slavic_current_folder)")%} '
PROMPT+='$(__slavic_git_status)'
PROMPT+='%E'  # End of line
PROMPT+=$'\n'  # Add a proper newline
PROMPT+='%{$(__slavic_color_echo "$__slavic_color_pink" "⫸ ")%} '
PROMPT_EOL_MARK=""  # Disable end-of-line marker


