{
open Parser  (* módulo gerado pelo Menhir *)
exception Lexing_error of string
}

rule tokenize = parse
  | [' ' '\t' '\r' '\n'] { tokenize lexbuf }  
  | ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']* as lxm { ID lxm }
  | ['0'-'9']+ as lxm    { INT (int_of_string lxm) }
  | "true"               { TRUE }
  | "false"              { FALSE }
  | "if"                 { IF }
  | "then"               { THEN }
  | "else"               { ELSE }
  | "{"                  { LBRACE }
  | "}"                  { RBRACE }
  | "while"              { WHILE }
  | "do"                 { DO }
  | "let"                { LET }
  | "in"                 { IN }
  | "int"                { INT_TYPE }   (* para tipo int *)
  | "bool"               { BOOL_TYPE }  (* para tipo bool *)
  | "unit"               { UNIT_TYPE }  (* para tipo unit *)
  | "ref"               { REF_TYPE }  (* para tipo ref *)
  | '+'                  { PLUS }
  | '-'                  { MINUS }
  | '*'                  { TIMES }
  | '/'                  { DIV }
  | "&&"                 { AND }
  | "||"                 { OR }
  | "="                  { EQ }
  | "<"                  { LT }
  | ">"                  { GT }
  | "!"                  { EXCL }
  | '('                  { LPAREN }
  | ')'                  { RPAREN }
  | ':'                  { COLON }
  | ';'                  { SEMICOLON }
  | "new"                { NEW }
  | eof                  { EOF }
  | _ as c               { raise (Lexing_error (Printf.sprintf "Unexpected character: %c" c)) }