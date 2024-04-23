# Install Nala
sudo apt install nala


# Get Suckless stuff
mkdir ~/Suckless
cd ~/Suckless

git clone https://git.suckless.org/dwm
git clone https://git.suckless.org/dmenu
git clone https://git.suckless.org/st


# Install Suckless Dependancies and build tools
sudo nala install xorg make gcc libx11-dev libxft-dev libxinerama-dev


# Make Suckless stuff
cd ~/Suckless/dwm
sudo make clean install

cd ~/Suckless/dmenu
sudo make clean install 

cd ~/Suckless/st
sudo make clean install 


# Add .xinitrc
echo 'exec dwm' > ~/.xinitrc


# Install librewolf
sudo apt update && sudo apt install -y wget gnupg lsb-release apt-transport-https ca-certificates

distro=$(if echo " una bookworm vanessa focal jammy bullseye vera uma " | grep -q " $(lsb_release -sc) "; then lsb_release -sc; else echo focal; fi)

wget -O- https://deb.librewolf.net/keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/librewolf.gpg

sudo tee /etc/apt/sources.list.d/librewolf.sources << EOF > /dev/null
Types: deb
URIs: https://deb.librewolf.net
Suites: $distro
Components: main
Architectures: amd64
Signed-By: /usr/share/keyrings/librewolf.gpg
EOF

sudo apt update
sudo nala install librewolf -y


# Install text editors
sudo nala install micro


# Setup Audio
sudo nala install pipewire pipewire-alsa pipewire-jack pipewire-audio wireplumber pipewire-media-session pulseaudio-utils
systemctl --user --now enable wireplumber.service
# reboot
