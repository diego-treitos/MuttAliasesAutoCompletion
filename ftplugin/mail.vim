" vim: set ts=2 sw=2 sts=2 et:
"
" Name:        Mutt Aliases Auto-Completion
" File:        mail.vim
" Description: Plugin auto-completing contacts from mutt aliases
" Author:      Diego Blanco <diego.blanco@treitos.com>
" License:     Vim license
" Website:     http://github.com/diego-treitos
" Version:     0.1

" Check if already loaded
if exists("g:loaded_MuttAliasesAutoCompletion")
    finish
endif
let g:loaded_MuttAliasesAutoCompletion=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Contact Completion
" set completion options
setl completeopt+=menu
setl completeopt+=menuone
setl completeopt+=noinsert
setl pumheight=10

" Set characters in a keyword, as we use \k to filter valid characters for
" completion
setl isk+=@-@,46,60,62

" set completefunction and remapt to Ctrl+T "
setl completefunc=CompleteContacts
inoremap <C-T> <C-X><C-U>


" Contact completion from mutt aliases
fun! CompleteContacts(findstart, base)
  if a:findstart
    " locate the start of the word
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\k'
      let start -= 1
    endwhile
    return start
  else
    " find contacts matching with "a:base"
    let res = []
    for m in readfile(expand(g:mutt_aliases_path))
      let c = join( split(m)[2:] )
      if tolower(c) =~ tolower(a:base)
        call add(res, c)
      endif
    endfor
    return res
  endif
endfun

" Function to handle autocompletion
fun! AutoCompleteContacts()
  if v:char !~ '\k'
    return
  endif

  let line = tolower(getline('.'))
  if line !~ '^\(cc\|bcc\|to\): '
    return
  endif

  call feedkeys("\<C-X>\<C-U>", 'i')
endfun

" Call the autocmd
augroup AutoCompleteContacts
  autocmd!
  autocmd InsertCharPre * noautocmd call AutoCompleteContacts()
augroup END
