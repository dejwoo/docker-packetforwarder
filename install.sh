#!/bin/bash

sudo useradd -M -r -s /bin/false packet_forwarder
sudo cp ./packet-forwarder.service /etc/systemd/system/
sudo systemctl daemon-reload


#possibility of setting global_conf settings by enviroment variables - probably stupid way
sed "s/\(\"gateway_ID\":\s\)\"\w*\"/\1\"$PACKET_FORWARDER_GATEWAY_ID\"/g" /opt/packet_forwarder/lora_pkt_fwd/global_conf.json > /opt/packet_forwarder/lora_pkt_fwd/global_conf.json
sed "s/\(\"server_address\":\s\)\"\w*\"/\1\"$PACKET_FORWARDER_SERVER_ADDRESS\"/g" /opt/packet_forwarder/lora_pkt_fwd/global_conf.json > /opt/packet_forwarder/lora_pkt_fwd/global_conf.json
sed "s/\(\"serv_port_up\":\s\)\"\w*\"/\1\"$PACKET_FORWARDER_SERV_PORT_UP\"/g" /opt/packet_forwarder/lora_pkt_fwd/global_conf.json > /opt/packet_forwarder/lora_pkt_fwd/global_conf.json
sed "s/\(\"serv_port_down\":\s\)\"\w*\"/\1\"$PACKET_FORWARDER_SERV_PORT_DOWN\"/g" /opt/packet_forwarder/lora_pkt_fwd/global_conf.json > /opt/packet_forwarder/lora_pkt_fwd/global_conf.json
sed "s/\(\"keepalive_interval\":\s\)\"\w*\"/\1\"$PACKET_FORWARDER_KEEPALIVE_INTERVAL\"/g" /opt/packet_forwarder/lora_pkt_fwd/global_conf.json > /opt/packet_forwarder/lora_pkt_fwd/global_conf.json
sed "s/\(\"stat_interval\":\s\)\"\w*\"/\1\"$PACKET_FORWARDER_STAT_INTERVAL\"/g" /opt/packet_forwarder/lora_pkt_fwd/global_conf.json > /opt/packet_forwarder/lora_pkt_fwd/global_conf.json
sed "s/\(\"push_timeout_ms\":\s\)\"\w*\"/\1\"$PACKET_FORWARDER_PUSH_TIMEOUT_MS\"/g" /opt/packet_forwarder/lora_pkt_fwd/global_conf.json > /opt/packet_forwarder/lora_pkt_fwd/global_conf.json
sed "s/\(\"forward_crc_valid\":\s\)\"\w*\"/\1\"$PACKET_FORWARDER_FORWARD_CRC_VALID\"/g" /opt/packet_forwarder/lora_pkt_fwd/global_conf.json > /opt/packet_forwarder/lora_pkt_fwd/global_conf.json
sed "s/\(\"forward_crc_error\":\s\)\"\w*\"/\1\"$PACKET_FORWARDER_FORWARD_CRC_ERROR\"/g" /opt/packet_forwarder/lora_pkt_fwd/global_conf.json > /opt/packet_forwarder/lora_pkt_fwd/global_conf.json
sed "s/\(\"forward_crc_disabled\":\s\)\"\w*\"/\1\"$PACKET_FORWARDER_FORWARD_CRC_DISABLED\"/g" /opt/packet_forwarder/lora_pkt_fwd/global_conf.json > /opt/packet_forwarder/lora_pkt_fwd/global_conf.json

systemctl start packet-forwarder.service
systemctl enable packet-forwarder.service
