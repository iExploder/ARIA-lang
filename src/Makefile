
aria:
	ocamlyacc parser.mly
	ocamllex lexer.mll
	ocamlopt -o aria leas.ml syntax.ml parser.mli parser.ml lexer.ml aria.ml

clean:
	rm *.o *.cmi *.cmx aria parser.ml lexer.ml
