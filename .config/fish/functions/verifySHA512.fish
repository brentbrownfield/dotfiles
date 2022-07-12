function verifySHA512 --argument-names shafile --description "Verify a SHA512 checksum from file"
    set -lx SHASUM (cat $shafile.sha512)
    set -lx shaSumfile "$SHASUM  $shafile"
    echo "SUM: $SHASUM"
    echo "FILE: $shafile"
    echo "SHASUMFILE: $shaSumfile"
    echo "NONE: $SHASUM $shafile"
    echo $shaSumfile #| shasum -a 512 -c
end
