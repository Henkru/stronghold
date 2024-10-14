{ pkgs, ... }:
{
  users.users = {
    user = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
      ];
      initialHashedPassword = "";
    };
    root.initialHashedPassword = "";
  };

  security = {
    sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };
  };

  services = {
    getty.autologinUser = "user";
  };

  services.kmscon = {
    enable = true;
    autologinUser = "user";
    fonts = [
      {
        name = "Ubuntu Mono";
        package = pkgs.ubuntu_font_family;
      }
    ];
  };
}
