function! SimpleBalloon()
   return 'Cursor is at line/column: ' . v:beval_lnum .
		\'/' . v:beval_col .
		\ ' in file ' .  bufname(v:beval_bufnr) .
		\ '. Word under cursor is: "' . v:beval_text . '"'
endfunction
"set balloonexpr=SimpleBalloon()
"set ballooneval
