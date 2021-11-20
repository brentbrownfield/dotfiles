function bwUnlock --description "Unlock the bitwarden vault"
    set -xg BW_SESSION (bw unlock --raw (read -s -P "Master Password: "))
end
