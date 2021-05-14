" Start vim plug
call plug#begin('~/.vim/plugged')

" Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Highlighting syntatx
Plug 'vim-syntastic/syntastic'

" Tab autocomplete
Plug 'ervandew/supertab'

" Autocomplete for open-close pairs
Plug 'Townk/vim-autoclose'

" File browser
Plug 'preservim/nerdtree'

" Debugger
Plug 'puremourning/vimspector'

" Extra Vim Modes
Plug 'kana/vim-submode'

call plug#end()


" General Vim Config
set encoding=utf-8
set number
set spell
set updatetime=100
set modifiable


" Tab = 4 spaces for python
autocmd Filetype python setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab


" Vim Colors
colorscheme molokai

" Use terminal colors and bug fix
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Latex Config
let g:livepreview_previewer='firefox'

" Synastic Config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Synastic Extension config
let g:syntastic_php_checkers = ["php","html"]
let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_plaintex_checkers = ["lacheck"]

" Nerdtree config
map <C-n> :NERDTreeToggle<CR>

" Debugger config
let g:vimspector_install_gadgets = ['vscode-cpptools']
let g:vimspector_enable_mappings = 'HUMAN'



" Window Management Sub Mode



" A message will appear in the message line when you're in a submode
" and stay there until the mode has existed.
let g:submode_always_show_submode = 1

" We're taking over the default <C-w> setting. Don't worry we'll do
" our best to put back the default functionality.
call submode#enter_with('window', 'n', '', '<C-w>')

" Note: <C-c> will also get you out to the mode without this mapping.
" Note: <C-[> also behaves as <ESC>
call submode#leave_with('window', 'n', '', '<ESC>')
" Go through every letter
for key in ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
	"maps lowercase, uppercase and <C-key>
	call submode#map('window', 'n', '', key, '<C-w>' . key)
	call submode#map('window', 'n', '', toupper(key), '<C-w>' . toupper(key))
	call submode#map('window', 'n', '', '<C-' . key . '>', '<C-w>' . '<C-'.key . '>')
endfor

" Go through symbols. Sadly, '|', not supported in submode plugin.
for key in ['=','_','+','-','<','>']
	call submode#map('window', 'n', '', key, '<C-w>' . key)
endfor

" Old way, just in case.
nnoremap <Leader>w <C-w>
