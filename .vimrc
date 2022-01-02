" .vimrc file @SeymourPashayev
" Signature
:iabbrev ssig -- <cr>Seymour Pashayev<cr>gitHub:@SeymourPashayev

" ===========================
" =	File Contents	    =
" ===========================
"
" 1. Environment Setup
" 2. Basics Setup
" 3. Navigation
" 4. Working With Text
"
" ===========================


" ---- Environment Setup ----
" Environment prev for large file preview through buffers
if $VIMENV == 'prev'
	:noremap <Space> :n<CR>
	:noremap <Backspace> :N<CR>
	:set noswapfile
endif

" ---- Basics Setup ----
" shows line number and sets number-row width
:set number
:set numberwidth=2
:set nocompatible
:set noesckeys

" Adds back arrows in insert mode
:set t_ku=OA
:set t_kd=OB
:set t_kr=OC
:set t_kl=OD

:set mouse=a

" Sets the leader
:let mapleader="-"

" (Make it easy (Make it easy (Edit Text)))
" ed stands for EDit .vimrc
:nnoremap <leader>ed :split $MYVIMRC<cr>

" Source the updated .vimrc into current vi session
" u stands for Update source .vimrc file
:nnoremap <leader>u :source $MYVIMRC<cr>

" ---- Navigation ---- 
" Sets esc to no-operation so you are forced to use your own mapping
:inoremap <esc> <nop>

" Sets ht to esc 
:inoremap ht <esc>

" Remove Arrow-Key mapping from normal mode
:nnoremap <Up> <nop>
:nnoremap <Down> <nop>
:nnoremap <Left> <nop>
:nnoremap <Right> <nop>

" Set H and L to repeat the behaviour of h and l but on cocaine
:nnoremap H 0
:nnoremap L $

" Superuser setup for LL: does what L does but with a <CR>
:nnoremap LL $o

" Set t, (<) and t. (>) to move around tabs quickly
:nnoremap <leader>t, :tabprevious<CR>
:nnoremap <leader>t. :tabnext<CR>



" ---- Working With Text ----
" Wrap the selected word into " and '
:nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
:nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

" Remove oCcurences of selected text
:nnoremap <leader>rc :echo system('grep -v ', getreg('"', 1, 1))
"FIXME: Find a way to pass selected text into :commands

" Text Lookup
" Create a new tab and look for selected text
" FIXME: Does Not work the intended way, but :TABNEW | Read !grep -Hnr 'self'

" -----------------------------------
" Code under that line is not written by @SeymourPashayev, solely maintained
" -----------------------------------

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'bling/vim-airline'

" Initialize plugin system
call plug#end()
