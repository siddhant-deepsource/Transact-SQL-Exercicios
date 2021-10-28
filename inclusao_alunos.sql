// Determine a inclusão dos alunos da turma_C na turma_A, formando uma nova turma_A

Turma_A union Turma_C giving Nova_Turma_A

selec Nova_turma_A where tel >= 80000000 giving celular

selec Nova_Turma_A where data-nasc > '01/01/72' .and. <= "31/12/1973" giving datas

project datas over nome giving nome

join empregado and departamento
coddepto giving tabela-nova

// nome dos empregados que trabalham no setor

join depto and empreg over giving tabela2

select tabela2 where cod = d1

project tabela3 over enome giving tabela4

//  nome dos dependentes do empregado

join empreg and dependente over mat giving tabela5

selec tabela5 over nome giving tabela6


