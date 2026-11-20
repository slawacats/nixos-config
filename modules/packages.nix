{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.npm.enable = true;
  programs.steam.enable = true;
  services.flatpak.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "qtwebengine-5.15.19"
  ];
  
  environment.systemPackages = with pkgs; [
  
    # --------- kdePackages
    kdePackages.dolphin
    kdePackages.ark
    kdePackages.kolourpaint
    kdePackages.kdeconnect-kde
    kdePackages.kdenlive

    # --------- TextEditors
    obsidian
    vim
    neovim
    helix

    # --------- Utils
    fastfetch
    htop
    wine64
    ntfs3g
    exfatprogs
    cava
    eza
    rar
    unrar
    zip
    unzip
    bat
    stow
    fzf
    arp-scan
    wget
    curl
    efibootmgr
    libsecret
    nmap
    superfile
    clock-rs
    printrun
    lm_sensors
    stress-ng
    # --- Graphical
    gparted
    mission-center
    crosspipe
    cpu-x
    
    # --------- Screenshoters
    hyprshot
    flameshot
    grim
    slurp

    # --------- Hyprland
    waybar
    wofi
    hyprpaper
    hyprpolkitagent
    hyprlock
    hypridle
    hyprcursor
    adwaita-icon-theme
    nwg-drawer
    wlogout
    swaynotificationcenter
    xdg-desktop-portal-hyprland
    hyprland-per-window-layout

    # --------- Programms
    discord
    vscode
    # pgadmin4
    bottles
    yandex-music
    spotify
    alacritty
    kitty
    cool-retro-term
    tmux
    telegram-desktop
    onlyoffice-desktopeditors
    libreoffice
    # teamspeak6-client
    element-desktop
    obs-studio
    virt-manager
    qemu 
    brave
    drawing
    pipes-rs
    krita
    element-desktop
    cinny-desktop
    lmms
    orca-slicer
    drawio
    blender
    kicad
    figma-linux
    # penpot-desktop
    # repath-studio
    # graphite
    # vivaldi
    firefox
    # qutebrowser # UNSECURE
    easyeffects

    # --------- Dev
    rustc
    cargo
    # rustup
    rust-analyzer
    cargo-dist
    zig
    gcc
    clang
    clang-tools
    gnumake
    git
    jdk21
    maven
    # pkgsCross.mingwW64.stdenv.cc
    figlet
    python314
    python314Packages.pip
    python314Packages.virtualenv
    python314Packages.numpy
    hyperfine
    binutils
    go
    lua5_5
    lua-language-server
    nls
    nickel
    nixd
    nil
    vscode-langservers-extracted
    superhtml
    svelte-language-server
    typescript-language-server
    lldb
    android-tools
    ty
    ruff
    python3Packages.jedi-language-server
    python3Packages.python-lsp-server
    slint-lsp

    # --------- Viewers
    vlc
    sxiv
    loupe

    # --------- Others
    jq
    pavucontrol
    networkmanager
    libnotify
    pipewire
    postgresql
    clinfo
    vulkan-tools
    cmatrix
    genact
    usbutils

    # --------- Testing
  ] ++ (with pkgs-unstable; [
    amnezia-vpn
    # graphite
  ]);
}
