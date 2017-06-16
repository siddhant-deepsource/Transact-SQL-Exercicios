// Dado o diagrama de Bachman
// a) a familia do morador depende dele para sempre
// b) o morador pode deixar de morar no prédio

schema name is condomínio
record type predio
item nump, nomep, rua
record type morador
item num_apto , nomem , bloco
record type familia
item nome, idade, sexo
set type possui
owner morador
insertion  automatic
retention fixed
set selection  by value num_apto 
member familia
insertion automatico
retention optional
set selection by value nump
