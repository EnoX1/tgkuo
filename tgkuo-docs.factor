USING: 
kernel prettyprint  strings sequences command-line io.backend
help.syntax   vocabs.loader help.markup help.vocabs 
ui io  calendar formatting formatting.private 
furnace.actions 
wolfram-alpha refactor webbrowser webbrowser.macosx wordgen alfredo.doubleSquares alfredo.counting-primes ;

IN: tgkuo
 

HELP: tkTest
{ $values { "-" "-" } }
{ $description 
    "Writes the arguments (specified on the stack) formatted according to the format string.\n" 
    "Several format specifications exist for handling arguments of different types, and "
    "see main UI help  "  { $link "tk-UI" } "." 
 
} 


;

! ------------------------------------------------

ARTICLE: "TkMain" "TK Main"

{ $description 
    " Link to tgkuo vocab words "  
} 

{ $heading "My Help documents" }
{ $subsections
  "tk-UI"  
  "tkWeb" 
  "refactor-code" 
  "alfredo"
  "TkInit"
  "TkFFI" 
  "bluishcoder"

} 

{ $heading "Web links" }
! { $url "http://www.factorcode.org" }
 

{ $heading "Usabe power tools" }

{ $code "\\ reverse usage. " }
{ $code "\\ reverse uses " }
{ $code "\"word\" apropos " }

{ $code "\"factor-rc\" rc-path  highlight. " }

{ $code "\"USING: tgkuo \" \"factor-rc\" rc-path ascii set-file-contents " }

{ $vocab "tgkuo"} 

;

! ----------------------------------------------------

ARTICLE: "tk-UI" "Tk UI codes"
{ $description 
     "Link to tgkuo vocab words:  " { $link tkTest } "."
}
$nl
$date   
$nl
{ $heading "Main-WINDOW: Help" }
{ $subsections
  "tk-MainWindow" 
}
{ $heading "Image Help" }
{ $subsections
  "tk-Image" 
}
{ $heading "Button Help" }
{ $subsections
  "tk-Button" 
}
{ $heading "Image Help" }
{ $subsections
  "tk-Image" 
}
;

! ----------------------------------------------------

ARTICLE: "tk-Button" "Tk Button codes"

"Button in the listener"
{ $code "USING:  ui ui.gadgets.buttons ui.gadgets.panes ui.tools.listener vocabs.loader ; 
       \"demos\" [ drop [ \"demos\" run ] \\ run call-listener ] <border-button> 
        gadget. "  
} 

