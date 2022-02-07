# Defined via `source`
function dienv --wraps=docker\ inspect\ --format\ \'\{\{range\ .Config.Env\}\}\{\{println\ .\}\}\{\{end\}\}\' --description alias\ dienv\ docker\ inspect\ --format\ \'\{\{range\ .Config.Env\}\}\{\{println\ .\}\}\{\{end\}\}\'
  docker inspect --format '{{range .Config.Env}}{{println .}}{{end}}' $argv; 
end
