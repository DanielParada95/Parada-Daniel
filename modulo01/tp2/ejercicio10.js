<!DOCTYPE html>
<html lang="en">
<head>
    <script>
        let mes;
        mes=prompt('Introduzca el numero del mes:','');
        mes=parseInt(mes);

        if (mes==1 || mes==3 || mes==5 || mes==7 || mes==8 || mes ==10 || mes==12){
        document.write('Este mes tiene 31 dias.');
        }
        else{
            if (mes==4 || mes==6 || mes==9 || mes==11)
            document.write('Este mes tiene 30 dias.');
            else
            document.write('Este mes tiene 28 dias.');
        } 
    </script>
    
</head>
<body>
    
</body>
</html>