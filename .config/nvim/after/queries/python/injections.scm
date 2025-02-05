; extends

; select
(string
    (string_content) @injection.content @sql
    (#lua-match? @sql "^%s*[Ss][Ee][Ll][Ee][Cc][Tt]%s*")
    (#set! injection.language "sql"))

; with
(string
    (string_content) @injection.content @sql
    (#lua-match? @sql "^%s*[wW][iI][tT][hH]%s*")
    (#set! injection.language "sql"))

; insert
(string
    (string_content) @injection.content @sql
    (#lua-match? @sql "^%s*[iI][nN][sS][eE][rR][tT]%s*")
    (#set! injection.language "sql"))

; upsert
(string
    (string_content) @injection.content @sql
    (#lua-match? @sql "^%s*[uU][pP][sS][eE][rR][tT]%s*")
    (#set! injection.language "sql"))

; alter
(string
    (string_content) @injection.content @sql
    (#lua-match? @sql "^%s*[aA][lL][tT][eE][rR]%s*")
    (#set! injection.language "sql"))

; delete
(string
    (string_content) @injection.content @sql
    (#lua-match? @sql "^%s*[dD][eE][lL][eE][tT][eE]%s*")
    (#set! injection.language "sql"))

; update
(string
    (string_content) @injection.content @sql
    (#lua-match? @sql "^%s*[uU][pP][dD][aA][tT][eE]%s*")
    (#set! injection.language "sql"))

; explain
(string
    (string_content) @injection.content @sql
    (#lua-match? @sql "^%s*[eE][xX][pP][lL][aA][iI][nN]%s*")
    (#set! injection.language "sql"))
