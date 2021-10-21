set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


Plugin 'christoomey/vim-tmux-navigator'
Plugin 'lifepillar/vim-solarized8'
Plugin 'altercation/vim-colors-solarized'
" plugin on GitHub repo
Plugin 'hashivim/vim-terraform'
Plugin 'tpope/vim-fugitive'
Plugin 'wellle/targets.vim'
Plugin 'tpope/vim-rhubarb'
" Plugin 'tpope/vim-surround'
Plugin 'machakann/vim-sandwich'
" Plugin 'fatih/vim-go'
" Plugin 'davidhalter/jedi-vim'
Plugin 'mg979/vim-visual-multi'
Plugin 'vimwiki/vimwiki'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
" async autocompletion
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

Plugin 'yegappan/grep'
Plugin 'tpope/vim-unimpaired'
Plugin 'itchyny/lightline.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" set syntax highlighting
syntax on

" allow backspace in insert mode
set backspace=indent,eol,start

" use 4 spaces for tabs, and set tab width for specific filetypes
set expandtab tabstop=4 softtabstop=4 shiftwidth=4
" set expandtab tabstop=2 softtabstop=2 shiftwidth=2

" enable mouse support in vim
set mouse+=a

" add line numbers
set number

" allow search to match lowercase
set ignorecase
set smartcase


if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

    if has("unnamedplus") " X11 support
        set clipboard+=unnamedplus
          endif
          endif


let g:lsp_diagnostics_echo_cursor = 1

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)

    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
