# Defined in - @ line 1
function glg --wraps='git log --graph' --description 'alias glg git log --graph'
  git log --graph $argv;
end
