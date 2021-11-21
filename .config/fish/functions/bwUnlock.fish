function bwUnlock --description "Unlock the bitwarden vault"
    set -xU BW_SESSION (bw unlock --raw (read -s -P "Master Password: "))
end
