
nnoremap <buffer>  <C-c> :! pdflatex %<CR><CR>
nnoremap <buffer> <C-x> :! zathura $(echo % \| sed 's/tex$/pdf/') & disown<CR>
