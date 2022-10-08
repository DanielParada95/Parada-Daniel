<!DOCTYPE html>
<html lang="en">
<head>
    <script>
        var a = prompt("Introducir un numero");
        var b = parImpar(a);
        alert("El numero "+a+" es "+ b);
        function parImpar(a) {
        if(a % 2 == 0) {
            return "Par";
        }
        else {
            return "Impar";
        }
        }
        
    </script>
    
</head>
<body>
    
</body>
</html>