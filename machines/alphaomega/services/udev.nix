{config, pkgs, ...}:
{
  services.udev.extraRules = ''
    SUBSYSTEM=="pci", ATTR{power/control}="auto"

    # power autocontrol for all devices
    ACTION=="add", SUBSYSTEM=="usb", TEST=="power/control", ATTR{power/control}="auto"
  '';
}
