<!DOCTYPE html>
<html lang="en">
<head>
    <script>
        var a = ["a", "e", "i", "o", "u"];
        var b = prompt("Introduce un texto");
            
        var c = b.toLowerCase();
            
        var r = 0;
        
        var d = false;
        
        for (var i = 0; i < c.length; i++) {
                
            for (var j = 0; j < a.length; j++) {
                    
                if (a[j] == c.charAt(i)) {
                        
                    r = i;
                        
                    d = true;
                        
                    break;
                }
            }
            if (d) {        
                    break;
            }
            }
            alert("La ubicacion de la primera vocal es:  " + r);
    </script>
    
</head>
<body>
    
</body>
</html>