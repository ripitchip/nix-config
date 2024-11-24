{ lib, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions =
      with pkgs.vscode-extensions;
      [
        ms-toolsai.jupyter
        ms-toolsai.vscode-jupyter-slideshow
        ms-toolsai.jupyter-renderers
        esbenp.prettier-vscode
        charliermarsh.ruff
        dbaeumer.vscode-eslint
        davidanson.vscode-markdownlint
        formulahendry.auto-rename-tag
        aaron-bond.better-comments
        naumovs.color-highlight
        ms-toolsai.datawrangler
        ms-python.python
        ms-python.black-formatter
        unifiedjs.vscode-mdx
        yzhang.markdown-all-in-one
        ms-vscode.cpptools
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "auto-close-tag";
          publisher = "formulahendry";
          version = "0.5.5"; # Update to the latest version
          sha256 = "gtwKmCk9LcWtr+oJ7DUK+Zv1824aZdVOqkEe2YplE9I="; # lib.fakeSha256;
        }
        {
          name = "platformio-ide";
          publisher = "platformio";
          version = "3.3.3"; # Update to the latest version
          sha256 = "d8kwQVoG/MOujmvMaX6Y0wl85L2PNdv2EnqTZKo8pGk="; # lib.fakeSha256;
        }
        {
          name = "vs-code-prettier-eslint";
          publisher = "rvest";
          version = "6.0.0"; # Update to the latest version
          sha256 = "PogNeKhIlcGxUKrW5gHvFhNluUelWDGHCdg5K+xGXJY=";
        }
        {
          name = "rust-analyzer";
          publisher = "rust-lang";
          version = "0.4.2035"; # Update to the latest version
          sha256 = "sha256-xKMuED9LdyiJTB0+qGAOntxaD3dnl7wiuTfd6vgNjYo=";
        }
        {
          name = "vscode-sort-json";
          publisher = "richie5um2";
          version = "1.20.0"; # Update to the latest version
          sha256 = "Jobx5Pf4SYQVR2I4207RSSP9I85qtVY6/2Nvs/Vvi/0="; # lib.fakeSha256;
        }
        {
          name = "theme-monokai-pro-vscode";
          publisher = "monokai";
          version = "1.3.2"; # Update to the latest version
          sha256 = "PznyVIzlKwN21sL+8oC353yxbm1V7ZEHCYQGPSpJRXM=";
        }
      ];
    userSettings = {
      "editor.fontFamily" = "'FiraCode Nerd Font Mono', 'monospace'";
      "editor.rulers" = [ 80 ];
      "editor.fontSize" = 11;
      "editor.formatOnSave" = true;
      "editor.insertSpaces" = true;
      "editor.tabSize" = 2;
      "editor.detectIndentation" = true;
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "notebook.formatOnCellExecution" = true;
      "notebook.formatOnSave.enabled" = true;

      "notebook.codeActionsOnSave" = {
        "source.organizeImports" = true;
      };

      "markdown.preview.typographer" = true;
      "files.associations" = {
        "*.mdx" = "markdown";
      };

      "[python]" = {
        "editor.formatOnSave" = true;
        "editor.tabSize" = 4;
        # "editor.defaultFormatter"= "ms-python.black-formatter";  
        "editor.defaultFormatter" = "charliermarsh.ruff";
        "editor.codeActionsOnSave" = {
          "source.organizeImports" = "explicit";
          "source.fixAll" = "explicit";
        };
      };
      "black-formatter.args" = [
        "--line-length"
        "80"
        "--experimental-string-processing"
      ];
      "[cpp]" = {
        "editor.defaultFormatter" = "xaver.clang-format";
      };
      "[toml]" = {
        "editor.defaultFormatter" = "tamasfe.even-better-toml";
      };
      "[jsonc]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[csharp" = {
        "editor.tabSize" = 4;
        "editor.formatOnSaveMode" = "file";
        "editor.defaultFormatter" = "csharpier.csharpier-vscode";
      };

      "code-runner.runInTerminal" = true;
      "code-runner.clearPreviousOutput" = false;

      # // Override http proxy support json error:
      "http.proxySupport" = "off";

      "workbench.iconTheme" = "material-icon-theme";
      "workbench.editorAssociations" = {
        "*.svg" = "default";
      };
      "emmet.triggerExpansionOnTab" = true;
      "cmake.showOptionsMovedNotification" = false;
      "hediet.vscode-drawio.resizeImages" = null;
      "security.workspace.trust.untrustedFiles" = "open";
      "terminal.external.windowsExec" = "C:\\Program Files\\Git\\bin\\bash.exe";
      "terminal.integrated.defaultProfile.windows" = "PowerShell";
      "omnisharp.useEditorFormattingSettings" = true;
      "github.copilot.enable" = {
        "*" = true;
        "plaintext" = false;
        "markdown" = true;
        "scminput" = false;
        "csharp" = true;
      };
      "docker-compose.enableTelemetry" = true;
      "cmake.configureOnOpen" = true;
      "evenBetterToml.formatter.allowedBlankLines" = 1;
      "terminal.integrated.inheritEnv" = false;
      "settingsSync.ignoredExtensions" = [
        "darkempire78.discord-tools"
        "psioniq.psi-header"
        "visualstudiotoolsforunity.vstuc"
      ];
      "workbench.sideBar.location" = "right";
      "extensions.experimental.affinity" = {
        "asvetliakov.vscode-neovim" = 1;
      };
      "liveshare.notebooks.allowGuestExecuteCells" = true;
      "terminal.integrated.shell.windows" = {
        "maxRows" = 50;
      };
      "notebook.output.wordWrap" = true;
      "notebook.output.scrolling" = true;
      "notebook.output.textLineLimit" = 16;
      "redhat.telemetry.enabled" = true;
      "github.copilot.editor.enableAutoCompletions" = true;
      "notebook.cellToolbarLocation" = {
        "default" = "right";
        "jupyter-notebook" = "left";
      };
      "platformio-ide.useBuiltinPIOCore" = false;
    };
  };
}
