"" Cycle through splits with tab
nmap <Tab> <C-w>w

"" Easier direct split navigation with ctrl + homerow keys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" lazy command open
"" nnoremap ; :
"" vnoremap ; : 

"" Toggle relative line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>