let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeShowHidden=1

" Ignore certain files in NERDTree
let NERDTreeIgnore=[
	\ '\.git$',
	\ '\.DS_Store$',
	\ '\.bundle$',
	\ 'tmp/',
	\ 'coverage',
	\ '\.sass-cache',
	\ '^_build$',
	\ '^node_modules$',
	\ '.pnpm-store$'
\ ]

" Don't open NERDTree if I open a directory with vim
leg g:NERDTreeHijackNetrw=0

" Open/Close the NERDTree using `Ctrl + T` to toggle.
nmap <C-T> :NERDTreeToggle<CR>

" 'Find in Tree' find currently open buffer file in tree
if exists('g:vscode')
	"VSCode extension
	nnoremap <leader>ft <Cmd>call VSCodeNotify('workbench.files.action.showActiveFileInExplorer')<CR>
else
	" Normal (Neo)vim
	nmap <leader>ft :NERDTreeFind<CR>
endif