if exists('g:loaded_syntastic_scala_ensime_checker')
    finish
endif
let g:loaded_syntastic_scala_ensime_checker = 1

function! SyntaxCheckers_scala_ensime_GetHighlightRegex(error)
    if a:error['end']
        let lcol = a:error['col'] - 1
        let rcol = a:error['end']
        let ret = '\%>' . lcol . 'c\%<' . rcol . 'c'
    else
        let ret = ''
    endif

    return ret
endfunction

function! SyntaxCheckers_scala_ensime_GetLocList() dict
    if exists('g:scala_ensime_loclist')
        return g:scala_ensime_loclist
    else
        return []
    endif
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
            \ 'exec': 'true',
            \ 'filetype': 'scala',
            \ 'name': 'ensime'})

" vim: set sw=4 sts=4 et fdm=marker:
