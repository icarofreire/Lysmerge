(defvar pasta1 "D:\\Documentos")
(defvar pasta2 "D:\\Documentos")

;(if (and (probe-file pasta1) (probe-file pasta2))
;(print "ok;")(print "alguma pasta nao existe;"))

(defun concatenar_aste(pasta)(concatenate 'string pasta "/*"))

(defun listar_todos_arquivos_pasta(pasta)
	(if (probe-file pasta)
	(directory (concatenar_aste pasta))(print "pasta nao existe;"))
)

;(print (probe-file pasta1))

;creates the directories if they do not exist:
;(ensure-directories-exist "foo/bar/baz/")


(defvar lis (list 1))

;(print (directory  "D:\\Documentos/*"))
;(print (directory  "D:\\Documentos/*/*/*/*/*/*/*/*/*/*/*"))
;(print (listar_todos_arquivos_pasta pasta2))

(defun nome_completo(arq)
	(namestring arq)
)

(defun add_list(lista atomo)(nconc lista (list atomo)))

(defun se_lista_add(atomo lista)
	(if (equal (member atomo lista) NIL) (add_list lista atomo)() )
)

(defun each(lista)
;(setf elemento (car lista))

(loop for elemento in lista do
           ;(print (nome_completo elemento))
           (se_lista_add (nome_completo elemento) lis)
)

;(se_lista_add (nome_completo elemento) lis)
(print lis)
;(escrever_arq (nome_completo elemento))
;(if (not (equal lista NIL)) (each (cdr lista)) )
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

;(each (directory  "D:\\Documentos/*"))


;(print (member 9 '(1 3 4 5 6 7 8)))
;(print (se_lista_add 9 '(1 3 4 5 6 7 8)))
;(print (equal (member 9 '(1 3 4 5 6 7 8)) NIL))

(defun listar_arqs_str(pasta)
(each (listar_todos_arquivos_pasta pasta))
;(print lis)
)

;(each (directory  "D:\\Documentos/*"))
;(each (directory  "D:\\Documentos/*/*"))

;\/ causando stack overflow por causa da grande lista que é criada;
;(each (directory  "D:\\Documentos/*/*/*"))
;(print (length (directory  "D:\\Documentos/*/*/*")))

;(each (directory  "D:\\Documentos/*/*/*/*"))
;(print  lis)

(defun con_lis(pasta)
;(print pasta)
(each (directory pasta))
(if (not (equal (directory (concatenar_aste pasta)) NIL)) (con_lis (concatenar_aste pasta)) )
)

(con_lis pasta1)
;(print  lis)

;(print (append (list) 2) )

;(setf lis (se_lista_add 4 (list 1)))
;(print (se_lista_add 3 (list 1) ))

;(print (listar_todos_arquivos_pasta pasta1))

;(setf xx (se_lista_add "icaro" (list 1) ))


;(print (add_list xx 17))

; \/ returna lista de n1 ate n2-1;
(defun parte_lista(lista n1 n2) (subseq lista n1 n2) )

(defun div_lista1(lista)  
(setf meio (floor (length lista) 2))
;(setf fim (length lista))
(parte_lista lista 0 meio)
)

(defun div_lista2(lista)  
(setf meio (floor (length lista) 2))
(setf fim (length lista))
(parte_lista lista meio fim)
)

(defun semp_div(lista)
;(if (> (length lista) 50)())
)

(defun split (list count)
           (values (subseq list 0 count) (nthcdr count list)))
           
;(print (parte_lista '(A B C D E F G) 0 3) )
;(print (parte_lista '(A B C D E F G) 2 4) )
;(print (floor (length '(A B C D E F G)) 2) )

;(print (div_lista1 '(A B C D E F G)) )
;(print (div_lista2 '(A B C D E F G)) )

