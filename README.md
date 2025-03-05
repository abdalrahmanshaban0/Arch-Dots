## Connect to internet (WIFI)
```shell
rfkill unblock wifi

iwctl
device list
# replace wlan0 with your device
station wlan0 scan
station wlan0 connect SSID
```
## archinstall
proceed with minimal profile with NetworkManager, pipewire and grub selected.
## Post fresh installation
### connect to internet:
```shell
nmtui # Activiate connection
```
### Install yay (AUR helper):
```shell
mkdir .src
cd .src
git clone https://aur.archlinux.org/yay.git
cd yay-git
makepkg -si
```
### Install Hyprland dependencies:
```shell
git clone https://github.com/hyprwm/hyprland-wiki
```
open using vim pages/Getting Started/Installation
copy the dependencies of Arch Linux manual installation (y in vim)
``:term`` in vim and paste it and enjoy you don't have to write them one by one :'D
## Build and install Hyprland
```shell
git clone --recursive https://github.com/hyprwm/hyprland
cd Hyprland
make all && sudo make install
```
## Multi-GPU or NVIDIA
https://wiki.hyprland.org/Configuring/Multi-GPU/
https://wiki.hyprland.org/Nvidia/
## Display manager and Hyprland session
The recommended way to start Hyprland is using uwsm in systemd distros (or just write Hyprland after login in tty).
why not SDDM ? 
- It possibly crashes when you make its display server and greeter environment wayland.
- It slows the process to get into your system.
- I have bad history with it.
```shell
sudo pacman -S uwsm vim
```
To launch Hyprland directly after tty login :
paste this in your shell profile (mostly ~/.bashrc)
```shell
if uwsm check may-start; then
    exec uwsm start hyprland.desktop
fi
```
## Install or make your dots
I already have configs for my workflow on Hyprland on a GitHub repo. You can also clone them and edit to fit yours.
https://github.com/abdalrahmanshaban0/Arch-Dots
## Install all your favorite programs from a scirpt
You may install  some programs or dependencies on demand or don't remember to write then in a single script for installation, a tip for that is to open ~/.bash_history and search for every -S and collect these packages in a script. But first, you must know and choose what these programs are.
## Programs
### Fonts
```shell
sudo pacman -S noto-fonts noto-fonts-emoji ttf-liberation ttf-jetbrains-mono ttf-hack-nerd ttf-nerd-fonts-symbols
```
### Text editor
```shell
yay -S neovim gvim
```
### Wallpapers
```shell
yay -S swww waypaper
```
### Network manager and Bluetooth 
```shell
yay -S network-manager-applet bluez bluez-utils bluez-obex blueman
sudo systemctl enable bluetooth.service
```
### File manager and archiving
```shell
sudo pacman -S thunar gvfs gvfs-mtp thunar-volman ffmpegthumbnailer tumbler man-db lsd bzip2 gzip xztar p7zip unrar zip unzip
```
### Terminal
```shell
sudo pacman -S alacritty
```
### Notification daemon
```shell
sudo pacman -S mako jq
```
### Clipboard
```shell
yay -S wl-clipboard wl-clip-persist clipse-bin
```
In ~/.conf/hypr/hyprland.conf
```
exec-once = clipse -listen

windowrulev2 = float, class:(clipse)
windowrulev2 = size 622 652, class:(clipse)
windowrulev2 = stayfocused, class:(clipse)

bind = $mainMod SHIFT, V, exec, alacritty --class clipse -e clipse
```
### Audio
```shell
yay -S pipewire pipewire-pulse pipewire-alsa wireplumber pavucontrol
```
### Authentication for GUI apps
```shell
sudo pacman -S hyprpolkitagent
# exec-once = /usr/libexec/hyprpolkitagent
```
### Optional (just to be cool)
```shell
yay -S cava neofetch cmatrix
# A dock if you want
yay -S nwg-dock-hyprland
```
### Notification daemon
```shell
sudo pacman -S mako jq
```
### Screenshots
```shell
sudo pacman -S grim slurp
```
this script to take selected area screen shot and save it in ~/Pictures/Screenshots
```shell
mkdir -p ~/Pictures/Screenshots && grim -g "$(slurp)" - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png && notify-send "Screenshot saved in ~/Pictures/Screenshots" -t 3000
```
### Web browser
```shell
yay -S brave-bin google-chrome
```
###  PDF viewer
```shell
yay -S evince
```
### GTK settings (themes)
```shell
yay -S nwg-look papirus-icon-theme
# I use Catppuccin Mocha GTK Theme
# Download it from https://www.gnome-look.org/p/1996672
# unzip it and copy it to /usr/share/themes
```
### media player
```shell
yay -S mpv playerctl
```
### poweroff, reboot, logout, lock
```shell
yay -S wlogout hyprlock
```
### Note taking
```shell
yay -S obsidian
```
### Brightness control
```shell
yay -S brightnessctl
```
### git commands UI
```shell
yay -S lazygit
```
### System monitoring
```shell
yay -S btop
```
### Image viewer and editor tool
```shell
yay -S swappy
```
### Printing
```shell
yay -S cups cups-pdf ghostscript gsfonts gutenprint system-config-printer
```
### Status bar (Waybar)
You can use my fork of waybar with new module added for Islamic prayer timings and build it from source : https://github.com/abdalrahmanshaban0/Waybar-with-prayer-timer
### Photo editing
```shell
yay -S gimp
# mostly use online AI tools
```
### Wine (Run windows programs)
enable multilib in /etc/pacman.conf
```shell
sudo pacman -Syyu wine wine-mono wine-gecko winetricks
```
### Quran
```shell
yay -S quran-companion
```
### Screen sharing
```shell
yay -S obs-studio
```
### Video editting
Kdenlive sucks and Davinci Resolve on Linux doesn't support H.264 codec (the paid version does, also you can transcode all of your project videos for some hours and torture your hardware). So I'm sadly dual booting Windows 11 and using Resolve, MS-Office, Matlab and any program I have to use Windows for it.
### Dual boot
I'm dual booting on 2 different drives and choose which one to boot in using Grub. To make Grub supports that :
```shell
yay -S os-prober
```
Edit /etc/default/grub to uncomment the line (maybe last line) :
```
GRUB_DISABLE_OS_PROBER=false
```
You add a Grub theme (install one from gnome-look) also in this line : 
```
GRUB_THEME=/boot/grub/themes/Xenlism-Arch/theme.txt
```
update grub (generating grub.cfg)
```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
