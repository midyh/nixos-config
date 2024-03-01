{inputs, username, ...}: {
  imports =
       [(import ./waybar)]
    ++ [(import ./chrome)]
    ++ [(import ./hyprland)]
    ++ [(import ./git)]
    ++ [(import ./bat)]
    ++ [(import ./kitty)]
    ++ [(import ./swaylock)]
    ++ [(import ./wofi)]
    ++ [(import ./zsh)]
    ++ [(import ./gtk)]
    ++ [(import ./scripts)]         # personal scripts
    ++ [(import ./starship)]
    ++ [(import ./nvim)]
    ++ [(import ./package)];
}

