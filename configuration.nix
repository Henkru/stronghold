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
    opensc
    openssh
    paperkey
    pgpdump
    pwgen
    sha2wordlist

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

  environment.sessionVariables = {
    LD_LIBRARY_PATH = "${pkgs.systemd}/lib/cryptsetup"; # workaround for: https://github.com/NixOS/nixpkgs/issues/265366
  };

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
