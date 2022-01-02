function bwFields --description "Lookup password in bitwarden based on username and search term"

    set -l options (fish_opt -s h -l help)
    set options $options (fish_opt --short s --long search --required-val)
    set options $options (fish_opt --short u --long username --required-val)
    
    argparse $options -- $argv
    or return # exit if argparse failed because it found an option it didn't recognize - it will print an error

    # If -h or --help is given, we print a little help text and return
    if set -q _flag_help
        printHelp
        return 0
    end

    # If -s or --search is given, get the search term from one or the other
    # otherwise return with non-zero exit code as this is required
    if set -q _flag_search
        set searchTerm $_flag_search
    else if set -q _flag_s
        set searchTerm $_flag_s
    else
        echo "Search term is required"
        printHelp
        return 1
    end

    # If -u or --username is given, get the username from one or the other
    # otherwise return with non-zero exit code as this is required.
    if set -q _flag_username
        set user $_flag_username
    else if set -q _flag_u
        set user $_flag_u
    end

    # Username is not set
    if set -q $user
        bw list items --search $searchTerm | jq --raw-output ". | map(select(.fields != null)) | .[] | {username: .login.username, fields: .fields}"
    # Username is set
    else
        bw list items --search $searchTerm | jq --raw-output ". | map(select(.fields != null)) | map(select(.login.username == \"$user\")) | .[0] | .fields"
    end
end

function printHelp
    echo "Usage:"
    echo "bwFields (-s/--search SEARCH_TERM) [-u/--username USER_NAME]"
end
