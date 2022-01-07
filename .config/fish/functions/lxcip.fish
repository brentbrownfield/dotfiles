function lxcip --description "Retrieve IP address of a lxc container based on container name and network interface"

    # Set command line options for parsing
    # -h/--help: Print help
    # -i/--interface: specify network interface
    # -c/--container: specify container name
    set -l options (fish_opt -s h -l help)
    set options $options (fish_opt --short i --long interface --required-val)
    set options $options (fish_opt --short c --long container --required-val)
    
    argparse -i $options -- $argv
    or return # exit if argparse failed because it found an option it didn't recognize - it will print an error

    # If -h or --help is given, we print a little help text and return
    if set -q _flag_help
        printHelp
        return 0
    end

    # If -i or --interface is given, get the interface from one or the other
    # otherwise return with non-zero exit code as this is required.
    if set -q _flag_interface
        set interface $_flag_interface
    else if set -q _flag_i
        set interface $_flag_i
    else
        echo "Interface is required"
        printHelp
        return 1
    end

    # If -c or --container is given, get the container name from one or the other
    # otherwise return with non-zero exit code as this is required.
    if set -q _flag_container
        set container $_flag_container
    else if set -q _flag_c
        set container $_flag_c
    else
        echo "Container is required"
        printHelp
        return 1
    end

    set -l searchResults (lxc list $container | grep -E -o "[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}[[:space:]]*\($interface" | awk '{print $1}')

    if set -q searchResults
        echo $searchResults
    else
        echo "No results"
        return 0
    end
end

function printHelp
    echo "Usage:"
    echo "lxcip (-i/--interface INTERFACE) (-c/--container CONTAINER_NAME)"
end
