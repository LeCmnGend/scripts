bash packages/1.sh
bash packages/3.sh
echo "###############################################"
echo "Done."

echo -e "Setting up udev rules for adb!"
sudo curl --create-dirs -L -o /etc/udev/rules.d/51-android.rules -O -L https://raw.githubusercontent.com/M0Rf30/android-udev-rules/master/51-android.rules
sudo chmod 644 /etc/udev/rules.d/51-android.rules
sudo chown root /etc/udev/rules.d/51-android.rules
sudo service udev restart

echo "###############################################"
echo "Done."
echo "###############################################"
echo "Installing repo"
sudo curl --create-dirs -L -o /usr/local/bin/repo -O -L https://storage.googleapis.com/git-repo-downloads/repo
sudo chmod a+rx /usr/local/bin/repo
echo "###############################################"
echo "Done."

echo "###############################################"
echo "Done."
echo "###############################################"
echo "Installing Build environment"
bash packages/install_android_sdk.sh
echo "###############################################"
echo "Done."

echo "###############################################"
echo "Setup some symlink"
bash packages/symlink.sh
echo "###############################################"
echo "Done."
echo "###############################################"

echo "###############################################"
echo "Run update to make sure it will not conflict"
sudo aptitude update && sudo aptitude upgrade -y

echo "###############################################"
echo "Done."
echo "###############################################"
