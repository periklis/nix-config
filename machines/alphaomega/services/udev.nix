{config, pkgs, ...}:
{
  services.udev.extraRules = ''
    SUBSYSTEM=="pci", ATTR{power/control}="auto"

    # power autocontrol for all devices
    ACTION=="add", SUBSYSTEM=="usb", TEST=="power/control", ATTR{power/control}="auto"

    # power off usb smart card reader
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="058f", ATTR{idProduct}=="9540", TEST=="power/control", ATTR{power/control}="off"

    # power off usb smart card reader
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="0bda", ATTR{idProduct}=="0316", TEST=="power/control", ATTR{power/control}="off"

    # power off integraged IR camera
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="04f2", ATTR{idProduct}=="b613", TEST =="power/control", ATTR{power/control}="off"

    # power off fibocom wwan device
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="2cb7", ATTR{idProduct}=="0210", TEST =="power/control", ATTR{power/control}="off"
  '';
}
