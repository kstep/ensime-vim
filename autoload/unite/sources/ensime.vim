let s:unite_source = {
            \ 'name': 'ensime',
            \ }
let s:search_results = []

function! s:unite_source.gather_candidates(args, context)
    "call ensime#com_en_search_symbol(a:args, '')
    while len(s:search_results) == 0
        sleep 100m
    endwhile
    return s:search_results
endfunction

function! unite#sources#ensime#define()
    return s:unite_source
endfunction

function! unite#sources#ensime#search_results_ready(results)
    let s:search_results = a:results
endfunction
