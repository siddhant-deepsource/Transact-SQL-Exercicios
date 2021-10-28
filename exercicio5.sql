
//  clientes = nome_cli , cod_cli end_cli , cpf_cli
//  locacao =  cod_cli , cod_prod , dt_ini , dt_fim , custo_loc , qt_und_loc
//  produto =  cod_prod , nome_prod , prc_loc_prod , unid_loc_prod


//  1) calcular quantas linhas existem na tabela cliente :

select count(*) from cliente


//  2)  calcular quantos clientes possuem o cod_cli = "0123" :

select count(cod_cli) from clientes where cod_cli = "0123"


//  3)  calcular quantos clientes possuem cod_cli maior que '1000' e cpf_cli < '00001111111'  :

select count(*) from clientes where cod_cli > '1000' and cpf_cli < '00001111111'


//  4) calcular quantos produtos possuem preços entre 1000,00 e 2000,00 :

select count(*) from produto where prc_loc_prod >= 1000,00 and prc_loc_prod <= 2000,00

//  or

select count(*) from produto where prc_loc_prod between 1000,00 and 2000,00

//  or

select count(*) from produto where prc_loc_prod between (prc_loc_prod, 1000,00 , 2000,00)


//  5) calcular qual o total gasto em locação do produto de código = "00023" :

select sum(custo_loc) from locacao where cod_prc_loc = "00023"


//  6) calcular quais os carros com preço de locação igual a '100,00' , '200,00' , '500,00' ,
       ´700,00' , '900,00' ou '2000,00' :
       
select * from produto where nome_prod = "carro" and prc_loc_prod = IN(100.00 , 200.00 , 500.00 , 700.00 , 900.00 , 2000,00)



//  7) calcular quantos produtos estão em promoção - ('001' , '003' , '014' , '123' , '012' , '021') :


select count(*) from produto where cod_prod in ('001' , '003' , '014' , '123' , '012' , '021')

or

select count(*) from produto where cod_prod not in select cod_pro from promocao


//  8) calcular e listar os produtos em promoção :

select cod_pro from promoção


//  9) calcular q ual é o total gasto em locação de fitas :

select sum(custo_loc) from locacao 
where cod_prod_loc in (select cod_pro from produto where nome_prod = "fita")

//  10) calcular quantas locações foram feitas com promoção :

select count(*) from locacao 
where cod_prod_loc in (select cod_prod_pro rom promocao)
where locacao.dt_ini_loc between dt_ini_prod and dt_fim_pro)


//  11) calcular e alterar a estrutura da tabela interna retirando
//   as colunas nome_opm , qtmax , razao , nome_prod :

select count(*) from internac 
where cgc_hosp in (select cgc_hosp from tab_hosp)

or

select count (distinct cgc_hosp) from internac 
where cgc_hosp in (select cgc_hosp from tab_hosp)

