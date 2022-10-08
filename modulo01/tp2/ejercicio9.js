<!DOCTYPE html>
<html lang="en">
<head>
    <script>
    function prome(){
    var nota1;
    var nota2;
    var nota3;
    
	nota1 = parseFloat(promtp("Primera nota"));
	nota2 = parseFloat(promtp("Segunda nota"));
    nota3 = parseFloat(promtp("Tercera nota"));
	
    var promedio = (nota1+nota2+nota3)/3;

	if(promedio > 8){
		document.write("El promedio es "+promedio+", Sobresaliente");
    }
    else if(promedio >=6){
        document.write("El promedio es "+promedio+", Aprobado");
    }
	else{
		document.write("El promedio es "+promedio+", Reprovado");
	}
}
    </script>
    
</head>
<body>
    
</body>
</html>