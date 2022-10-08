<!DOCTYPE html>
<html lang="en">
<head>
    <script>
        var valores = [true, false, 2, "mundo" , "hola", 3, "char"];

        var resultado = valores[4] > valores[3];
        if (resultado == true){
            alert(valores[4]);
        }
        else {
            alert(valores[3]);
        }
        

        
        var valor1 = valores[0];
        var valor2 = valores[1];

        var resultado = valor1 || valor2;
        alert(resultado);

        resultado = valor1 && valor2;
        alert(resultado);

        var num1 = valores[2];
        var num2 = valores[5];

        var suma = num1 + num2;
        alert(suma);

        var resta = num1 - num2;
        alert(resta);

        var multiplicacion = num1 * num2;
        alert(multiplicacion);

        var division = num1 / num2;
        alert(division);

        var modulo = num1 % num2;
        alert(modulo);
    </script>
</head>
<body>
    
</body>
</html>