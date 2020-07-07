" === Coc.nvim === "
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" =============== adding commands from coc-nvim
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OverrideMethod   :call     CocAction('runCommand', 'source.overrideMethods')


nmap <silent> <leader>cd <Plug>(coc-definition)
nmap <silent> <leader>cr <Plug>(coc-references)
nmap <silent> <leader>ci <Plug>(coc-implementation)
nmap <silent> <leader>cy <Plug>(coc-type-definition)
nnoremap <silent> <leader>ca :CocAction<CR>
nnoremap <silent> <leader>cc :CocCommand<CR>
nnoremap <silent> <leader>co :OverrideMethod<CR>
nnoremap <silent> <leader>cf :Format<CR>

"nnoremap <leader>co :call CocAction('runCommand','')

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Rename current file
nnoremap <leader>rf :CocCommand workspace.renameCurrentFile<CR>

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
vmap <silent> <leader>a  <Plug>(coc-codeaction-selected)<CR>
nmap <silent> <leader>a  <Plug>(coc-codeaction-selected)<CR>
" Remap keys for applying codeAction to the current line.
nmap <silent> <leader>ac  <Plug>(coc-codeaction)<CR>
" Apply AutoFix to problem on the current line.
nmap <silent> <leader>qf  <Plug>(coc-fix-current)<CR>

" === NeoSnippet === "
" Map <C-k> as shortcut to activate snippet if available
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" coc.nvim color changes
hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type