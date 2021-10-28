// calcular quantas linhas tem a tabela (=500)

? reccount() 

// calcular o total de vl_tot_aih para permanen < 2 (=24) 

select count (vl_tot_aih) from internac
where permanen < 2

// criar uma tabela com cgc_hosp e razaõ diferentes

select distinct cgc_hosp, razao from internac

// criar uma tabela com cod_opm, nome_opm e qtmax diferentes

select distinct nomeopm, qtmax from internac

calcular quantas linhas possuem sexo = "3" e para estas linhas totalizar val_ato, qtd_ato e val_ato/qtd_ato.

select sum(val_ato), sum(qtd_ato), sum(val_ato/qtd_ato)
from internac where sexo = "3"

// criar uma tabela com proc_real e nome_prod diferentes

select distinct proc_real, nome_prod from internac
