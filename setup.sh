sudo apt install xsel cyberchef seclists -y
pipx install updog
sudo apt autoremove --purge light-locker
echo "alias pbcopy='xsel --clipboard --input'" | sudo tee -a .zshrc
echo "alias pbpaste='xsel --clipboard --output'" | sudo tee -a .zshrc
echo "setxkbmap hu" | sudo tee -a .zshrc
source .zshrc
git clone https://github.com/Dewalt-arch/pimpmykali
sudo .pimpmykali/pimpmykali.sh --auto
