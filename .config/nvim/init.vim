let mapleader =","

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'jreybert/vimagit'
Plug 'lukesmithxyz/vimling'
Plug 'vimwiki/vimwiki'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'kovetskiy/sxhkd-vim'
Plug 'ap/vim-css-color'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier', {
	\ 'do': 'npm install',
	\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'alvan/vim-closetag'
Plug 'liuchengxu/space-vim-dark'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'majutsushi/tagbar'
call plug#end()

set bg=light
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
" set cursorline
set sw=2
set noshowmode

" Some basics:
  nnoremap c "_c
  set nocompatible
  filetype plugin on
  syntax on
  set encoding=utf-8
  set number relativenumber

" Enable autocompletion:
  set wildmode=longest,list,full

" Disables automatic commenting on newline:
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
  map <leader>f :Goyo \| set bg=light \| set linebreak<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
  map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
  set splitbelow splitright

" Nerd tree
  map <space>n :NERDTreeToggle<CR>
  autocmd bufenter * if(winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  if has('nvim')
    let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
  else
    let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
  endif

" vimling:
  nm <leader>d :call ToggleDeadKeys()<CR>
  imap <leader>d <esc>:call ToggleDeadKeys()<CR>a
  nm <leader>i :call ToggleIPA()<CR>
  imap <leader>i <esc>:call ToggleIPA()<CR>a
  nm <leader>q :call ToggleProse()<CR>

" Shortcutting split navigation, saving a keypress:
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l

" Replace ex mode with gq
  map Q gq


" Check file in shellcheck:
  map <leader>s :!clear && shellcheck %<CR>


" Open my bibliography file in split
  map <leader>b :vsp<space>$BIB<CR>
  map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
  nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
  map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
  map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
  autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
  let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
  map <leader>v :VimwikiIndex
  let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
  autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
  autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
  autocmd BufRead,BufNewFile *.tex set filetype=tex

" Save file as sudo on files that require root permission
  cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enable Goyo by default for mutt writing
  autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
  autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
  autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
  autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" Automatically deletes all trailing whitespace and newlines at end of file on save.
  autocmd BufWritePre * %s/\s\+$//e
  autocmd BufWritepre * %s/\n\+\%$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
  autocmd BufWritePost filerectories !shortcuts

" Run xrdb whenever Xdefaults or Xresources are updated.
  autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Update binds when sxhkdrc is updated.
  autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
  highlight! link DiffText MatchParen
endif

" Coc AutoComplete TAB
  inoremap <silent><expr> <TAB>
    \ pumvisible() ? coc#_select_confirm() :
    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Easymotion <,-s> Enter 2 characters
map <Leader>e <Plug>(easymotion-s2)

" Tagbar
nmap <space>t :TagbarToggle<CR>

" Typescript
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''

" Simple Shortcuts
map <space>q :q <CR>
map <space>w :w <CR>

" Tabs
nnoremap tn :tabnew<SPACE>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" Change tab to 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Prettier
map <space>p :Prettier <CR>

" Go at the beginning or the end of the line in insert mode (A)
" Ctrl+e => End of the line
inoremap <C-e> <C-o>$
" Ctrl+a => Beginning of the line
inoremap <C-a> <C-o>0

" Coc Explorer
" nmap <space>e :CocCommand explorer<CR>

 " COLORSHCEME
 colorscheme space-vim-dark
 hi Normal     ctermbg=NONE guibg=NONE
 hi LineNr     ctermbg=NONE guibg=NONE
 hi SignColumn ctermbg=NONE guibg=NONE
