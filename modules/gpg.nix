{ pkgs, ... }:
let
  gpgConfig = pkgs.writeText "gpg.conf" ''
    personal-cipher-preferences AES256 AES192 AES
    personal-digest-preferences SHA512 SHA384 SHA256
    personal-compress-preferences ZLIB BZIP2 ZIP Uncompressed
    default-preference-list SHA512 SHA384 SHA256 AES256 AES192 AES ZLIB BZIP2 ZIP Uncompressed
    cert-digest-algo SHA512
    s2k-digest-algo SHA512
    s2k-cipher-algo AES256
    charset utf-8
    no-comments
    no-emit-version
    no-greeting
    keyid-format 0xlong
    list-options show-uid-validity
    verify-options show-uid-validity
    with-fingerprint
    require-cross-certification
    no-symkey-cache
    armor
    use-agent
    throw-keyids
  '';
in
{
  environment.interactiveShellInit = ''
    unset HISTFILE
    export GNUPGHOME="/run/user/$(id -u)/gnupg"
    if [ ! -d "$GNUPGHOME" ]; then
      echo "Creating \$GNUPGHOME…"
      install --verbose -m=0700 --directory="$GNUPGHOME"
    fi
    [ ! -f "$GNUPGHOME/gpg.conf" ] && cp -f --verbose "${gpgConfig}" "$GNUPGHOME/gpg.conf"
    echo "\$GNUPGHOME is \"$GNUPGHOME\""
    echo "\$KEYID is \"$KEYID\""
  '';

  programs = {
    ssh.startAgent = false;
    gnupg = {
      dirmngr.enable = true;
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
  };

  services = {
    pcscd.enable = true;
    udev.packages = [ pkgs.yubikey-personalization ];
  };
}
