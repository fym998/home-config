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
    "hmso" = "home-manager switch --option substitute false";
    "hmb" = "home-manager build";
  };
}
