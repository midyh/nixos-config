{
  pkgs,
  hostname,
  config,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "fzf"];
    };
    initExtraFirst = ''
      DISABLE_MAGIC_FUNCTIONS=true
      export "MICRO_TRUECOLOR=1"
      eval "$(direnv hook zsh)"
    '';

    shellAliases = {
      cat = "bat";
      ls = "eza";
      l = "eza --icons -a --group-directories-first -1";
      ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
      tree = "eza --icons --tree --group-directories-first";
      n = "nvim";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
