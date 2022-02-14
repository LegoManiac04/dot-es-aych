echo 'Downloading Thunderbird package from Mozilla...'
wget -q -O thunderbird.tar.bz2 "https://download.mozilla.org/?product=thunderbird-latest-SSL&os=linux64&lang=en-US"
echo '✓'
echo ''

echo 'Downloading better icon...'
wget -q -O default128.png "https://raw.githubusercontent.com/LegoManiac04/dot-es-aych/main/debian-thunderbird-latest/default128.png"
echo '✓'
echo ''

echo 'Unpacking and removing thunderbird.tar.bz2...'
tar xjf thunderbird.tar.bz2
sudo rm thunderbird.tar.bz2
echo '✓'
echo ''

echo 'Move thunderbird folder to /opt/...'
sudo mv thunderbird /opt/
sudo mv default128.png /opt/thunderbird/chrome/icons/default/default128.png
echo '✓'
echo ''

echo 'Give thunderbird permission to update itself...'
sudo chmod 755 /opt/thunderbird
sudo chmod 755 /opt/thunderbird/thunderbird
echo '✓'
echo ''

echo 'Create desktop entry...'
echo '[Desktop Entry]
Name=Thunderbird
Comment=Email Client
Exec=/opt/thunderbird/thunderbird %u
Terminal=false
Type=Application
Icon=/opt/thunderbird/chrome/icons/default/default128.png
Categories=Email;EmailClient;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true' >thunderbird-stable.desktop

mkdir --parents .local/share/applications; mv thunderbird-stable.desktop .local/share/applications
echo '✓'
echo ''

echo 'Installing useful dependencies...'
sudo apt install dictionaries-common emacsen-common hunspell-tr libbotan-2-17 libtspi1 libnotify4 notification-daemon libcanberra-gtk3-0 libcanberra-gtk3-module libcanberra-pulse libcanberra0
echo '✓'
echo ''
echo ''

echo 'All done! Thunderbird should now show up in your launcher. ✓'
sudo rm thunderbird-latest.sh
