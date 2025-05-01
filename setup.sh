sudo apt install xsel cyberchef seclists -y
pipx install updog
pipx install wsgidav --pip-args 'cheroot lxml'
sudo apt autoremove --purge light-locker
echo "alias pbcopy='xsel --clipboard --input'" | sudo tee -a .zshrc
echo "alias pbpaste='xsel --clipboard --output'" | sudo tee -a .zshrc
echo "setxkbmap hu" | sudo tee -a .zshrc
source .zshrc
git clone https://github.com/Dewalt-arch/pimpmykali
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
sudo .pimpmykali/pimpmykali.sh --autonoroot
mkdir ~/http
cp /usr/share/peass/linpeas/linpeas.sh ~/http
cp /usr/share/peass/winpeas/winPEASx64.exe ~/http

