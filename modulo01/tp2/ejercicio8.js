<!DOCTYPE html>
<html lang="en">
<head>
    <script>
        function aleatorio(min,max){
            var numero = Math.round((Math.random() * (max-min)) + min);
            return numero;
        }
        var numeros = new Array();
        var temp = 0;
        var copia = true;
        var j = 0;

        for(var i=0; i<100; i++){
            do{
                j = 0;
                copia = true;
                temp = aleatorio(1,100);
                for(var j=0; j < numeros.length; j++){
                    if(temp == numeros[j]){
                        copia = false; 
                    }
                }
            }
            while(copia == false);
            numeros[i] = temp;
            }
            
            var cont = 0;
            for(var i=0; i < numeros.length; i++){
            document.write("Numero Aleatorio " + cont + ": " + numeros[i] + "<br>");
            cont++;
        }
    </script>
    
</head>
<body>
    
</body>
</html>