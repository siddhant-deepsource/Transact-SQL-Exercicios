// Exemplo de DDL (Linguagem de Definição de Dados)

schema name is colegio
record type alunos
item (matr, nomea)
record type materias
item (coda, nomem)
set type estuda
counter alunos
member materias
insertion automatic
retentiom optional
set selection by value matr

