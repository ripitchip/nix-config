{ pkgs, ... }:
{
  home.packages = with pkgs; [
    tmux
    tmuxinator
  ];
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      cpu
      open
      yank
      battery
      {
        plugin = mkTmuxPlugin {
          pluginName = "tmux-battery";
          version = "5c52d4f";
          src = pkgs.fetchFromGitHub {
            owner = "tmux-plugins";
            repo = "tmux-battery";
            rev = "48fae59ba4503cf345d25e4e66d79685aa3ceb75";
            sha256 = "yKMTuRiNnGC3tAbZeWzMEudzhBSJhji8sZh96rFxpb8=";
          };
        };
      }
      sensible
      resurrect
      mode-indicator
      online-status
      vim-tmux-navigator
      copycat
    ];
    extraConfig = ''
      #################################### COLORS ###################################
      color_bg="#2e323b"
      color_fg="#282c34"
      color_green="#98c379"
      color_yellow="#e5c07b"
      color_red="#e06c75"
      color_blue="#61afef"
      color_cyan="#56b6c2"
      color_purple="#c678dd"
      color_gray="#5c6370"
      color_buffer="#939aa3"
      color_selection="#3e4452"
      color_light_gray="#5c6370"
      #################################### PLUGINS ###################################

      mode_separator=""
      set -g @mode_indicator_empty_prompt " TMUX #[default]#[fg=$color_fg]$mode_separator"
      set -g @mode_indicator_empty_mode_style fg=$color_purple,bold
      set -g @mode_indicator_prefix_prompt " TMUX #[default]#[fg=$color_blue]$mode_separator"
      set -g @mode_indicator_prefix_mode_style fg=$color_bg,bg=$color_blue,bold
      set -g @mode_indicator_copy_prompt " COPY #[default]#[fg=$color_green]$mode_separator"
      set -g @mode_indicator_copy_mode_style fg=$color_bg,bg=$color_green,bold
      set -g @mode_indicator_sync_prompt " SYNC #[default]#[fg=$color_red]$mode_separator"
      set -g @mode_indicator_sync_mode_style fg=$color_bg,bg=$color_red,bold

      # tmux cpu
      set -g @cpu_percentage_format "%3.0f%%"

      # tmux-online-status
      set -g @route_to_ping "vultr.net"   # Use a UK based site to ping
      set -g @online_icon "#[fg=$color_gray]"
      set -g @offline_icon "#[fg=$color_red]"

      # tmux-pomodoro
      set -g @pomodoro_on "  #[fg=$color_red] "
      set -g @pomodoro_complete "  #[fg=$color_green] "
      set -g @pomodoro_pause "  #[fg=$color_yellow] "
      set -g @pomodoro_prompt_break "  #[fg=$color_green] ?"
      set -g @pomodoro_prompt_pomodoro "  #[fg=$color_red] ?"
      set -g @pomodoro_interval_display "#[fg=$color_gray]|#[fg=italics]%s"

      # tmux-battery
      set -g @batt_icon_charge_tier8 ""
      set -g @batt_icon_charge_tier7 ""
      set -g @batt_icon_charge_tier6 ""
      set -g @batt_icon_charge_tier5 ""
      set -g @batt_icon_charge_tier4 ""
      set -g @batt_icon_charge_tier3 ""
      set -g @batt_icon_charge_tier2 ""
      set -g @batt_icon_charge_tier1 ""

      set -g @batt_icon_status_charged " "
      set -g @batt_icon_status_charging "  "
      set -g @batt_icon_status_discharging " "
      set -g @batt_icon_status_attached " "
      set -g @batt_icon_status_unknown " "

      set -g @batt_remain_short true

      #################################### OPTIONS ###################################

      set -g status on
      set -g status-justify centre
      set -g status-position bottom
      set -g status-left-length 90
      set -g status-right-length 90
      set -g status-style "bg=$color_fg"
      # set -g window-style ""
      # set -g window-active-style ""

      set -g pane-active-border fg=$color_gray
      set -g pane-border-style fg=$color_gray

      set -g message-style bg=$color_blue,fg=$color_bg
      setw -g window-status-separator "   "
      set-window-option -g mode-style bg=$color_purple,fg=$color_bg

      #################################### FORMAT ####################################

      set -g status-left "#{tmux_mode_indicator} #{online_status}  #[fg=$color_gray]%R#{pomodoro_status}"
      set -g status-right "#[fg=$color_gray]#{battery_icon_charge}  #{battery_percentage}#{battery_icon_status}#{battery_remain}  CPU:#{cpu_percentage} "
      setw -g window-status-format "#[fg=$color_gray,italics]#I: #[noitalics]#W"
      setw -g window-status-current-format "#[fg=$color_purple,italics]#I: #[fg=$color_buffer,noitalics,bold]#W"


      #################################### KEYBINDING ###################################
      unbind C-b
      set-option -g prefix C-space
      bind-key C-space send-prefix
      # set -ag terminal-overrides ",screen-256color:colors=256:Tc:Ms=\\E]52;c;%p2%s\\7"
      set -g set-clipboard on


      set -g @pomodoro_toggle 'p'
      set -g @pomodoro_cancel 'P'
      set -g @pomodoro_repeat 'off'
      set -g @pomodoro_notifications 'on'
      set -g @pomodoro_sound 'Pop'
      set -g status-right "#(pomodoro_status)"

      setw -g mode-keys vi
      set -g mouse on
      bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'select-pane -t=; copy-mode -e; send-keys -M'"
      bind -n WheelDownPane select-pane -t= \; send-keys -M
      bind -n C-WheelUpPane select-pane -t= \; copy-mode -e \; send-keys -M
      bind -T copy-mode-vi    C-WheelUpPane   send-keys -X halfpage-up
      bind -T copy-mode-vi    C-WheelDownPane send-keys -X halfpage-down
      bind -T copy-mode-emacs C-WheelUpPane   send-keys -X halfpage-up
      bind -T copy-mode-emacs C-WheelDownPane send-keys -X halfpage-down

      # To copy, left click and drag to highlight text in yellow, 
      # once you release left click yellow text will disappear and will automatically be available in clibboard
      # # Use vim keybindings in copy mode
      setw -g mode-keys vi
      # Update default binding of `Enter` to also use copy-pipe
      unbind -T copy-mode-vi Enter
      bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "xclip -selection c"
      bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "xclip -in -selection clipboard"
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -i'
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -i'
      setw -q -g utf8 on
      set -g default-terminal "tmux-256color"
      set-option -sa terminal-overrides ",xterm*:Tc"

      set -g mouse on
      set -sg repeat-time 500
      set -g base-index 1
      setw -g pane-base-index 1
      setw -g automatic-rename on
      set -g renumber-windows on
      set -g set-titles on
    '';
  };
}
