# Description
systemd rule for packet-forwarder(LINK) with installation script which creates packet_forwarder user, puts rule into system, sets global_conf.json based on enviroment variables, starts daemon and enables it.
Will be primarily used with docker which will pull this repo and runs the script.