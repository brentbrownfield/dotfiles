ogl() {grep $1 *.log(.om[1]) }

PTR() {echo $1 > ~/PTR}

b() {
    echo $1 > ~/PTR
    svn cp ^/trunk ^/ptr/$1 -m "Created branch"
}

ptr() {
    if [ $# -eq 0 ]; then
        PTR=`cat ~/PTR`;
    else
        PTR=$1;
    fi
    tmp=`sinfo -p "ptr/$PTR"`;
    svn switch $tmp
}

trunk() {
    tmp=`sinfo -p trunk`;
    svn switch $tmp
}

db2a() {
    if [ $# -gt 0 ]; then
        java -jar /work/brent/docbook2asciidoc/saxon9he.jar -s $1.docbook -o $1.asc /work/brent/docbook2asciidoc/d2a.xsl
    else
        echo "Docbook file must be provided"
    fi
}

server() {
    if [ $# -eq 0 ]; then
        PORT=8000;
    else
        PORT=$1;
    fi
    open "http://localhost:${PORT}" && python -m SimpleHTTPServer $PORT
}

dockerImages() {
    if [ $# -eq 1 ]; then
        docker images | grep  "$1" | awk '{print $1 ":" $2}';
    else
        docker images | awk '{print $1 ":" $2}';
    fi
}

# print the header (the first line of input)
# and then run the specified command on the body (the rest of the input)
# use it in a pipeline, e.g. ps | body grep somepattern
body() {
    IFS= read -r header
    printf '%s\n' "$header"
    "$@"
}

verifyGPGKey() {
    if [ $# -eq 1 ]; then
        cat "$1" | gpg --with-colons --import-options show-only --import
    else
        echo "Specify gpg key file";
    fi
}

verifySHA256() {
    if [ $# -eq 1 ]; then
        sha256sum -c $1 2>&1 | grep OK
    else
        echo "Specify SHA256Sum file";
    fi
}

timezsh() {
    shell=${1-$SHELL}
    for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

bwlogin() {
    bw login --check > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "Already logged in";
    else
        zparseopts -D -E -K -A parsedOpts -- c: u:

        code=$parsedOpts[-c];
        user=$parsedOpts[-u];

        if [ ! -z $user ]; then
            export BW_USERNAME=$user;
        fi

        # Read in username if the env variable BW_USERNAME
        # is not set
        if [ -z $BW_USERNAME ]; then
            read "BW_USERNAME?Username: ";
            echo "\n";
        fi

        ### Input  pasword and yubikey as hidden charactors ###
        if [ -z $BW_PASSWORD ]; then
            read -s "BW_PASSWORD?Master Password: "
            echo "\n"
        fi

        if [ -z $code ]; then
            read -s "yubikey?Yubikey: "
            echo "\n"
            echo "Logging in as $BW_USERNAME with yubikey";
            BW_SESSION=`bw login --raw --method 3 --code $yubikey $BW_USERNAME $BW_PASSWORD`
        else
            echo "Logging in as $BW_USERNAME with authenticator code $code";
            BW_SESSION=`bw login --raw --method 0 --code $code $BW_USERNAME $BW_PASSWORD`;
        fi
        export BW_SESSION;
        unset yubikey
        unset code
        unset user

        bw login --check > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "Login Success";
        else
            echo "Login Failed";
        fi
    fi
}

bwlock() {
    bw lock;
    unset BW_SESSION;
}

bwunlock() {
    read -s "password?Master Password: "
    echo "\n";
    BW_SESSION=`bw unlock --raw $password`;
    export BW_SESSION;
}

bwlogout() {
    bw logout;
    unset BW_SESSION;
    rm -f ~/.BW_SESSION
}

bwAccessToken() {
    if [ $# -eq 2 ]; then
        local search=$1;
        local username=$2;
        local field='Access Token';
        TOKEN=`bwField $search $username $field`
        echo $TOKEN
    else
        echo 'Search term and Username is required';
    fi
}

bwFields() {
    if [ $# -eq 1 ]; then
        local search=$1
        bw list items --search $search | jq --raw-output ". | map(select(.fields != null)) | .[] | {username: .login.username, fields: .fields}"
    elif [ $# -eq 2 ]; then
        local search=$1
        local username=$2;
        bw list items --search $search | jq --raw-output ". | map(select(.fields != null)) | map(select(.login.username == \"$username\")) | .[0] | .fields"
    else
        echo 'Search term is required';
        echo 'Username is optional';
    fi

}

bwField() {
    if [ $# -eq 3 ]; then
        local search=$1
        local username=$2;
        local field=$3;
        TOKEN=`bw list items --search $search | jq --raw-output ". | map(select(.fields != null)) | map(select(.login.username == \"$username\")) | .[0] | .fields | map(select(.name == \"$field\")) | .[0] | .value"`
        echo $TOKEN
    else
        echo 'Search term, Username and field name are required';
    fi
}

bwPassword() {
    if [ $# -eq 2 ]; then
        local searchTerm=$1;
        local user=$2;
        bw list items --search $searchTerm |  jq --raw-output ". | map(select(.login.username == \"$user\")) |
.[0] | .login.password"
    else
        echo 'Search term and username must be provided';
    fi
}

bwUserPasswordFromURI() {
    if [ $# -eq 1 ]; then
        local uri=$1;
        bw list items --search $uri | jq --raw-output ". | map( select ( any(.login.uris[].uri; contains(\"$uri\") )) ) | .[] | {username: .login.username , password: .login.password}"
    else
        echo 'URI is required';
    fi
}
