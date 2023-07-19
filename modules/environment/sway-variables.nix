{ ... }:

{
  home = {
    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "google-chrome-stable";
      TERMINAL = "alacritty";
      QT_QPA_PLATFORMTHEME = "gtk3";
      QT_SCALE_FACTOR = "1";
      MOZ_ENABLE_WAYLAND = "1";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

      XDG_CURRENT_DESKTOP = "sway";
      XDG_SESSION_DESKTOP = "sway";
      XDG_SESSION_TYPE = "wayland";
      XDG_CACHE_HOME = "\${HOME}/.cache";
      XDG_CONFIG_HOME = "\${HOME}/.config";
      XDG_BIN_HOME = "\${HOME}/.local/bin";
      XDG_DATA_HOME = "\${HOME}/.local/share";
    };

    sessionPath = [
      "$HOME/.npm-global/bin"
      "$HOME/.local/bin"
    ];
  };
}

