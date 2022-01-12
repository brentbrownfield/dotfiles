function bwUnlock --description "Unlock the bitwarden vault"
    if set -q BW_PASSWORD
        set -xU BW_SESSION (bw unlock --raw --passwordenv BW_PASSWORD)
    else
        set -xU BW_SESSION (bw unlock --raw (read -s -P "Master Password: "))
    end
end
