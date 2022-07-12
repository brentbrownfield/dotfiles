# Defined via `source`
function dlabels --wraps='docker inspect --format="{{.Config.Labels}}"' --description 'alias dlabels=docker inspect --format="{{.Config.Labels}}"'
  docker inspect --format="{{.Config.Labels}}" $argv; 
end
