" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

filetype plugin on

set hls
set nu
set updatetime=1000
"hi ModeMsg ctermfg=1
hi ModeMsg ctermfg=1

map <F2> :set nu!<CR>
map <F4> :NERDTreeToggle<CR>
map <C-k> :bp<CR>
map <C-l> :bn<CR>
map e :pop<CR>
map qq :q!<CR>
map qq :q!<CR>
map qw :wq<CR> 
map w :w<CR>


" Taglist setting
map <F3> :Tlist<CR>
"if has("autocmd")
	"au BufWritePost * TlistUpdate
"endif

" Key Map for Comment/Uncomment
" - in Normal mode
nmap mn :call NERDComment(-1,"norm")<CR>
nmap mu :call NERDComment(0,"uncomment")<CR>
nmap mm :call NERDComment(0,"toggle")<CR>
nmap ms :call NERDComment(0,"sexy")<CR>
nmap m$ :call NERDComment(0,"toEOL")<CR>
nmap ma :call NERDComment(0,"append")<CR>
nmap mi :call NERDComment(0,"insert")<CR>
"nmap mn :call NERDComment(0,"nested")<CR>
"nmap mv :call NERDComment(0,"invert")<CR>
"nmap mI :call NERDComment(0,"minimal")<CR>
"nmap my :call NERDComment(0,"yank")<CR>
"nmap ml :call NERDComment(0,"alignLeft")<CR>
"nmap mb :call NERDComment(0,"alignBoth")<CR>
" - in Visual mode
vmap mn :call NERDComment(1,"norm")<CR>
vmap mu :call NERDComment(1,"uncomment")<CR>
vmap mm :call NERDComment(1,"toggle")<CR>
vmap ms :call NERDComment(1,"sexy")<CR>
vmap m$ :call NERDComment(1,"toEOL")<CR>
vmap ma :call NERDComment(1,"append")<CR>
vmap mi :call NERDComment(1,"insert")<CR>

" Cscope setting
"
function UpdateTags()
	TlistUpdate
	if filereadable("cscope.out")
		cs kill -1
		cs add cscope.out
	endif
endfunction

map <F12> :call UpdateTags()<CR>

if has("cscope")
	" Add database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	endif

	" Key map for Cscope
	nmap t :cs find c <C-R>=expand("<cword>") <CR><CR>
	nmap f :cs find g <C-R>=expand("<cword>") <CR><CR>

	nmap ss :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap sg :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap sc :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap st :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap se :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap sf :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap si :cs find i <C-R>=expand("<cfile>")<CR><CR>
	nmap sd :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

if filereadable("tags")
	set tag=tags
"	set autochdir
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" add for highlight space "
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd BufWinLeave * call clearmatches()

"autocmd BufWritePre * call StripWhite()

fun! StripWhite()
%s/[ \t]\+$//ge
%s!^\( \+\)\t!\=StrRepeat("\t", 1 + strlen(submatch(1)) / 8)!ge
endfun

"let g:neocomplcache_enable_at_startup = 1
