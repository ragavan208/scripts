#!/bin/bash
    if [ "$(ps aux | grep [c]q | grep crx)" ]
        then
            count=0;
            echo ""
            ps auxeww | grep [c]q | grep sling | while read -r line ; do
                ((count++));
                params=($line);

                username=(${params[0]});
                pid=(${params[1]});
                port="not found";
                debugPort="not found";
                xmx="not found";
                runmodes="not found";
                path="not found";

                portRegex="-p ([0-9]+)";
                debugPortRegex="address=([0-9]+)";
                xmxRegex="-Xmx([^[:space:]]+)";
                runmodesRegex="-Dsling.run.modes=([^[:space:]]+)";
                pathRegex="PWD=([^[:space:]]+)";

                [[ $line =~ $portRegex ]] && port="${BASH_REMATCH[1]}";
                [[ $line =~ $runmodesRegex ]] && runmodes="${BASH_REMATCH[1]}";
                [[ $line =~ $debugPortRegex ]] && debugPort="${BASH_REMATCH[1]}";
                [[ $line =~ $pathRegex ]] && path="${BASH_REMATCH[1]}";
                [[ $line =~ $xmxRegex ]] && xmx="${BASH_REMATCH[1]}";

                echo "----------------------";
                echo "AEM Instance" $count;
                echo "----------------------";
                echo "username:  "$username;
                echo "pid:       "$pid;
                echo "port:      "$port;
                echo "debugPort: "$debugPort;
                echo "memory:    "$xmx;
                echo "runmodes:  "$runmodes;
                echo "path:      "$path;
                echo "----------------------";
                echo "";

            done

        else
            echo "";
            echo "No running AEM instances found";
            echo "";
        fi
