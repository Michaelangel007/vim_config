

"Javascript Operators
"
"@see:
"  :help syn-match
"
"  Learn Vimscript the Hard Way
"  http://learnvimscriptthehardway.stevelosh.com/chapters/46.html


" Comparisons
  syn match jsOp        "\v\=\=\="
" syn match jsOp        "\v\!\=\="
  syn match jsOp        "\v\!\="

  syn match jsOp        "\v\=\="
 "syn match jsOp        "\v\="

  "These are different color to emphase that the logical tests
  "have a higher precendence
  syn match jsCondition "\v\<\="
  syn match jsCondition "\v\>\="


"TODO: < also matches <=
"syn match jsOp        "\v\<"
"syn match jsOp        "\v\>"

" Logical Test
  syn match jsOp        "\v\&\&"
  syn match jsOp        "\v\|\|"

  syn match jsCondition "\v\?"
  syn match jsCondition "\v\:"

" Arithmetic
"TODO: + will also false positive match ++
"TODO: - will also false positive match --
"TODO: / will also false postive match ++
  syn match jsOp        "\v\+"
  syn match jsOp        "\v\-"
  syn match jsOp        "\v\*"
"syn match jsOp        "\v@/"

" Assignment (compound)
  syn match jsCondition        "\v\+\="
  syn match jsCondition        "\v\-\="
  syn match jsCondition        "\v\*\="
  syn match jsCondition        "\v/\="

  "syn match jsBrace     "\v\["
  "syn match jsBrace     "\v\]"

" === Statement ===
  syn match jsStatement "\v\,"
  syn match jsStatement "\v\;"


"If the yellow operators stand out too much
"then customize to the operator for a mild white highlight
"Operator -> White
"Statement -> Yellow
highlight link jsOp             Statement
highlight link jsStatement      Statement

"If you want different colored braces based on indentation
"Rainbow Parenthsis Bundle : Colors Parenthsis 
"http://www.vim.org/scripts/script.php?script_id=1561
highlight link jsBrace          Statement

" Bright Baby/Sky Blue
highlight link jsCondition      PreProc

highlight link javascriptIdentifier Identifier
highlight link javascriptNumber     Number
highlight link javascriptNull       Number
"() 
highlight link javascriptParens Operator
"{} javascritpBraces

