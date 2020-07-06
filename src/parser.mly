// parser.mly
// (C) 2020 iExploder
// This code is licensed under MIT license (see LICENSE for details)

%{
open Syntax
open Leas
%}
// Literal 
%token <float>  ORIA
%token <string> ARIA
%token <string> MAR
%token <string> MARENDY

// Operators
%token PLUS     // '+'
%token MINUS    // '-'
%token ASTERISK // '*'
%token SLASH    // '/'
%token PERCENT  // '%'
%token ANDMARK  // '&'
%token GREATER  // '>'
%token GREQUAL  // '>='
%token LESS     // '<'
%token LEEQUAL  // '<='
%token EQUAL    // '='
%token QMARK    // '?'

// Reserved words
%token SELD
%token NELSELD
%token FEL
%token FIE
%token HORY
%token HORK
%token ARS
%token WEL
%token FIRY
%token SASE
%token FIRK
%token LU
%token YUERY
%token WORY
%token ENDY
%token MIO
%token SIE
%token ENDK
%token QURELY
%token SYUA
%token NEL
%token NEN
%token WIRY
%token ENDIA
%token SAR
%token ARY
%token LO
%token SA
%token SE
%token SO
%token DIRY
%token LE
%token LEE
%token RARY

// Control words
%token EOF
%token FULLSTOP
%token COMMA

// Priority of Operators

%left PLUS MINUS
%left ASTERISK SLASH

%start main
%type <Syntax.walre> main

%%
iry1:
  | YUERY                         { Yuery }
  | WORY                          { Wory }
  | MINUS                         { Minus }
  | NEL                           { Nel }
  | NEN                           { Nel }

iry2:
  | PLUS                          { Add }
  | MINUS                         { Sub } 
  | ASTERISK                      { Mul }   
  | SLASH                         { Div }
  | PERCENT                       { Mod }
  | GREATER                       { Gr } 
  | GREQUAL                       { GrEq }
  | LESS                          { Le }
  | LEEQUAL                       { LeEq }
  | EQUAL                         { Eq }
  | ANDMARK                       { Con }
  | SA                            { And }
  | SE                            { And }
  | SO                            { Or }

param_s:
  | MAR SIE tind                  { [($1, $3)] }
paramlist:
  | param_s COMMA param_s         { $1 @ $3 }
  | param_s                       { $1 }

tind:
  | ORIA                          { Oria $1 }
  | ARIA                          { Aria $1 }
  | SELD                          { Tira seld }
  | NELSELD                       { Tira nelseld }
  | tind iry2 tind                { Iry2 ($2, ($1, $3)) }
  | iry1 tind                     { Iry1 ($1, $2) }
  | MARENDY ENDK MIO paramlist    { WiryEndy($1, $4) }
  | MARENDY ENDK                  { WiryEndy($1, []) }
  | MAR                           { Nelweld $1 }


walre:
  | hory        { $1 }
  | horyendy    { $1 }
  | qurely      { $1 }
  | rarysyua    { $1 }
  | endiawhile  { $1 }
  | diry        { $1 }
  | welfirk     { $1 }
  | ary         { $1 }
  
  | walre walre { Walred([$1; $2]) }

hory:
  | FEL HORY MAR COMMA FIE tind FULLSTOP   
    { Hory($3, $6) }
  | MAR HORK COMMA FIE tind FULLSTOP
    { Hory($1, $5) }

endy_param:
  | MAR                           { [$1] }
  | endy_param SA endy_param      { $1 @ $3 }
  | endy_param SE endy_param      { $1 @ $3 }

horyendy:
  | FEL ARS LO MARENDY COMMA WEL FIRY endy_param FULLSTOP walre LU FULLSTOP
    { HoryEndy($4, $8, $10) }
  | FEL ARS LO MARENDY FULLSTOP walre LU FULLSTOP
    { HoryEndy($4, [], $6) }


qurely:
  | MAR QURELY tind FULLSTOP      
    { Qurely($1, $3) }

endiawhile:
  | FEL WIRY ENDIA SAR tind FULLSTOP walre ENDIA LU FULLSTOP
    { EndiaWhile($5, $7) }

diry:
  | DIRY FULLSTOP
    { Diry }

welfirk:
  | WEL FIRK tind FULLSTOP
    { WelFirk($3) }

rarysyua:
  | tind RARY QMARK SYUA walre NEL SYUA walre
    { RarySyua($1, $5, $8) }
  | tind RARY QMARK SYUA walre
    { RarySyua($1, $5, Walred([])) }

ary:
  | FEL ARY tind FULLSTOP  { Ary($3) }
  | LE ARY tind FULLSTOP   { Ary($3) }
  | LEE ARY tind FULLSTOP  { print_string warn_lee; Ary($3) }

main:
  | walre            { $1 }