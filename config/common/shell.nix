{
  programs = {
    bash = {
      enable = true;
      package = null;
      enableCompletion = true;
    };
    fish = {
      generateCompletions = false;
      enable = true;
    };
  };
  home.shellAliases = {
    "hms" = "home-manager switch";
    "hmb" = "home-manager build";
  };
}
