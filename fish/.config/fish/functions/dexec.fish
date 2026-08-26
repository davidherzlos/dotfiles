function dexec --description 'docker exec into a container, forwarding this pane herdr identity'
    if test (count $argv) -lt 1
        echo "usage: dexec <full_container_name> [cmd...]"
        return 1
    end

    set container $argv[1]
    set rest $argv[2..-1]

    if test (count $rest) -eq 0
        set rest bash
    end

    echo "Exec into $container: $rest"
    docker exec \
        -e HERDR_AGENT="$HERDR_AGENT" \
        -e HERDR_ENV="$HERDR_ENV" \
        -e HERDR_TAB_ID="$HERDR_TAB_ID" \
        -e HERDR_PANE_ID="$HERDR_PANE_ID" \
        -e HERDR_WORKSPACE_ID="$HERDR_WORKSPACE_ID" \
        -e HERDR_SOCKET_PATH="$HERDR_SOCKET_PATH" \
        -it $container $rest
end
