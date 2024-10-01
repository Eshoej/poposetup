# Needed for all installers
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl git unzip cmake libfontconfig1-dev cargo

# Run terminal installers
for installer in ~/.local/share/poposetup/install/terminal/*.sh; do source $installer; done
