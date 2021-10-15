function verifySHA256 --argument-names $shafile --description "Verify a SHA256 checksum from file"
    echo (cat $shafile.sha256)"  $shafile" | shasum -a 256 -c
end
