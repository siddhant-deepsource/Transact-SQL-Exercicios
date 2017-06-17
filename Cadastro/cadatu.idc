//   cadatu.idc

Datasorce: SRV-LAB1
Username: CADASTRO
Password: CADASTRO
Template: Result.htx

SQLStatement:
+ UPDATE cadastro.cadastro
+ SET nome = '%updnome%' ,
+ estado = '%updestado%' ,
+ codigo = %updcodigo% ,
+ WHERE
+ numero = %updnumero%
  
