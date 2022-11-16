{
  module L = Lexing

  type token = [%import: Parser.token] [@@deriving show]

  let illegal_character loc char =
    Error.error loc "illegal character '%c'" char
}

let spaces = [' ' '\t']+
let digit = ['0'-'9']
let comment = '#' [^ '\n']*
let integer = digit+
let letter = ['a'-'z' 'A'-'Z']
let underline = '_'
let identifiers = letter (letter | digit | underline)*
let litbool = "true" | "false"
rule token = parse
  | spaces            { token lexbuf }
  | '\n'              { L.new_line lexbuf; token lexbuf }
  | integer as lxm    { LITINT (int_of_string lxm) }
  | "("               { LPAREN }
  | ")"               { RPAREN }
    | comment    { token lexbuf }
  | "and"              {AND}
  | "or"              {OR}     
  | "*"               {TIMES}
  | "/"               {DIV}
  | "%"               {REST}
  | "+"               {PLUS}
  | "-"               {MINUS}
  | "!"               {NOT}
  | "="               {EQ}
  | "<"               {LT}
  | ">"               {GT}
  | "<="              {LE}
  | ">="              {GE}
  | "=="              {EQUAL}
  | "<>"               {NEQUAL}
  | ":="              {ASSIGN}
  | ","              {COMMA}
  | ";"               {SEMICOLON}
  | "if"              {IF}

  |litbool as lxm  {LITBOOL (bool_of_string lxm) }
  | "then"            {THEN}
  | "else"            {ELSE}
  | "let"             {LET}
  | "while"           {WHILE}
  | "do"               {DO}
  | "in"              {IN}
  | identifiers as lxm {ID (Symbol.symbol lxm)}
  | eof               {EOF}
  | _                 { illegal_character (Location.curr_loc lexbuf) (L.lexeme_char lexbuf 0) }
