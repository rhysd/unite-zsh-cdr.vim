scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

let s:source = {
            \ "name" : "zsh-cdr",
            \ "description" : "access recent files using zsh cdr",
            \ "default_kind" : "file"
            \ }

function! unite#sources#zsh_cdr#define()
    return filereadable(expand('~/.chpwd-recent-dirs')) ? s:source : {}
endfunction

function! s:source.gather_candidates(args, context)
    let chpwd_recent_dirs = readfile(expand('~/.chpwd-recent-dirs'))
    return map(chpwd_recent_dirs, "{'word' : v:val}")
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
