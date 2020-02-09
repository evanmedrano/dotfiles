""
"" Janus setup
""

" Define paths
if has('win32') || has('win64') || has('win32unix')
  let g:janus_path = escape(expand("~/.vim/janus/vim"), ' ')
  let g:janus_vim_path = escape(expand("~/.vim/janus/vim"), ' ')
else
  let g:janus_path = escape(fnamemodify(resolve(expand("<sfile>:p")), ":h"), ' ')
  let g:janus_vim_path = escape(fnamemodify(resolve(expand("<sfile>:p" . "vim")), ":h"), ' ')
endif
let g:janus_custom_path = expand("~/.janus")

" Source janus's core
exe 'source ' . g:janus_vim_path . '/core/before/plugin/janus.vim'

" You should note that groups will be processed by Pathogen in reverse
" order they were added.
call janus#add_group("tools")
call janus#add_group("langs")
call janus#add_group("colors")

""
"" Customisations
""

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" Additional Plugins
call plug#begin()
Plug 'https://github.com/mattn/emmet-vim.git'
Plug 'https://github.com/tpope/vim-rails.git'
Plug 'https://github.com/vim-ruby/vim-ruby.git'
Plug 'https://github.com/thoughtbot/vim-rspec.git'
Plug 'https://github.com/ap/vim-css-color.git'
call plug#end()

" Customize keys for plugins
let g:user_emmet_leader_key = ','
let g:rspec_runner = "os_x_iterm2"
" Disable plugins prior to loading pathogen
exe 'source ' . g:janus_vim_path . '/core/plugins.vim'

" Custom mappings

" Normal mode
nmap <C-s> <esc>:w<CR>
nmap <C-t> <esc>:tabnew<CR>
nmap <C-x> <C-w>c

nmap 0 ^
nmap k gk
nmap j gj

" Insert mode
imap <C-s> <esc>:w<CR>
imap jk <esc>
imap kj <esc>

" Commands to help with typos
command! Q q
command! Qall qall
command! QA qall
command! E e
command! W w
command! Wq wq

""
"" Pathogen setup
""

" Load all groups, custom dir, and janus core
call janus#load_pathogen()

" .vimrc.after is loaded after the plugins have loaded
