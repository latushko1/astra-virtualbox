echo "
+---------------------------------------------------+
|            Добро пожаловать, это VirtualBox       |
|                   без боли!                       |
|             Приятной работы и удачи!              |
|                                                   |
|                          🙂                       |
+---------------------------------------------------+
"

read -p "Нажмите 'y' для продолжения: " answer

if [ "$answer" == "y" ]; then
    echo "Выполнение установки VirtualBox"
else
    echo "Отмена."
    exit 0
fi


mkdir files

cd files

wget https://download.virtualbox.org/virtualbox/7.0.12/virtualbox-7.0_7.0.12-159484~Debian~buster_amd64.deb

echo 'deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian buster contrib' | sudo tee -a /etc/apt/sources.list
echo 'deb https://dl.astralinux.ru/astra/stable/1.7_x86-64/repository-main/     1.7_x86-64 main contrib non-free' | sudo tee -a /etc/apt/sources.list
echo 'deb https://dl.astralinux.ru/astra/stable/1.7_x86-64/repository-base/     1.7_x86-64 main contrib non-free' | sudo tee -a /etc/apt/sources.list
echo 'deb https://dl.astralinux.ru/astra/stable/1.7_x86-64/repository-extended/ 1.7_x86-64 main contrib non-free' | sudo tee -a /etc/apt/sources.list


sudo apt update
apt-cache policy libvpx*

wget http://ftp.ru.debian.org/debian/pool/main/libv/libvpx/libvpx5_1.7.0-3+deb10u1_amd64.deb

sudo apt install ./libvpx5_1.7.0-3+deb10u1_amd64.deb

sudo dpkg -i ./virtualbox-7.0_7.0.12-159484~Debian~buster_amd64.deb

sudo apt install gcc make perl

virtualbox

sudo /sbin/vboxconfig

sudo modprobe vboxdrv




