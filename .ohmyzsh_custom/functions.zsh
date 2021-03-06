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
