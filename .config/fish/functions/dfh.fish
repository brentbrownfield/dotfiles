# Defined in /data/data/com.termux/files/usr/tmp/fish.Aw7Fkh/dfh.fish @ line 2
function dfh
    df -x tmpfs -x squashfs -x devtmpfs -x overlay -h | body sort
end
