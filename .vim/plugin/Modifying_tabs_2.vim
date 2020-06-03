  function ShortTabLabel()
     let bufnrlist = tabpagebuflist(v:lnum)
     " show only the first 6 letters of the name + ..
     let label = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
     let filename = fnamemodify(label,':h')
     " only add .. if string is more than 8 letters
      if strlen(filename) >=8
         let ret=filename[0:5].'..'
      else
        let ret = filename
     endif
         return ret
     endfunction
