if exists('g:loaded_ale_linters_c_gcc')
    finish
endif

let g:loaded_ale_linters_c_gcc = 1

" Set this option to change the GCC options for warnings for C.
if !exists('g:ale_c_gcc_options')
    let g:ale_c_gcc_options = '-Wall'
endif

call ALEAddLinter('c', {
\   'name': 'gcc',
\   'output_stream': 'stderr',
\   'executable': 'gcc',
\   'command': 'gcc -S -x c -fsyntax-only '
\       . g:ale_c_gcc_options
\       . ' -',
\   'callback': 'ale#handlers#HandleGCCFormat',
\})
