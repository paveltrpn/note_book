
" Plug 'fatih/vim-go'
" Golang vim-go plugin hightlights options
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_functions_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1

" Show identifier info in status bar
let g:go_auto_type_info = 1

let g:go_doc_popup_window = 1
let g:go_metalinter_command = "staticcheck"

" May be set to gofmt instead, because of some people claims
" that goimports may take long time for work.
let g:go_fmt_command = "goimports" 

" This is same to default value, call when go-lint
let g:go_golint_bin = "revive"

" Some vim-go remaps for easy invoke `go vet`, `gofmt`,`staticcheck`
" and `go-doc. Remaping works with \vv, \ff, \ll and \dd respectively
autocmd FileType go nnoremap <leader>ff <Plug>(go-fmt)
autocmd FileType go nnoremap <leader>ll <Plug>(go-lint)
autocmd FileType go nnoremap <leader>ml <Plug>(go-metalinter)
autocmd FileType go nnoremap <leader>dd <Plug>(go-doc)
" go vet can be replaced with statickcheck
autocmd FileType go nnoremap <leader>vv <Plug>(go-vet)
"
" Supress vim-go autocomplete preview window
set completeopt-=preview

" Autoclose vim-go autocomplete preview window when
" close autocomplete popup hover window
"augroup completion_preview_close
"  autocmd!
"  autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | augroup END