"Button in the world"
{ $code "USING:  ui ui.gadgets.buttons ui.gadgets.panes ui.tools.listener vocabs.loader ; 
        f T{ world-attributes { title \"Demos\" } } clone 
       \"demos\" [ drop [ \"demos\" run ] \\ run call-listener ] <border-button> 
       >>gadgets open-window "  
} 

"Button in MAIN-WINDOW: "
{ $code "USING:  ui ui.gadgets.buttons ui.gadgets.panes ui.tools.listener vocabs.loader ; 
        MAIN-WINDOW: tk001 { { title \"Demos\" } }  
       \"demos\" [ drop [ \"demos\" run ] \\ run call-listener ] <border-button> 
       >>gadgets ; tk001"  
} 

{ $examples  

    { $example
        "USING:  ui ui.gadgets.buttons ui.gadgets.panes ui.tools.listener vocabs.loader ; "
        "\"Tk Button\" [ drop \"demos\" run ] <border-button> gadget."
        "Tk-Button" } 
    { $example
        "USING: formatting ;"
        "1.23456789 \"%.3f\" printf"
        "1.235" } 
    { $example
        "USING: formatting ;"
        "12 \"%'#4d\" printf"
        "##12" } 
    { $example
        "USING: formatting ;"
        "1234 \"%+d\" printf"
        "+1234" } 
    { $example
        "USING: formatting ;"
        "{ 1 2 3 } \"%[%d, %]\" printf"
        "{ 1, 2, 3 }" } 
    { $example
        "USING: formatting ;"
        "H{ { 1 2 } { 3 4 } } \"%[%d: %d %]\" printf"
        "{ 1:2, 3:4 }" }
} 
;

! ----------------------------------------------------

ARTICLE: "tk-Image" "Tk Image codes"
" see wolfram-alpha code: " { $link wolfram-image. } "."
$nl
"open image file and show in window"
{ $code "USING: kernel images.jpeg images.bitmap ui ui.gadgets.buttons ui.gadgets.panes ui.tools.listener vocabs.loader ;  
 open-dir-panel first image-window "
}
$nl
"Button in the world"
{ $code "USING:  ui ui.gadgets.buttons ui.gadgets.panes ui.tools.listener vocabs.loader ; 
        f T{ world-attributes { title \"Demos\" } } clone 
       \"demos\" [ drop [ \"demos\" run ] \\ run call-listener ] <border-button> 
       >>gadgets open-window "  
} 
{ $examples  

    { $example
        "USING:  ui ui.gadgets.buttons ui.gadgets.panes ui.tools.listener vocabs.loader ; "
        "\"Tk Button\" [ drop \"demos\" run ] <border-button> gadget."
        "Tk-Button" } 
    { $example
        "USING: formatting ;"
        "1.23456789 \"%.3f\" printf"
        "1.235" } 
    { $example
        "USING: formatting ;"
        "12 \"%'#4d\" printf"
        "##12" } 
    { $example
        "USING: formatting ;"
        "1234 \"%+d\" printf"
        "+1234" } 
    { $example
        "USING: formatting ;"
        "{ 1 2 3 } \"%[%d, %]\" printf"
        "{ 1, 2, 3 }" } 
    { $example
        "USING: formatting ;"
        "H{ { 1 2 } { 3 4 } } \"%[%d: %d %]\" printf"
        "{ 1:2, 3:4 }" }
} 
;

! ----------------------------------------------------

ARTICLE: "tk-MainWindow" "Tk MAINWINDOW: codes"
{ $examples
"From the " { $vocab-link "hello-ui" } " vocabulary. Creates a window with the title \"Hi\" containing a label reading \"Hello world\":"
}
{ $code
"""USING: accessors ui ui.gadgets.labels ui.gadgets.buttons ;
IN: hello-ui

MAIN-WINDOW: hello { { title "Hi" } }
    "Hello world" <label> >>gadgets 
    "Tk Button" [ drop "demos" run ] <border-button> >>gadgets
    ;
hello
"""
} 
;

! ------------------------------------------------

ARTICLE: "TkInit" "TK Initialization at startup"

{ $description 
    " Link to tgkuo vocab words "  
} 

{ $heading "My Help documents" }
{ $subsections 
  "factor-rc"

} 
 

{ $heading "Web links" }

{ $url-link "The fun factor in programming " "http://fun-factor.blogspot.com/" }
 

{ $heading "Usabe power tools" }
 

{ $code "\"factor-rc\" rc-path  highlight. " }
$nl
{ $code "\"USING: tgkuo \" \"factor-rc\" rc-path ascii set-file-contents " }
{ $link rc-path } 
$nl
{ $code "\"factor-rc\" rc-path  1 edit-location " }
$nl
{ $code "vocab-roots [ \".\" suffix ] change" }
$nl
{ $code "\"vocab:rot13/rot13.factor\" normalize-path " }
{ $link normalize-path }  
{ $vocab "command-line"} 

;

! ------------------------------------------------

ARTICLE: "TkFFI" "TK Easy FFI"

{ $description 
    " Link to tgkuo vocab words "  
} 

{ $heading "My Help documents" }
{ $subsections 
  "factor-rc"

} 
 

{ $heading "Web links" }

{ $url-link "The fun factor in programming " "http://fun-factor.blogspot.com/2007/10/getting-started-with-factor-easy-ffi.html" }
 

{ $heading "Usabe power tools" }
 

{ $code "\"factor-rc\" rc-path  highlight. " }
$nl
{ $code "\"USING: tgkuo \" \"factor-rc\" rc-path ascii set-file-contents " }
{ $link rc-path } 
$nl
{ $code "\"factor-rc\" rc-path  1 edit-location " }
$nl
{ $code "vocab-roots [ \".\" suffix ] change" }
$nl
{ $code "\"vocab:rot13/rot13.factor\" normalize-path " }
{ $link normalize-path }  
{ $vocab "command-line"} 

;

! ------------------------------------------------

ARTICLE: "bluishcoder" "Bluishcoder blog"

{ $description 
    " Link to tgkuo vocab words "  
} 

{ $heading "My Help documents" }
{ $subsections 
  "factor-rc"
 
} 
 

{ $heading "Web links" }
$nl 
{ $url-link "Blog " "http://www.bluishcoder.co.nz/" }
$nl
{ $url-link "Delicious bookmarks" "http://www.delicious.com/bluishcoder/factor" }
 

{ $heading "Usabe power tools" }
 

{ $code "\"factor-rc\" rc-path  highlight. " }
$nl
{ $code "\"USING: tgkuo \" \"factor-rc\" rc-path ascii set-file-contents " }
{ $link rc-path } 
$nl
{ $code "\"factor-rc\" rc-path  1 edit-location " }
$nl
{ $code "vocab-roots [ \".\" suffix ] change" }
$nl
{ $code "\"vocab:rot13/rot13.factor\" normalize-path " }
{ $link normalize-path }  
{ $vocab "command-line"} 

;

! ------------------------------------------------

ARTICLE: "tkWeb" "Factor Web Frameworks"

{ $description 
    " Web frameworks in Factor "  
} 

{ $heading "My Help documents" }
{ $subsections 
  "furnace"
  "html.templates.chloe" 
} 
 

{ $heading "Web links" }
$nl 
{ $url-link "Factor wiki/Furnace " "http://concatenative.org/wiki/view/Factor/Furnace" }
$nl
{ $url-link "online documentation" "http://docs.factorcode.org/content/article-furnace.html" }
$nl

"-----------------------------------------" 
{ $heading "Bluishcoder blog codes"}
{ $url-link "bluishcoder " "http://www.bluishcoder.co.nz/2008/10/factor-web-framework-example.html" }
$nl
{ $code "USING: 
  furnace.actions 
  http 
  http.server 
  http.server.dispatchers 
  threads 
;
[ 8888 httpd ] in-thread

TUPLE: my-dispatcher < dispatcher ;

my-dispatcher new-dispatcher
  <action> [
    <response>
      200 >>code
      \"text/plain\" >>content-type
      \"Hello World\" >>body
  ] >>display \"hello\" add-responder 
  <action> [
    <response>
      200 >>code
      \"text/plain\" >>content-type
      \"Goodbye World\" >>body
  ] >>display \"goodbye\" add-responder 
main-responder set-global" }
{ $link <action> } 
$nl
{ $code "USING: 
  furnace.actions 
  html.templates.chloe
  http 
  http.server 
  http.server.dispatchers 
  threads 
;
[ 8888 httpd ] in-thread

TUPLE: my-dispatcher < dispatcher ;

my-dispatcher new-dispatcher
  <page-action>
    { my-dispatcher \"main\" } >>template
  \"foo\" add-responder 
  main-responder set-global" }
{ $link <page-action> } 
$nl
{ $code "<?xml version='1.0' ?>
<t:chloe xmlns:t=\"http://factorcode.org/chloe/1.0\">
  <html>
    <body>
      <p>Hello!</p>
    </body>
  </html>
</t:chloe>" }
{ $url-link "Chloe templates" "http://docs.factorcode.org/content/article-html.templates.chloe.html" }
$nl
"-----------------------------------------" 
{ $heading "furnace vocabulary" }
{ $vocab "furnace"} 
   
;


! ABOUT: "Tk-main"


 


