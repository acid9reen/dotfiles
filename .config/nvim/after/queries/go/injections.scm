; extends

; select
(raw_string_literal
    (raw_string_literal_content) @injection.content @sql
    (#lua-match? @sql "^%s*[Ss][Ee][Ll][Ee][Cc][Tt]%s*")
    (#set! injection.language "sql"))

; with
(raw_string_literal
    (raw_string_literal_content) @injection.content @sql
    (#lua-match? @sql "^%s*[wW][iI][tT][hH]%s*")
    (#set! injection.language "sql"))

; insert
(raw_string_literal
    (raw_string_literal_content) @injection.content @sql
    (#lua-match? @sql "^%s*[iI][nN][sS][eE][rR][tT]%s*")
    (#set! injection.language "sql"))

; upsert
(raw_string_literal
    (raw_string_literal_content) @injection.content @sql
    (#lua-match? @sql "^%s*[uU][pP][sS][eE][rR][tT]%s*")
    (#set! injection.language "sql"))

; alter
(raw_string_literal
    (raw_string_literal_content) @injection.content @sql
    (#lua-match? @sql "^%s*[aA][lL][tT][eE][rR]%s*")
    (#set! injection.language "sql"))

; delete
(raw_string_literal
    (raw_string_literal_content) @injection.content @sql
    (#lua-match? @sql "^%s*[dD][eE][lL][eE][tT][eE]%s*")
    (#set! injection.language "sql"))

; update
(raw_string_literal
    (raw_string_literal_content) @injection.content @sql
    (#lua-match? @sql "^%s*[uU][pP][dD][aA][tT][eE]%s*")
    (#set! injection.language "sql"))

; explain
(raw_string_literal
    (raw_string_literal_content) @injection.content @sql
    (#lua-match? @sql "^%s*[eE][xX][pP][lL][aA][iI][nN]%s*")
    (#set! injection.language "sql"))

(raw_string_literal
    (raw_string_literal_content) @injection.content @sql
    (#lua-match? @sql "^%s*[cC][rR][eE][aA][tT][eE]%s*")
    (#set! injection.language "sql"))

(raw_string_literal
    (raw_string_literal_content) @injection.content @sql
    (#lua-match? @sql "^%s*[dD][rR][oO][pP]%s*")
    (#set! injection.language "sql"))
