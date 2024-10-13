{
  pkgs,
  brotherSerialId,
  lib,
  ...
}:
{
  services.printing = {
    enable = true;
    drivers = [ pkgs.ptouch-driver ];
  };

  hardware.printers = {
    ensurePrinters = [
      {
        name = "Brother_QL_800";
        location = "Home";
        deviceUri = "usb://Brother/QL-800?serial=${brotherSerialId}";
        model = "ptouch-driver/Brother-QL-800-ptouch-ql.ppd.gz";
        ppdOptions = {
          #PageSize = "A4";
        };
      }
    ];
    ensureDefaultPrinter = lib.mkDefault "Brother_QL_800";
  };
}
