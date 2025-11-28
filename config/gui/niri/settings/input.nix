{
  programs.niri.settings.input = {
    keyboard = {
      # xkb 部分留空，表示使用 systemd-localed (org.freedesktop.locale1) 提供的设置
      xkb = { };

      # 启用 numlock 需要显式设为 true；省略该选项或设为 false 会禁用
      # numlock = true;
    };

    touchpad = {
      enable = true; # 默认为 true，此处显式保留启用状态
      tap = true; # 对应 KDL 中的 `tap`
      natural-scroll = true; # 对应 KDL 中的 `natural-scroll`
      # dwt = true;
      # dwtp = true;
      # drag = false;
      # drag-lock = true;
      # accel-speed = 0.2;
      # accel-profile = "flat";
      # scroll-method = "two-finger";
      # disabled-on-external-mouse = true;
    };

    mouse = {
      enable = true; # 默认为 true
      accel-profile = "flat"; # 对应 KDL 中的 `accel-profile "flat"`
      # natural-scroll = true;
      # accel-speed = 0.2;
      # scroll-method = "no-scroll";
    };

    trackpoint = {
      enable = true; # 默认为 true
      # natural-scroll = true;
      # accel-speed = 0.2;
      # accel-profile = "flat";
      # scroll-method = "on-button-down";
      # scroll-button = 273;
      # scroll-button-lock = true;
      # middle-emulation = true;
    };

    # warp-mouse-to-focus = {
    #   enable = true;
    # };

    focus-follows-mouse = {
      enable = false; # 默认为 false；若要启用需设为 true
      # max-scroll-amount = "0%";
    };
  };
}
