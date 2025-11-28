{
  programs.git = {
    enable = true;
    settings = {
      user = {
        Name = "fym998";
        email = "61316972+fym998@users.noreply.github.com";
      };
      # https://forums.whonix.org/t/git-users-enable-fsck-by-default-for-better-security/2066
      transfer.fsckobjects = true;
      fetch.fsckobjects = true;
      receive.fsckobjects = true;
      credential.helper = "/usr/lib/git-core/git-credential-libsecret";
    };
    signing = {
      key = "0xD7BC265823B30CC1";
      signByDefault = false;
    };
  };
}
