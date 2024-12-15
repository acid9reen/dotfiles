; extends

;var declaration
(var_declaration
  (var_spec
    name: (identifier) @_name (#any-of? @_name "query" "sql")
    type: (type_identifier)
    value: (expression_list
             (raw_string_literal
               (raw_string_literal_content) @injection.content (#set! injection.language "sql")))))

; short var declaration
(short_var_declaration
  left: (expression_list
          (identifier) @_name (#any-of? @_name "query" "sql"))
  right: (expression_list
           (raw_string_literal
             (raw_string_literal_content) @injection.content (#set! injection.language "sql"))))

; assignment
(assignment_statement
  left: (expression_list
          (identifier) @_name (#any-of? @_name "query" "sql"))
  right: (expression_list
           (raw_string_literal
             (raw_string_literal_content) @injection.content (#set! injection.language "sql"))))
