function bwField --description "Lookup password in bitwarden based on username and search term"

    set -l options (fish_opt -s h -l help)
# Do not process username or search term as these should be handled by bwFields
#    set options $options (fish_opt --short s --long search --required-val)
#    set options $options (fish_opt --short u --long username --required-val)
    set options $options (fish_opt --short f --long field --required-val)
    
    argparse -i $options -- $argv
    or return # exit if argparse failed because it found an option it didn't recognize - it will print an error

    # If -h or --help is given, we print a little help text and return
    if set -q _flag_help
        printHelp
        return 0
    end

    # If -u or --username is given, get the username from one or the other
    # otherwise return with non-zero exit code as this is required.
    if set -q _flag_field
        set field $_flag_field
    else if set -q _flag_f
        set field $_flag_f
    else
        echo "Field is required"
        printHelp
        return 1
    end

    set -l searchResults (bwFields $argv)

    if set -q searchResults
        echo $searchResults | jq --raw-output ".[0] | .value"
    else
        echo "No results"
        return 0
    end
end

function printHelp
    echo "Usage:"
    echo "bwField (-s/--search SEARCH_TERM) (-u/--username USER_NAME) (-f/--field FIELD)"
end
