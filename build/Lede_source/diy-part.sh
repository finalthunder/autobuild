#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
# DIY扩展二合一了，在此处可以增加插件
# 自行拉取插件之前请SSH连接进入固件配置里面确认过没有你要的插件再单独拉取你需要的插件
# 不要一下就拉取别人一个插件包N多插件的，多了没用，增加编译错误，自己需要的才好
# 修改IP项的EOF于EOF之间请不要插入其他扩展代码，可以删除或注释里面原本的代码


cat >$NETIP <<-EOF
uci set network.lan.ipaddr='192.168.123.1'                                    # IPv4 地址(openwrt后台地址)
uci set network.lan.netmask='255.255.255.0'                                 # IPv4 子网掩码
uci set network.lan.gateway='192.168.123.1'                                   # IPv4 网关
uci set network.lan.broadcast='192.168.2.255'                               # IPv4 广播
uci set network.lan.dns='223.5.5.5 114.114.114.114'                         # DNS(多个DNS要用空格分开)
uci set network.lan.delegate='0'                                            # 去掉LAN口使用内置的 IPv6 管理
uci commit network                                                          # 不要删除跟注释,除非上面全部删除或注释掉了
#uci set dhcp.lan.ignore='1'                                                 # 关闭DHCP功能
#uci commit dhcp                                                             # 跟‘关闭DHCP功能’联动,同时启用或者删除跟注释
uci set system.@system[0].hostname='OpenWrt-123'                            # 修改主机名称为OpenWrt-123
EOF

sed -i '/CYXluq4wUazHjmCDBCqXF/d' $ZZZ                                                             # 设置密码为空

#sed -i 's/PATCHVER:=5.4/PATCHVER:=5.10/g' target/linux/x86/Makefile                               # x86机型,默认内核5.4，修改内核为5.10

# K3专用，编译K3的时候只会出K3固件
#sed -i 's|^TARGET_|# TARGET_|g; s|# TARGET_DEVICES += phicomm_k3|TARGET_DEVICES += phicomm_k3|' target/linux/bcm53xx/image/Makefile
