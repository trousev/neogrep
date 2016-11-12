let g:neogrep_grep_command="grep"
let g:neogrep_grep_arguments="-niR"

let g:exclude_files=['*.jpg', '*.png', '*.min.js', '*.swp', '*.pyc']
let g:exclude_dirs=['.svn', '.git', 'node_modules', 'generated', 'tmp']


function! neogrep#entry_to_warning(entry)
  let a:entry.type = 'I'
endfunction

function! neogrep#global_search()
    let neomake_searchq=input('Global Search: ')
    let args = ['-niR', neomake_searchq]
    let exfile=""
    let exdir=""
    
    for exfile in g:exclude_files
        let args += ["--exclude"]
        let args += [exfile]
    endfor

    for exdir in g:exclude_files
        let args += ["--exclude-dir"]
        let args += [exdir]
    endfor

    let g:neomake_grep_maker = {
        \ 'exec': 'grep',
        \ 'args': args,
        \ 'errorformat': '%f:%l: %m',
        \ 'append_file': 0,
        \ 'postprocess': function('neogrep#entry_to_warning')
        \ }
    Neomake! grep
endfunction


