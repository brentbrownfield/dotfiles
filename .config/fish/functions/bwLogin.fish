function bwLogin --description "Login to bitwarden"

    set -l options (fish_opt -s h -l help)
    set options $options (fish_opt --short c --long code --required-val)
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
    if set -q _flag_code
        set authCode $_flag_code
    else if set -q _flag_c
        set authCode $_flag_c
    end

    # If -u or --username is given, get the username from one or the other
    # otherwise return with non-zero exit code as this is required.
    if set -q _flag_username
        set user $_flag_username
    else if set -q _flag_u
        set user $_flag_u
    else
        echo "Username is required"
        printHelp
        return 1
    end

    # Read in a value for master password
    read -s -P "Master Password: " masterPass

    # If auth code is provided, login with the auth code
    # otherwise get a value for yubikey and login with that
    if set -q authCode
        set -x BW_SESSION (bw login --raw --method 0 --code $authCode $user $masterPass)
    else
        read -s -P "Yubikey: " yubikey
        set -x BW_SESSION (bw login --raw --method 3 --code $yubikey $user $masterPass)
    end
end

function printHelp
    echo "Usage:"
    echo "bwLogin (-u/--username USER_NAME) [-c/--code CODE]" 
end
