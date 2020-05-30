(defvar pasta1 "D:\\Documentos")
(defvar pasta2 "D:\\Imagens")


(defun concatenar_aste(pasta)(concatenate 'string pasta "/*"))

(defun listar_todos_arquivos_pasta(pasta)
	(if (probe-file pasta)
	(directory (concatenar_aste pasta))(print "pasta nao existe;"))
)

(defvar lis (list 1))

(defun nome_completo(arq)
	(namestring arq)
)

(defun add_list(lista atomo)(nconc lista (list atomo)))

(defun se_lista_add(atomo lista)
	(if (equal (member atomo lista) NIL) (add_list lista atomo)() )
)

(defun each(lista)
	(loop for elemento in lista do
		(se_lista_add (nome_completo elemento) lis)
	)
	;(print lis)
)

(defun con_lis(pasta)
	(each (directory pasta))
	(if (not (equal (directory (concatenar_aste pasta)) NIL)) (con_lis (concatenar_aste pasta)) )
)

(defun escrever_arq(conteudo)
;Passing the value :supersede tells OPEN to replace the existing file.
;Passing :append causes OPEN to open the existing file such that new data will be written at the end of the file
(with-open-file (stream (merge-pathnames #p"D:\\Documentos\\Lysmerge\\lysmerge-data.txt"
                                         (user-homedir-pathname))
                        :direction :output    ;; Write to disk
                        :if-exists :append ;; Overwrite the file
                        :if-does-not-exist :create)
  
    ;; Write random numbers to the file
    ;(format stream conteudo #\Linefeed)
    (write-line conteudo stream)
)
)

(defun ini(pasta1 pasta2)
	(con_lis pasta1)
	(con_lis pasta2)
)

;(ini pasta1 pasta2)
;(print  lis)
;*******************************************************************

(defun is_list(x)(listp x))

; \/ escrever os elementos de uma lista separadamente por linha no arquivo;
(defun esc_lista(lista)
	(if (equal (is_list lista) T)
		(loop for elemento in lista do
			(escrever_arq (if (atom elemento) (write-to-string elemento)))
		)
	)
)

;(escrever_arq "1 2 3 4 5")
;(print (is_list (list "fr" "teste")))
;(print "icaro")
(esc_lista '(1 2 3 4 5 6 7))
;(print (list 1 2 3 4 5 6 7))

;(print (write-to-string 8))
;(print (parse-integer (write-to-string 8)))



