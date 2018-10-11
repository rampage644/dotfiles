function wait_for_monitor {
    startt=$(date +%s.%N)
    xrandr | grep $1 | grep '\bconnected'
    while [ $? -ne 0 ] ; do
            echo "$(date +%s.%N) - $startt > 1.5" | bc
            if [ $? -eq 0 ] ; then
                break
            fi
            sleep 0.01
            xrandr | grep $1 | grep '\bconnected'
    done
    endt=$(date +%s.%N)
    time=$(echo "$endt - $startt" | bc)
    logger -t xinitrc "Monitor $1 took $time to become online."
 }

# detect second screen
MONITOR=DP3
wait_for_monitor $MONITOR
xrandr --output $MONITOR --auto --primary --output LVDS1 --auto --left-of $MONITOR

# Run window manager
exec i3
