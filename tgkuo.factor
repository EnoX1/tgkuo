USING: io kernel sequences namespaces quotations accessors assocs  memory 
vocabs.loader vocabs.refresh
calendar formatting formatting.private
ui ui.gadgets ui.gadgets.buttons ui.gadgets.packs ui.gadgets.borders
ui.gadgets.scrollers ui.gadgets.panes ui.tools.listener 
help.markup help.vocabs  help.stylesheet urls present help.markup.private
;
IN: tgkuo
 

: shot ( -- ) refresh-all save ; 

: tkTest ( -- ) "demos" [ drop [ "demos" run ] \ run call-listener ] <border-button> gadget.
;

: tkTest1 ( -- ) "shot" [ drop [ shot "Done" print ] \ run call-listener ] <roll-button> gadget.
;

IN: help.markup 

: ($run) ( quot --  )
    [ write ] compose call  ; inline

: $date (  element --  )
    drop [ now [ >date ] [ >time ] bi "  " swap 3append ] [ write ] compose call nl ;  


: ($url-link) ( str url --  ) [ write-link ] ($span) ;

: $url-link ( element -- ) first2 >url ($url-link) ; 

! ----------------------------------------------

USING: accessors assocs colors io io.encodings.utf8 io.files
io.styles kernel literals locals math math.parser sequences
xmode.catalog xmode.marker ;

IN: colors.hex

CONSTANT: STYLES H{
    { "NULL"     H{ { foreground HEXCOLOR: 000000 } } }
    { "COMMENT1" H{ { foreground HEXCOLOR: cc0000 } } }
    { "COMMENT2" H{ { foreground HEXCOLOR: ff8400 } } }
    { "COMMENT3" H{ { foreground HEXCOLOR: 6600cc } } }
    { "COMMENT4" H{ { foreground HEXCOLOR: cc6600 } } }
    { "DIGIT"    H{ { foreground HEXCOLOR: ff0000 } } }
    { "FUNCTION" H{ { foreground HEXCOLOR: 9966ff } } }
    { "INVALID"  H{ { background HEXCOLOR: ffffcc }
                    { foreground HEXCOLOR: ff0066 } } }
    { "KEYWORD1" H{ { foreground HEXCOLOR: 006699 }
                    { font-style bold } } }
    { "KEYWORD2" H{ { foreground HEXCOLOR: 009966 }
                    { font-style bold } } }
    { "KEYWORD3" H{ { foreground HEXCOLOR: 0099ff }
                    { font-style bold } } }
    { "KEYWORD4" H{ { foreground HEXCOLOR: 66ccff }
                    { font-style bold } } }
    { "LABEL"    H{ { foreground HEXCOLOR: 02b902 } } }
    { "LITERAL1" H{ { foreground HEXCOLOR: ff00cc } } }
    { "LITERAL2" H{ { foreground HEXCOLOR: cc00cc } } }    
    { "LITERAL3" H{ { foreground HEXCOLOR: 9900cc } } }
    { "LITERAL4" H{ { foreground HEXCOLOR: 6600cc } } }
    { "MARKUP"   H{ { foreground HEXCOLOR: 0000ff } } }  
    { "OPERATOR" H{ { foreground HEXCOLOR: 000000 }
                    { font-style bold } } }
    }
    

: highlight-tokens ( tokens -- )
    [
        [ str>> ] [ id>> ] bi
        [ name>> STYLES at ] [ f ] if* format
    ] each nl ;

: highlight-lines ( lines mode -- )
    [ f ] 2dip load-mode [
        tokenize-line highlight-tokens
    ] curry each drop ;

:: highlight. ( path -- )
    path utf8 file-lines [
        path over first find-mode highlight-lines
    ] unless-empty ;



