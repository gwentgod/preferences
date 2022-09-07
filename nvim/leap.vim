nnoremap ,p a<++><Esc>
inoremap ,p <++>
nnoremap ,e /<++><Return>c4l
inoremap ,e <Esc>/<++><Return>c4l
nnoremap ,r /<++><Return>v3lr R
inoremap ,r <Esc>/<++><Return>v3lr R

autocmd Filetype markdown nnoremap <buffer> ,0 :s/#\+ //e<Return>$
autocmd Filetype markdown nnoremap <buffer> ,1 :s/#\+ //e<Return>I#<Space><Esc>$
autocmd Filetype markdown nnoremap <buffer> ,2 :s/#\+ //e<Return>I##<Space><Esc>$
autocmd Filetype markdown nnoremap <buffer> ,3 :s/#\+ //e<Return>I###<Space><Esc>$
autocmd Filetype markdown nnoremap <buffer> ,4 :s/#\+ //e<Return>I####<Space><Esc>$
autocmd Filetype markdown nnoremap <buffer> ,5 :s/#\+ //e<Return>I#####<Space><Esc>$
autocmd Filetype markdown nnoremap <buffer> ,6 :s/#\+ //e<Return>I######<Space><Esc>$
autocmd Filetype markdown inoremap <buffer> ,0 <Esc>:s/#\+ //e<Return>A
autocmd Filetype markdown inoremap <buffer> ,1 <Esc>:s/#\+ //e<Return>I#<Space><Esc>A
autocmd Filetype markdown inoremap <buffer> ,2 <Esc>:s/#\+ //e<Return>I##<Space><Esc>A
autocmd Filetype markdown inoremap <buffer> ,3 <Esc>:s/#\+ //e<Return>I###<Space><Esc>A
autocmd Filetype markdown inoremap <buffer> ,4 <Esc>:s/#\+ //e<Return>I####<Space><Esc>A
autocmd Filetype markdown inoremap <buffer> ,5 <Esc>:s/#\+ //e<Return>I#####<Space><Esc>A
autocmd Filetype markdown inoremap <buffer> ,6 <Esc>:s/#\+ //e<Return>I######<Space><Esc>A
autocmd Filetype markdown inoremap <buffer> ,b ****<++><Esc>5hi
autocmd Filetype markdown inoremap <buffer> ,d ~~~~<++><Esc>5hi
autocmd Filetype markdown inoremap <buffer> ,h ====<++><Esc>5hi
autocmd Filetype markdown inoremap <buffer> ,c ```<Return>```<Return><++><Esc>2kA
autocmd Filetype tex,markdown inoremap <buffer> ,m $$<Return>$$<Return><++><Esc>kO
