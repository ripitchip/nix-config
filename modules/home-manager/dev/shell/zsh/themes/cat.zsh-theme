# Colors
slavic_color_orange='%F{208}'  # FD971F
slavic_color_blue='%F{81}'     # 6EC9DD
slavic_color_green='%F{118}'   # A6E22E
slavic_color_yellow='%F{222}'  # E6DB7E
slavic_color_pink='%F{199}'    # F92672
slavic_color_grey='%F{240}'    # 554F48
slavic_color_white='%F{15}'    # F1F1F1
slavic_color_purple='%F{141}'  # 9458FF
slavic_color_lilac='%F{183}'   # AE81FF
reset_color='%f'
local user_symbol='⫸'

# Echo with color
slavic_color_echo() {
  echo -n "${1}${2}${reset_color}"
}

# Current folder name
slavic_current_folder() {
  if [[ $PWD == '/' ]]; then
    echo '/'
  else
    basename "$PWD"
  fi
}

# Git status codes
slavic_git_status_codes() {
  git status --porcelain 2>/dev/null | sed -E 's/(^.{3}).*/\1/' | tr -d ' \n'
}

# Git branch name
slavic_git_branch_name() {
  git rev-parse --abbrev-ref HEAD 2>/dev/null
}

# Rainbow for git status
slavic_rainbow() {
  if [[ "$1" == *"$3"* ]]; then
    slavic_color_echo "$2" "彡ミ"
  fi
}

# Git status icons
slavic_git_status_icons() {
  local git_status=$(slavic_git_status_codes)

  slavic_rainbow "$git_status" "$slavic_color_pink" 'D'
  slavic_rainbow "$git_status" "$slavic_color_orange" 'R'
  slavic_rainbow "$git_status" "$slavic_color_white" 'C'
  slavic_rainbow "$git_status" "$slavic_color_green" 'A'
  slavic_rainbow "$git_status" "$slavic_color_blue" 'U'
  slavic_rainbow "$git_status" "$slavic_color_lilac" 'M'
  slavic_rainbow "$git_status" "$slavic_color_grey" '?'
}

# Git status prompt
slavic_git_status() {
  local branch_name=$(slavic_git_branch_name)

  if [[ -n "$branch_name" ]]; then
    slavic_color_echo "$slavic_color_blue" " ☭ "
    slavic_color_echo "$slavic_color_white" "$branch_name"

    if [[ -n $(slavic_git_status_codes) ]]; then
      slavic_color_echo "$slavic_color_pink" ' ●'
      slavic_color_echo "$slavic_color_white" ' (^._.^)ﾉ'
      slavic_git_status_icons
    else
      slavic_color_echo "$slavic_color_green" ' ○'
    fi
  fi
}

# Mode prompt (not typically in Zsh, but here's a rough equivalent)
fish_mode_prompt() {
  echo -n "$slavic_color_lilac["
  case $KEYMAP in
    vicmd) echo -n "%F{red}n" ;;   # Normal mode in vim
    viins) echo -n "%F{green}i" ;; # Insert mode in vim
    main|*) echo -n "%F{green}i" ;; # Default to insert
  esac
  echo -n "$slavic_color_lilac]$reset_color "
}

# Main prompt
PROMPT='%{$(slavic_color_echo $slavic_color_purple "$(slavic_current_folder)")%}$(slavic_git_status)
$(slavic_color_echo $slavic_color_pink "⫸ '")'


