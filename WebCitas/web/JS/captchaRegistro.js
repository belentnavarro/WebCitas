/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var code;
var captchaConseguido = false;
var result = 0;

function captcha(){
    var operation = new Array('+', '-', '*');
    var numbers = new Array(1, 2, 3, 4, 5, 6, 7, 8, 9);
    for (var i = 0; i < 5; i++) {
        var num1 = numbers[Math.floor(Math.random() * numbers.length)];
        var num2 = numbers[Math.floor(Math.random() * numbers.length)];
        var op = operation[Math.floor(Math.random() * operation.length)];
    }
    
    if(num1 < num2){
        code = num2 + ' ' + op + ' ' + num1;
    } else {
        code = num1 + ' ' + op + ' ' + num2;
    }
    
    switch(op){
        case '+':
            result = num1 + num2;
        break;
        case '-':
            if(num1 < num2){
                result = num2 - num1;
            } else {
                result = num1 - num2;
            }
        break;
        case '*':
            result = num1 * num2;
        break;
    }
    
    creaIMG(code);
}

function validCaptcha(txtInput){
    resultCaptcha = removeSpaces(document.getElementById(txtInput).value);
    captchaError = document.getElementById("errorCaptcha");
    
        if(result == resultCaptcha){
            captchaConseguido = true;
            captchaError.innerHTML = "Captcha correcto";
            captchaError.className = "error";
        } else {
            captchaError.innerHTML = "Captcha incorrecto";
            captchaError.className = "error active";
            captcha();
            captchaConseguido = false;
        }
    }
    
function removeSpaces(string){
    return string.split(' ').join(' ');
}

function creaIMG(texto) {
    var ctxCanvas = document.getElementById('captcha').getContext('2d');
    var fontSize = "30px";
    var fontFamily = "Arial";
    var width = 250;
    var height = 50;
    //tamaño
    ctxCanvas.canvas.width = width;
    ctxCanvas.canvas.height = height;
    //color de fondo
    ctxCanvas.fillStyle = "whitesmoke";
    ctxCanvas.fillRect(0, 0, width, height);
    //puntos de distorsión
    ctxCanvas.setLineDash([7, 10]);
    ctxCanvas.lineDashOffset = 5;
    ctxCanvas.beginPath();
    var line;
    for (var i = 0; i < (width); i++) {
        line = i * 5;
        ctxCanvas.moveTo(line, 0);
        ctxCanvas.lineTo(0, line);
    }
    ctxCanvas.stroke();
    //formato texto
    ctxCanvas.direction = 'ltr';
    ctxCanvas.font = fontSize + " " + fontFamily;
    //texto posicion
    var x = (width / 9);
    var y = (height / 3) * 2;
    //color del borde del texto
    ctxCanvas.strokeStyle = "yellow";
    ctxCanvas.strokeText(texto, x, y);
    //color del texto
    ctxCanvas.fillStyle = "red";
    ctxCanvas.fillText(texto, x, y);
}