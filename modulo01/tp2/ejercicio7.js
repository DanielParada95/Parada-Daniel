<!DOCTYPE html>
<html lang="en">
<head>
    
</head>
<body>
    <p id="resultado"> </p>
    <script>

        function invertir(a) {
            var b = " ";
            for (var i = a.length - 1; i >= 0; i--) {
                b += a[i];
            }
            return b;
        }

        document.getElementById('resultado').innerHTML = invertir("hola");
    </script>
</body>
</html>