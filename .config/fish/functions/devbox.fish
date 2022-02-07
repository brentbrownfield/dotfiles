# Defined in - @ line 1
function devbox --wraps='TERM=xterm-256color ssh devbox' --description 'alias devbox TERM=xterm-256color ssh devbox'
  TERM=xterm-256color ssh devbox $argv;
end
