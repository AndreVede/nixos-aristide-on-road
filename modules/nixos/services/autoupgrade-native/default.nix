{ inputs, ... }: {
  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L" # print build logs
    ];
    dates = "06:00";
    randomizedDelaySec = "45min";
    persistent = true;
  };
}
