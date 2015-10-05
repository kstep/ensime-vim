let s:unite_source = {
            \ 'name': 'ensime',
            \ 'hooks': {}
            \ }
let s:search_results = []

function! s:unite_source.hooks.on_init(args, context)
  let target = get(a:args, 0, '')

  let a:context.source__input = get(a:args, 0, a:context.input)
  if a:context.source__input == '' || a:context.unite__is_restart
    let a:context.source__input = unite#util#input('Pattern: ',
          \ a:context.source__input,
          \ 'customlist,unite#helper#complete_search_history')
  endif
endfunction

function! s:unite_source.gather_candidates(args, context)
    let input = get(a:context, "source__input", '')
    if input
        call ensime#com_en_search_symbol(input, '')
        while len(s:search_results) == 0
            sleep 100m
        endwhile
    endif
    return s:search_results
endfunction

function! unite#sources#ensime#define()
    return s:unite_source
endfunction

function! unite#sources#ensime#search_results_ready(results)
    let s:search_results = a:results
endfunction
