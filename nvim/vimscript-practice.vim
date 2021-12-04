let mapleader = ","

nnoremap <leader>qq :q<CR>


let message = "vim started"

echo message

" echom doesn't clear the previous message.
echom "second line without erasing the previous one"


" >>>>> variable types. there are more but the following are the common ones.

let string = "string"
let number = 1
let float = 1.0
let list = [1 ,2, "hello", "world"]
let dictionary = { "message": "hello world"}

" multi line statements
let list2 = [
\ 1, 2,
\ "hello",
\ "world" ]

echom list2

" NOTE: comments in multi line statements are not valid.
"
"

" Variable scoping
"

let g:global_var = "global variable accessible across all script"

let s:script_var = "script level variable accessible across the entire script/file"

" declaring variable like `l:local_var` is not working for some reason.
"let l:local_var = "local variable accessible only in the scope"

let local_var = "local variable accessible only in the scope"

let b:buffer_var = "buffer scope"

let w:window_var = "window scope"

let t:tab_var = "tab scope"

echom "value of global global_var: " g:global_var

echom "value of script level scoped script_var: " s:script_var


" >>>>> Functions <<

let s:greeting = 'Hello'

" global function's name must start with Capital letter
function g:Greet(name)

	" dot here is for concatenation
	echom s:greeting . " " . a:name

endfunction

" calling Greet function here.
call g:Greet("world")



" Error handling
" by default if a function fails for some reason, the rest of
" the script still continues getting executed.
" if you want to stop in case of some error, use `abort`.
"
"
"
"

"
"function g:Greet2(message) abort
"
	"echom s:greeting
	"echom a:name
"
"endfunction

"call g:Greet2("world")
"
"

" Exceptio Handling is also there in vimscript. google it.
"


" >>>> variable function arguements
"
"

function s:func1(message, ...) 

	echom "message:" . "  " . a:message
	echom "a:0 >> " a:0

	echom "first value: " a:0
	echom "second value: " a:1

endfunction


"call s:func1()
call s:func1("asaaaaaaaaaaaa", "fffffff", "sdfdsf", "sdfxckjsdof")
call s:func1("dsfsdf", "xvxcvxcv")







