%{
open Syntax
%}

// Literal 
%token <float>  NUM
%token <string> STRING
%token <string> VAR

// Operators
%token PLUS     // '+'
%token MINUS    // '-'
%token ASTERISK // '*'
%token SLASH    // '/'
%token PERCENT  // '%'

// Reserved words
%token ARIA
%token ARS
%token DIRY
%token ENDIA
%token FIE
%token FEL
%token FIRK
%token FIRY
%token HORK
%token HORY
%token LAWARY
%token LE
%token LEE
%token LU
%token NEL
%token NEN
%token ORIA
%token QURELY
%token SA
%token SE
%token SIE
%token SYUA
%token TAS
%token TIRA
%token WEL
%token WIRY

// Control words
%token EOF
%token FULLSTOP
%token COMMA

// Priority of Operators

%left PLUS MINUS
%left ASTERISK SLASH

%start main

%%
dt:
  | ORIA
  | TIRA
  | ARIA

hory:
  | FEL HORY id=VAR TAS dt FULLSTOP       {}
  | FEL LAWARY id=VAR TAS dt FULLSTOP     {}
  | id=VAR HORK TAS dt FULLSTOP           {}
  | FEL HORY id=VAR FULLSTOP              {}
  | FEL LAWARY id=VAR FULLSTOP            {}
  | id=VAR HORK FULLSTOP                  {}

qurely:
  | id=VAR QURELY exp FULLSTOP            {}



exp:
  | 