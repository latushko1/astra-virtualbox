#!/bin/bash

sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup

new_sources="# Astra Linux repository description https://wiki.astralinux.ru/x/0oLiC
deb https://download.astralinux.ru/astra/stable/1.7_x86-64/repository-main/ 1.7_x86-64 main contrib non-free
deb https://download.astralinux.ru/astra/stable/1.7_x86-64/repository-update/ 1.7_x86-64 main contrib non-free
#deb https://download.astralinux.ru/astra/stable/1.7_x86-64/repository-base/ 1.7_x86-64 main contrib non-free
#deb https://download.astralinux.ru/astra/stable/1.7_x86-64/repository-extended/ 1.7_x86-64 main contrib non-free
"

sudo tee /etc/apt/sources.list <<< "$new_sources"

apt update

apt install open-vm-tools
