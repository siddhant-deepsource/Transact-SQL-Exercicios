// criar uma função para calcular o digito verificador

function dvmod11
parameters parmval
if parameters() = 1
   if type (parmval) <> 'C'
   wait "tipo do parametro incorreto";
   windowsw nowait
   return .F.
   endif
else
    wait "parametro não foi passado";
    windows nowait
    return .F.
enddif

tamparm = len(pamval)
tab_calc = replicate('23456789',2)
if tamparm > 16
   wait 'tam.max. do parametro = 16';
   windows nowait
   return .F.
endif
tab-calc = right(tabcalc, tabpar-1)
soma=0
for n = tampar -1 to 1 step -1
    soma = soma + (val(substr(tabcalc, n, 1) *;
    val(substr(parmval, n, 1)))
endfor
resto = mod(soma, 11)  // soma = dividendo e 11 = divisor
dv = 11 - resto
if dv = 10 or dv = 11
    dv=0
endif
if val(substr(parmval, tamparm,1))) = dv
return .T.
else
   wait " 'dv' incorreto" windows nowait
   return .F.
   endif.
