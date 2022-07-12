# Defined via `source`
function dpsnip --wraps=docker\ ps\ --format\ \'table\ \{\{.Names\}\}\\t\ \{\{.Image\}\}\\t\ \{\{.Ports\}\}\' --description alias\ dpsnip\ docker\ ps\ --format\ \'table\ \{\{.Names\}\}\\t\ \{\{.Image\}\}\\t\ \{\{.Ports\}\}\'
  docker ps --format 'table {{.Names}}\t {{.Image}}\t {{.Ports}}' $argv; 
end
