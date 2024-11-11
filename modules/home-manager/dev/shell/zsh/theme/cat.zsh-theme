# Colors
COLOR_ORANGE='%F{208}'  # FD971F
COLOR_BLUE='%F{81}'     # 6EC9DD
COLOR_GREEN='%F{118}'   # A6E22E
COLOR_YELLOW='%F{222}'  # E6DB7E
COLOR_PINK='%F{199}'    # F92672
COLOR_GREY='%F{240}'    # 554F48
COLOR_WHITE='%F{15}'    # F1F1F1
COLOR_PURPLE='%F{141}'  # 9458FF
COLOR_LILAC='%F{183}'   # AE81FF
RESET_COLOR='%f'
USER_SYMBOL='⫸'

# Helper function for colored echo
color_echo() {
  echo -n "${1}${2}${RESET_COLOR}"
}

# Display the current folder name
current_folder() {
  [[ $PWD == '/' ]] && echo '/' || basename "$PWD"
}

# Get git status and branch name
git_status() {
  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  local status=$(git status --porcelain 2>/dev/null | tr -d ' \n')

  [[ -n "$branch" ]] && {
    color_echo "$COLOR_BLUE" " ☭ "
    color_echo "$COLOR_WHITE" "$branch"

    if [[ -n "$status" ]]; then
      color_echo "$COLOR_PINK" ' ●'
      color_echo "$COLOR_WHITE" ' (^._.^)ﾉ'
      git_status_icons "$status"
    else
      color_echo "$COLOR_GREEN" ' ○'
    fi
  }
}

# Display git status icons based on the status codes
git_status_icons() {
  local status="$1"
  [[ "$status" == *'D'* ]] && color_echo "$COLOR_PINK" "彡ミ"
  [[ "$status" == *'R'* ]] && color_echo "$COLOR_ORANGE" "彡ミ"
  [[ "$status" == *'C'* ]] && color_echo "$COLOR_WHITE" "彡ミ"
  [[ "$status" == *'A'* ]] && color_echo "$COLOR_GREEN" "彡ミ"
  [[ "$status" == *'U'* ]] && color_echo "$COLOR_BLUE" "彡ミ"
  [[ "$status" == *'M'* ]] && color_echo "$COLOR_LILAC" "彡ミ"
  [[ "$status" == *'?'* ]] && color_echo "$COLOR_GREY" "彡ミ"
}

# Main prompt setup
PROMPT='%{$(color_echo $COLOR_PURPLE "$(current_folder)")%}$(git_status)
$(color_echo $COLOR_PINK "$USER_SYMBOL ")'

