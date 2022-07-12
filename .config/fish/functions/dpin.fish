# Defined in - @ line 1
function dpin --wraps=docker\ ps\ --format\ \"table\ \{\{.ID\}\}\\t\{\{.Names\}\}\" --description alias\ dpin\ docker\ ps\ --format\ \"table\ \{\{.ID\}\}\\t\{\{.Names\}\}\"
  docker ps --format "table {{.ID}}\t{{.Names}}" $argv;
end
