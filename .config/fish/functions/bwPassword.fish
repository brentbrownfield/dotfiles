function bwPassword --description "Lookup password in bitwarden based on username and search term"

    set -l options (fish_opt -s h -l help)
    set options $options (fish_opt --short s --long search --required-val)
    set options $options (fish_opt --short u --long username --required-val)
    
    argparse $options -- $argv
    or return # exit if argparse failed because it found an option it didn't recognize - it will print an error

    # If -h or --help is given, we print a little help text and return
    if set -q _flag_help
        help
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
        help
        return 1
    end

    echo Searching for term: $searchTerm

    # If -u or --username is given, get the username from one or the other
    # otherwise return with non-zero exit code as this is required.
    if set -q _flag_username
        set user $_flag_username
    else if set -q _flag_u
        set user $_flag_u
    else
        echo "Username is required"
        help
        return 1
    end

    echo "Searching for user: $user"

    bw list items --search $searchTerm |  jq --raw-output ". | map(select(.login.username     == \"$user\")) | .[0] | .login.password"
end

function help
    echo "Usage:"
    echo "bwPassword (-s/--search SEARCH_TERM) (-u/--username USER_NAME)"
end
