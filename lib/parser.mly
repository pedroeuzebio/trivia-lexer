// parser.mly

%token                 EOF
%token <int>           LITINT
%token <Symbol.symbol> ID
%token PLUS 
%token LPAREN 
%token RPAREN
%token  DO
%token  WHILE
%token                 BOOL
%token                 EQUAL
%token                 LE
%token                 LT 
%token                 GT
%token                 GE
%token                 NEQUAL
%token                 COMMA
%token                 MINUS 
%token                 TIMES
%token                 DIV 
%token                  REST 
%token                 EQ
%token                 SEMICOLON
%token                 NOT
%token                 AND
%token                 INT 
%token            IF
%token                 THEN
%token                 ELSE
%token                 LET
%token                 ASSIGN
%token                 IN 
%token                  OR
%token  <bool>       LITBOOL
%left PLUS MINUS        /* lowest precedence */
%left TIMES DIV         /* medium precedence */
%nonassoc UMINUS        /* highest precedence */



%%
