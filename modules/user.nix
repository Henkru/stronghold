{ ... }:
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
}
