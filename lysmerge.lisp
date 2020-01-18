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
    (format stream conteudo #\linefeed)
)
)

(defun ini(pasta1 pasta2)
	(con_lis pasta1)
	(con_lis pasta2)
)

(ini pasta1 pasta2)
(print  lis)
;*******************************************************************

