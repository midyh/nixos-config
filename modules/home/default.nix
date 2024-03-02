{
  imports =
       [(import ./waybar)]
    ++ [(import ./discord)]
    ++ [(import ./firefox)]
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
    ++ [(import ./nixvim)]
    ++ [(import ./package)];
}

