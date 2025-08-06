sudo apt install xsel cyberchef seclists -y
pipx install goshs
pipx install git+https://github.com/brightio/penelope
sudo apt autoremove --purge light-locker
echo "alias pbcopy='xsel --clipboard --input'" | sudo tee -a .zshrc
echo "alias pbpaste='xsel --clipboard --output'" | sudo tee -a .zshrc
echo "setxkbmap hu" | sudo tee -a .zshrc
source .zshrc
git clone https://github.com/Dewalt-arch/pimpmykali ~/pimpmykali
dpmanager=$(awk -F/ '{print $NF}' /etc/X11/default-display-manager)
if [ $dpmanager = lightdm ]; then
	echo '[+] lightdm detected, configuring autologin'
	sudo sed -i '/^\[Seat:\*\]/a autologin-user=kali\nautologin-user-timeout=0' /etc/lightdm/lightdm.conf
	echo '[+] Lightdm configured successfully'
else
	echo '[-] Unkown display manager. Configure it manually.'
	fi

echo 'Disabling sleep and lock'
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
echo '[+] Populating database for locate command'
sudo updatedb
echo '[+] Downloading and running pimpmykali'
sudo ~/pimpmykali/pimpmykali.sh --autonoroot
mkdir ~/http
cp /usr/share/peass/linpeas/linpeas.sh ~/http
cp /usr/share/peass/winpeas/winPEASx64.exe ~/http
echo "[+] Downloading hostfile modification script to ~/.local/bin"
wget https://raw.githubusercontent.com/medzsikmisi/kalisetup/refs/heads/main/hosts -O ~/.local/bin/hosts
echo "[+] Adding execution permission"
sudo chmod +x ~/.local/bin/hosts
echo "[+] Downloading tmux config"
wget https://github.com/medzsikmisi/kalisetup/raw/refs/heads/main/.tmux.conf -O ~/.tmux.conf
