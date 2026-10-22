#!/bin/bash

HOST_PROJECT="$HOME/traffic_light"
HOST_LIB="$HOME/Desktop/OpenSTA/skywater-pdk-libs-sky130_fd_sc_hd/timing"
REPORTS="$HOST_PROJECT/reports"

mkdir -p "$REPORTS"

for lib in "$HOST_LIB"/sky130_fd_sc_hd__*.lib; do
    [ -f "$lib" ] || continue

    corner=$(basename "$lib" .lib | sed 's/sky130_fd_sc_hd__//')
    report="$REPORTS/${corner}_sta.rpt"
    container_lib="/data/Desktop/OpenSTA/skywater-pdk-libs-sky130_fd_sc_hd/timing/$(basename "$lib")"

    echo "Running STA for $corner ..."

    sed "s|^read_liberty .*|read_liberty $container_lib|" \
        "$HOST_PROJECT/traffic_light_sta.tcl" \
        > "$HOST_PROJECT/temp_sta.tcl"

    sudo docker run --rm \
        -v "$HOME:/data" \
        opensta /data/traffic_light/temp_sta.tcl \
        > "$report" 2>&1

    if grep -qi "worst slack" "$report"; then
        echo "Report saved: $report"
    else
        echo "Check report: $report"
    fi
done

rm -f "$HOST_PROJECT/temp_sta.tcl"
echo "All corner runs completed."

