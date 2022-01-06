# Defined in - @ line 1
function copy --wraps='xclip -sel clip $argv' --description 'alias copy xclip -sel clip $argv'
  xclip -sel clip $argv $argv;
end
