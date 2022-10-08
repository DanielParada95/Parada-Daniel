<!DOCTYPE html>
<html lang="en">
<head>
    <script>
        function mayu(a) {

        var b = "La Cadena \""+a+"\" ";


        if(a == a.toUpperCase()) {
            b += " esta formada solo por mayusculas";
        }
        else if(a == a.toLowerCase()) {
            b += " esta formada solo por minusculas";
        }
        else {
            b += " esta formada por mayusculas y minusculas";
            }

        return b;
        }
        alert(mayu("CUIDADO CON EL PERRO"));
        alert(mayu("... y asi concluye nuestra historia."));
        alert(mayu("Tres Anillos para los Reyes Elfos bajo el cielo. Siete para los Señores Enanos en casas de piedra. Nueve para los Hombres Mortales condenados a morir. en la Tierra de Mordor donde se extienden las Sombras."));   

    </script>
    
</head>
<body>
    
</body>
</html>