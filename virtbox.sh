#!/bin/bash

read -p $'Перед запуском проверьте есть ли в директории с скриптом файл уставновки virtualbox(virtualbox-7.0_7.0.12-159484~Debian~buster_amd64.deb).\nПродолжить выполнение? (y/n): ' choice

# Проверка выбора пользователя
if [ "$choice" != "y" ]; then
    echo "Выход из скрипта."
    exit 0
fi

new_lines=("deb https://download.astralinux.ru/astra/stable/1.7_x86-64/repository-update/ 1.7_x86-64 main contrib non-free"
            "deb https://download.astralinux.ru/astra/stable/1.7_x86-64/repository-base/ 1.7_x86-64 main contrib non-free")



file_path="/etc/apt/sources.list" # Путь к файлу sources.list

if [ -f "$file_path" ]; then
    # Добавление новых строк в конец файла
    for line in "${new_lines[@]}"; do
        echo "$line" | sudo tee -a $file_path > /dev/null
    done
    echo "Строки успешно добавлены в $file_path"
else
    echo "Файл $file_path не найден. Убедитесь, что он существует."
fi

sudo apt update
sudo dpkg -i virtualbox-7.0_7.0.12-159484~Debian~buster_amd64.deb # установка virtualbox


# уставновка libvpx5


apt-cache policy libvpx*
wget http://ftp.ru.debian.org/debian/pool/main/libv/libvpx/libvpx5_1.7.0-3+deb10u1_amd64.deb
sudo apt install ./libvpx5_1.7.0-3+deb10u1_amd64.deb

sudo apt install -y gcc make perl # установка gcc make perl
sudo apt-get install build-essential libssl-dev linux-headers-`uname -r`

sudo bash /sbin/vboxconfig

sudo bash modprobe vboxdrv







