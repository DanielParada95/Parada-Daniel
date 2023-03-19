const fs = require("fs");
let rawdata = fs.readFileSync("../TP-07/pesonas.json");
let persona = JSON.parse(rawdata);
console.log(rawdata);

console.log(JSON.parse(rawdata));
