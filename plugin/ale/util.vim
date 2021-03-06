if exists('g:loaded_ale_util')
    finish
endif

let g:loaded_ale_util = 1

function! s:FindWrapperScript()
    for parent in split(&runtimepath, ',')
        " Expand the path to deal with ~ issues.
        let path = expand(parent . '/' . 'stdin-wrapper')

        if filereadable(path)
            return path
        endif
    endfor
endfunction

let g:ale#util#stdin_wrapper = s:FindWrapperScript()
