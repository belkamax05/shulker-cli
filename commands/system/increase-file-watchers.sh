cat /proc/sys/fs/inotify/max_user_watches

sudo sysctl fs.inotify.max_user_watches=524288

echo 'fs.inotify.max_user_watches=524288' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p