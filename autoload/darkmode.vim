if exists('g:darkmode#loaded')
  finish
else
  let g:darkmode#loaded = 1
endif

let s:is_dark_mode = "osascript -e 'tell application \"System Events\" to get dark mode of appearance preferences'"

function! s:detect_macOS(ver) " check if macOS `ver` or above is running 
  if has("unix")
        \ && system("uname") =~ "Darwin" 
        \ && str2float(system("osascript -e 'get system version of (system info)'")) >= a:ver
    return 1
  else
    return 0
  endif
endfunction

function! darkmode#switch()
if s:detect_macOS(10.14)
  if system(s:is_dark_mode) =~ '^true' 
    set background=dark
  else
    set background=light
  endif
endif
endfunction

