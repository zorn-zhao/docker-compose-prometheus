#!/bin/bash

# 升级内核脚本

echo "开始升级内核..."

# 安装 ELRepo 存储库
sudo rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
sudo yum install -y https://www.elrepo.org/elrepo-release-7.el7.elrepo.noarch.rpm

# 启用 ELRepo 的 kernel-ml 存储库
sudo yum-config-manager --enable elrepo-kernel

# 安装最新的内核
sudo yum install -y kernel-ml

# 配置 GRUB2 以使用新安装的内核作为默认内核
new_kernel_title=$(sudo awk -F\' '$1=="menuentry " {print $2}' /etc/grub2.cfg | head -n 1)
sudo grub2-set-default "$new_kernel_title"

echo "内核升级完成。系统将自动重启。"

# 重启系统以应用新内核
sudo reboot
