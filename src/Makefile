
aria:
	ocamlyacc parser.mly
	ocamllex lexer.mll
	ocamlopt syntax.ml parser.mli
	ocamlopt -o aria leas.ml syntax.ml parser.ml lexer.ml aria.ml

clean:
	rm *.o *.cmi *.cmx aria parser.ml lexer.ml
