# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).


{ config, pkgs, ... }:
# let
#   home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz";
# in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # (import "${home-manager}/nixos")
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Canada/Toronto";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.windowManager.dwm.enable = true;
  services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs { # Later change it to Online Git Config
    src = /home/jiucheng/DotFiles/suckless/dwm; 
  };

  # environment.pathsToLink = ["/libexec"];

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # flakes Settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jiucheng = {
    isNormalUser = true;
    home = "/home/jiucheng";
    extraGroups = ["wheel"];
    description = "Jiucheng Zang";
  };

  # Home manager Global or User
  #home-manager.useUserPackages = true;
  #home-manager.useGlobalPkgs = true;

  #home-manager.users.jiucheng = {pkgs, ... }: {
  #  home.stateVersion = "23.05";
  #  home.packages = [ pkgs.atool pkgs.httpie ];
  #  programs.bash.enable = true;
  #};

  i18n.inputMethod = {
      enabled = "ibus";
      ibus.engines = with pkgs.ibus-engines; [
	  libpinyin
      ];
  };
 
  nixpkgs.config = {

   allowUnfree = true;

   firefox = {
     enableGoogleTalkPlugin = true; 
     enableAdobeFlash = true;
   };
 
  };
  
  # Font Install
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  # System package install
  environment.systemPackages = with pkgs; [

    # TextEdit
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.

    # Tool Install
    wget
    neofetch
    htop
    pkg
    git
    unzip
    flameshot
    light
    autorandr
    xcompmgr
    ranger

    # DWM Setup 
    dmenu
    # st
    (st.overrideAttrs(oldAttrs: rec {
    # ligatures dependency
        buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
        patches = [
          # ligatures patch
          #(fetchpatch {
          #  url = "https://st.suckless.org/patches/ligatures/0.8.3/st-ligatures-20200430-0.8.3.diff";
          #  sha256 = "67b668c77677bfcaff42031e2656ce9cf173275e1dfd6f72587e8e8726298f09";
          #})
        ];
        # version controlled config file
	configFile = writeText "config.def.h" (builtins.readFile /home/jiucheng/DotFiles/suckless/st/config.def.h);
	# Or one pulled from GitHub
   	# configFile = writeText "config.def.h" (builtins.readFile "${fetchFromGitHub { owner = "LukeSmithxyz"; repo = "st"; rev = "8ab3d03681479263a11b05f7f1b53157f61e8c3b"; sha256 = "1brwnyi1hr56840cdx0qw2y19hpr0haw4la9n0rqdn0r2chl8vag"; }}/config.h");
   	postPatch = "${oldAttrs.postPatch}\n cp ${configFile} config.def.h";
      }))

    # Software Useful
    firefox
    gimp
    ### Only Avalible For x86-64 Machine ###
    # spotify
    # google-chrome 
    # mailspring 
    # notion-app-enhanced
    # signal-desktop
    
    # Develop Tools 
    gnumake # make command
    vscode # IDE
    emacs # IDE
    python311 # Programming Language
    racket # Programming Language
  ];



  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 57621 ];
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

