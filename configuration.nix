{
  pkgs,
  system,
  ...
}:
{
  imports = [
    ./modules/user.nix
    ./modules/network.nix
    ./modules/gpg.nix
    ./modules/printing.nix
  ];

  nix.enable = false;
  swapDevices = [ ];

  environment.systemPackages = with pkgs; [
    neovim
    tmux

    yubikey-manager
    yubikey-personalization
    yubico-piv-tool

    gnupg
    cryptsetup
    fido2luks
    opensc
    openssh
    paperkey
    pgpdump
    pwgen

    rage
    age-plugin-yubikey
    seal

    qrencode
    qrrs

    usbutils
    ptouch-driver
    cups

    file
    parted
    util-linux
    dosfstools
  ];

  programs.tmux = {
    enable = true;
    shortcut = "a";
    baseIndex = 1;
    keyMode = "vi";
    terminal = "tmux-256color";
  };

  networking.hostName = "stronghold";
  isoImage.volumeID = "stronghold";
  isoImage.isoName = "stronghold_${system}.iso";
  system.stateVersion = "24.11";
}
