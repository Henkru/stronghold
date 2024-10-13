{ ... }:
[
  (self: super: {
    ptouch-driver = super.ptouch-driver.overrideAttrs (oldAttrs: {
      postFixup = ''
        patch "${placeholder "out"}/share/cups/model/ptouch-driver/Brother-QL-800-ptouch-ql.ppd" << EOF
        73c73
        < *HWMargins: 4.32 8.40 -4.32 -8.4
        ---
        > *HWMargins: 4.32 8.40 4.32 8.4
        137,152c137,152
        < *ImageableArea 12mm/12mm (0.47"): "4.32 8.40 4.32 8.40"
        < *ImageableArea 12mm-circular/12mm Circular (0.47"): "5.76 5.76 5.76 5.76"
        < *ImageableArea 17x54mm/17mm x 54mm (0.66" x 2.1"): "4.32 8.40 4.32 8.40"
        < *ImageableArea 17x87mm/17mm x 87mm (0.66" x 3.4"): "4.32 8.40 4.32 8.40"
        < *ImageableArea 23x23mm/23mm x 23mm (0.9"x0.9"): "4.32 8.40 4.32 8.40"
        < *ImageableArea 24mm-circular/24mm Circular (0.94"): "5.76 5.76 5.76 5.76"
        < *ImageableArea 29mm/29mm (1.1"): "4.32 8.40 4.32 8.40"
        < *ImageableArea 29x90mm/29mm x 90mm (1.1" x 3.5"): "4.32 8.40 4.32 8.40"
        < *ImageableArea 38mm/38mm (1.4"): "4.32 8.40 4.32 8.40"
        < *ImageableArea 38x90mm/38mm x 90mm (1.4" x 3.5"): "4.32 8.40 4.32 8.40"
        < *ImageableArea 50mm/50mm (1.9"): "4.32 8.40 4.32 8.40"
        < *ImageableArea 54mm/54mm (2.1"): "5.76 8.40 5.76 8.40"
        < *ImageableArea 58mm-circular/58mm Circular (2.2", CD/DVD): "8.40 8.40 8.40 8.40"
        < *ImageableArea 62mm/62mm (2.4"): "4.32 8.40 4.32 8.40"
        < *ImageableArea 62x29mm/62mm x 29mm (2.3" x 1.1"): "4.32 8.40 4.32 8.40"
        < *ImageableArea 62x100mm/62mm x 100mm (2.3" x 3.9"): "4.32 8.40 4.32 8.40"
        ---
        > *ImageableArea 12mm/12mm (0.47"): "4.32 8.40 29.68 275.60"
        > *ImageableArea 12mm-circular/12mm Circular (0.47"): "5.76 5.76 28.24 28.24"
        > *ImageableArea 17x54mm/17mm x 54mm (0.66" x 2.1"): "4.32 8.40 43.68 144.60"
        > *ImageableArea 17x87mm/17mm x 87mm (0.66" x 3.4"): "4.32 8.40 43.68 237.60"
        > *ImageableArea 23x23mm/23mm x 23mm (0.9"x0.9"): "4.32 8.40 60.68 56.60"
        > *ImageableArea 24mm-circular/24mm Circular (0.94"): "5.76 5.76 62.24 62.24"
        > *ImageableArea 29mm/29mm (1.1"): "4.32 8.40 77.68 275.60"
        > *ImageableArea 29x90mm/29mm x 90mm (1.1" x 3.5"): "4.32 8.40 77.68 246.60"
        > *ImageableArea 38mm/38mm (1.4"): "4.32 8.40 103.68 275.60"
        > *ImageableArea 38x90mm/38mm x 90mm (1.4" x 3.5"): "4.32 8.40 103.68 246.60"
        > *ImageableArea 50mm/50mm (1.9"): "4.32 8.40 137.68 275.60"
        > *ImageableArea 54mm/54mm (2.1"): "5.76 8.40 147.24 275.60"
        > *ImageableArea 58mm-circular/58mm Circular (2.2", CD/DVD): "8.40 8.40 156.60 156.60"
        > *ImageableArea 62mm/62mm (2.4"): "4.32 8.40 171.68 275.60"
        > *ImageableArea 62x29mm/62mm x 29mm (2.3" x 1.1"): "4.32 8.40 171.68 73.60"
        > *ImageableArea 62x100mm/62mm x 100mm (2.3" x 3.9"): "4.32 8.40 171.68 274.60"
        229c229
        < *DefaultAutoCut: Unknown
        ---
        > *DefaultAutoCut: True
        246c246
        < *DefaultCutLabel: Unknown
        ---
        > *DefaultCutLabel: 0
        EOF

        ${oldAttrs.postFixup or ""}
      '';
    });
  })
]
