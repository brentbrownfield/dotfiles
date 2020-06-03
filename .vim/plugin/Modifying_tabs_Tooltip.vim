function! InfoGuiTooltip()
    "get window count
    let wincount = tabpagewinnr(tabpagenr(),'$')
    let bufferlist=''
   "get name of active buffers in windows
    for i in tabpagebuflist()
        let bufferlist .= '['.fnamemodify(bufname(i),':t').'] ' 
    endfor
    
    return bufname($).' windows: '.wincount.' '.bufferlist.' '
endfunction
