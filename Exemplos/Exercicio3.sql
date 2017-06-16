//  nome          tipo    tamanho    decimal
//  cod_fatura      C         9   
//  cod_vendedor    C         5
//  cpf_cliente     C         11
//  cod_produto     C          4      
//  valor_venda     N         10       2
//  qtde_produtos   N          4


//  1) zerar a coluna qtde_produtos das vendas com valor zero

use faturas
replace all qtde_produtos
with 0 for valor_venda = 0,00


//  2) contar quantos produtos foram vendidos para vendas superiores a 10000,00

use faturas
sum qtde_produtos for valor-venda > 10000,00
use faturas
somaqtd = 0
scan for valor_vend > 10000,00
soma_qtd = soma_qtd + qtd_produtos
enscan
? soma_qtd


// 3) remover as linhas com cpf_cliente e cod_fatura vazios

use faturas
delete all for empty(cpf_cliente)
and empty(cod_fatura)
pack


//  4) alterar as três primeiras posições de cod_fatura pelas três últimas posições de cod_vendedor, 
//     nas linhas com qtde_produtos diferente de 1000

use faturas
replace all cod_faturas
with right(cod_vendedor,3) +   ;
subst(cod_fatura,4,6) for qtde_produtos <> 1000


//  5)  calcular o valor médio dos produtos


use faturas
soma_qt = 0
soma_vl = 0,00
scan
soma_qt = soma_qt + qtde_produtos
soma_vl = soma_vl + valor_venda
endscan
? soma_vl / soma_qt



//  6)  escreva uma função que receba como parametro o cod_fatura e retorne:
//  verdadeiro se o último digito de cod-fatura for par
//  falso se o último digito de cod_fatura for ímpar



function fatpar
parameters codfat
if mod(val(right(codfat,1)),2) = 0
return .T.
else 
return .F.
endif.


//  7)  escrever uma função que receba a data do sistema como parâmetro e retorne a mesma data
//  por extenso no formato (DD/MM/AAAA)

set century on
set date british

//  year() = retorna o ano
//  date() = retorna a data do sistema  como  DD/MM/AAAA
// day() = retorna o dia
//  month()  =  expressão mês da data
//  dtoc(<expd>,[1])
//  exp = variavel de memória
//  [,1]  =  argumento retorna data em formato para indexação


AT (janeiro, dty (upper 01/02/96)  upper  "01/janeiro/1996"

index on dtoc(campo,1)+invitime tag ano




//  8)  como inserir de uma só vez vários registros referente ao mesmo ID dentro do banco de dados
//      com PHP em vez de um a um.

insert into usuarios (nome,idade,sexo)
values ('João', 10, 'masculino'), (Joana, 11, 'feminino'), ('Paula', 10, 'feminino')







