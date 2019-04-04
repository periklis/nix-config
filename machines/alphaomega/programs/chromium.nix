{config, pkgs, ...}:
{
  programs.chromium = {
    enable = true;
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm"
    ];
    extraOpts = {
      HardwareAccelerationModeEnabled = true;
    };
  };
}
