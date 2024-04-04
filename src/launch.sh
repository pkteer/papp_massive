#!/bin/sh

echo "Massive proxy node launch.sh"
(
    while :; do
        if [ -e /stor/var_lib_massive/config ] ; then
            if ! cmp -s /stor/var_lib_massive/config /state/node_id ; then
                echo "Updating node_id to $(cat /stor/var_lib_massive/config)"
                cp /stor/var_lib_massive/config /state/node_id
            fi
        fi
        sleep 20
    done
) &

exec /bin/massive-proxy-node