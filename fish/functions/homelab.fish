function backup-immich 
    sudo ~/dev/kumarmo2/homelab/immich/backup.sh
end

function valkey-cli
docker exec -ti valkey /usr/local/bin/valkey-cli
end

function garage 
docker exec -ti garage-homelab /garage
end
