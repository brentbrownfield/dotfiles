# Defined via `source`
function difn --wraps='docker images --filter label=Name=$1' --wraps='docker images --filter label=Name=$argv' --description 'alias difn=docker images --filter label=Name=$argv'
  docker images --filter label=Name=$argv $argv; 
end
