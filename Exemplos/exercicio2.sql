// Fazer um programa para calcular quais linhas da tabela fatura possuem:
// 1) preco_unit = 0
// 2) num_fat = vazio
// 3) as 3 primeiras possuem posições de cgc.fabr="001"
// 4) acrescentar ao preco_unit um percentual informado pelo usuário durante a execução

procedure fatura
if used ('fatura')
selec fatura
else
    selec 0
    use fatura
endif
qtd_prc_0 = 0
scan for preco_prod_0 = 0
qtd_prc_0 = qtd_prc_0 + 1
endscan
whait "A quantidade de linhas com preço zerado = *"=str(qtd_preco_0)
qtd_nf = v2
0
scan for empty(num_fat)
    qtd_nf_v2 = qtd_nf_v2 + 1
endscan
wait "faturas vazias" + str(qtd_nf_v2) windows nowait
qtd.001 = 0
scan for left(cgc_fabr.3) = "001"
    qtd_001 = qtd.001 + 1
endscan
wait "cgc.001" + str(qtd_0001)
prc = 00.00
@2,2 say "informe o percentual: ", get perc
read
replace all preco_unit with preco_unit * (1(prc(100)))
use
return



