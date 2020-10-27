let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1

syntax on 
set nocompatible
set nu
set noerrorbells
set novisualbell
set ignorecase
set cindent 
set expandtab
set matchpairs=(:),{:},[:],<:>
set ruler
set autowrite
set autoread
set ts =4
set sw =4
set pastetoggle=<F11>
set tags=/work/latest_build/SWR/src/net/onesaf/core/tags
set mouse=a
set sm
set ai
set tabstop=4
set shiftwidth=4
set wrapscan
set ignorecase
set hlsearch
set incsearch
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2
set foldmethod=manual

if has("autocmd")
    filetype plugin on
endif

let paste_mode = 0 " 0 = normal, 1 = paste

func! Paste_on_off()
        if g:paste_mode == 0
                set paste
                let g:paste_mode = 1
        else
                set nopaste
                let g:paste_mode = 0
        endif  
        return
endfunc 
set pastetoggle=<F11>
set background=dark
colo peachpuff


" Set nice colors
" background for normal text is light grey
" Text below the last line is darker grey
" Cursor is green
" Constants are not underlined but have a slightly lighter background
"highlight Normal guibg=grey90 
"highlight Cursor guibg=Green guifg=NONE
"highlight NonText guibg=grey80 
"highlight Constant gui=NONE guibg=grey95
"highlight Special gui=NONE guibg=grey95

"hi normal ctermfg=black ctermbg=grey
"highlight LineNr ctermfg=white ctermbg=DarkBlue

set tabline=%!ShortTabLine()
set guitablabel=%{ShortTabLabel()}
set guitabtooltip=%!InfoGuiTooltip()
"set balloonexpr=FoldSpellBallon()
"set ballooneval
so ~/.vim/myfiletypes.vim

"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

"Buffer navigation
map <C-right> <ESC>:bn<CR>
map <C-left>  <ESC>:bp<CR>

"Signs
"sign define information text=!> linehl=Warning texthl=Error
"map <F7> :exe ":sign place 123 line=" . line(".") ." name=information file=" . expand("%:p")<CR>
"map <C-F7> :sign unplace<CR>

"Taglist navigation
nmap <buffer> <F8> <C-]>
nmap <buffer> <S-F8> <C-T>
nmap <buffer> <A-F8> <:ptselect<CR>
nmap <buffer> <F9> :tnext<CR>
nmap <buffer> <C-F9> :tprev<CR>
