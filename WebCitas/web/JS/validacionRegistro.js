/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var code = '';
var captchaConseguido = false;
var result = 0;

function validarRegistro(){
    
    const formulario = document.getElementByTagName('form')[0];
    
    const dni = document.getElementById('dni');
    const dniError = document.querySelector('#dni + span.error');

    const nombre = document.getElementById('nombre');
    const nombreError = document.querySelector('#nombre + span.error');

    const email = document.getElementById('email');
    const emailError = document.querySelector('#email + span.error');

    const password = document.getElementById('password');
    const passwordError = document.querySelector('#password + span.error');

    const password2 = document.getElementById('password2');
    const password2Error = document.querySelector('#password2 + span.error');

    const ocupacion = document.getElementById('ocupacion');
    const ocupacionError = document.querySelector('#ocupacion + span.error');
    
    //captcha();
    
    form.addEventListener('submit', function(event){
        if(!dni.validity.valid){
            showErrorDNI();
            event.preventDefault();
        }
        if(!nombre.validity.valid){
            showErrorNombre();
            event.preventDefault();
        }
        if(!email.validity.valid){
            showErrorEmail();
            event.preventDefault();
        }
        if(!password.validity.valid){
            showErrorPassword();
            event.preventDefault();
        }
        if(!password2.validity.valid){
            showErrorPassword();
            event.preventDefault();
        }
        if(!ocupacion.validity.valid){
            showErroOcupacion();
            event.preventDefault();
        }
        
        var correctasPasswd;
        checkPassword();
        
        if(!correctasPasswd){
            event.preventDefault();
        }
        
        if(!captchaConseguido){
            event.preventDefault();
            captcha();
            validCaptcha();
        }
    });

    dni.addEventListener('blur', function (event) {
        if (dni.validity.valid) {
            dniError.innerHTML = '';
            dniError.className = 'error';
        } else {
            errorDni();
        }
    });

    function showErrorDNI() {
        if (dni.validity.valueMissing) {
            dniError.innerHTML = 'Debe introducir un DNI.';
        } else if (dni.validity.patternMismatch) {
            dniError.innerHTML = 'El formato del DNI debe ser: 00000000-A.';
        } else if (dni.validity.tooShort) {
            dniError.innerHTML = 'El DNI debe tener ' + dni.maxLength + ' carácteres.';
        } else if (dni.validity.tooLong) {
            dniError.innerHTML = 'El DNI debe tener ' + dni.maxLength + ' carácteres.';
        }
        
        dniError.className = 'error active';
    }

    nombre.addEventListener('blur', function (event) {
        if (nombre.validity.valid) {
            nombreError.innerHTML = '';
            nombreError.className = 'error';
        } else {
            showErrorNombre();
        }
    });

    function showErrorNombre() {
        if (apodo.validity.valueMissing) {
            apodoError.innerHTML = 'Debe introducir un nombre.';
        } 

        apodoError.className = 'error active';
    }

    email.addEventListener('blur', function (event) {
        if (email.validity.valid) {
            emailError.innerHTML = '';
            emailError.className = 'error';
        } else {
            showErrorEmail();
        }
    });

    function showErrorEmail() {
        if (email.validity.valueMissing) {
            emailError.innerHTML = 'Debe introducir una dirección de correo electrónico.';
        } else if (email.validity.typeMismatch) {
            emailError.innerHTML = 'Debe introducir una dirección de correo electrónico correcta: ejemplo@ejemplo.com.';
        } 

        emailError.className = 'error active';
    }

    password.addEventListener('blur', function (event) {
        if (password.validity.valid) {
            passwordError.innerHTML = '';
            passwordError.className = 'error';
        } else {
            showPasswordError();
        }
    });

    function showPasswordError() {
        if (password.validity.valueMissing) {
            passwordError.innerHTML = 'Debe introducir una contraseña.';
        } else if (password.validity.tooShort) {
            passwordError.innerHTML = 'La contraseña debe tener al menos ' + password.minLength + ' caracteres; ha introducido ' + password.value.length;
        } else if (password.validity.tooLong) {
            passwordError.innerHTML = 'La contraseña debe tener como máximo ' + password.maxLength + ' caracteres; ha introducido ' + password.value.length;
        }

        contraError.className = 'error active';
    }

    password.addEventListener('blur', function (event) {
        checkPasswords();
    });

    function checkPasswords() {
        if (password.value != password2.value) {
            password2Error.innerHTML = 'Las contraseñas que ha introducido no coinciden. Vuelva a introducirlas, por favor.';
            password2Error.className = 'error active';
            correctasPasswd = false;
        } else {
            password2Error.innerHTML = '';
            password2Error.className = 'error';
            correctasPasswd = true;
        }
    }
}

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


