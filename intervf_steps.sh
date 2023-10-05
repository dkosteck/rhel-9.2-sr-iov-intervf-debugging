PF=ens4f0

echo 0 > /sys/class/net/$PF/device/sriov_numvfs
echo 2 > /sys/class/net/$PF/device/sriov_numvfs
sleep 1
ls -d /sys/class/net/${PF}v* | wc -w
ip netns add ns0
ip link set $PF vf 0 mac aa:bb:cc:dd:ee:00 
ip link set $PF vf 0 trust off 
ip link set $PF vf 0 spoof on 
# Uncomment this sleep for the test to pass
#sleep 1 
ip link set ${PF}v0 netns ns0
