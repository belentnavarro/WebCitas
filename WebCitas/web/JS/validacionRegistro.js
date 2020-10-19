/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var code = '';
var captchaConseguido = false;

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
        
        /**
         * 
         * if(!captchaConseguido){
         * event.preventDefault();
         * captcha();
         * var captchaError = document.getElementById("errorCaptcha);
         * captchaError.innerHTML = "Captcha erróneo";
         * captchaError.className = 'error active;
         * var txt = document.getElementById("txtInput");
         * txt.value = '';
         * */
    });

    dni.addEventListener('focusout', function (event) {
        if (dni.validity.valid) {
            dniError.innerHTML = '';
            dniError.className = 'error';
        } else {
            errorDni();
        }
    });

    function showErrorDNI() {
        if (dni.validity.valueMissing) {
            dniError.textContent = 'Debe introducir un DNI.';
        } else if (dni.validity.patternMismatch) {
            dniError.textContent = 'El formato del DNI debe ser: 00000000-A.';
        } else if (dni.validity.tooShort) {
            dniError.textContent = 'El DNI debe tener ' + dni.maxLength + ' carácteres.';
        } else if (dni.validity.tooLong) {
            dniError.textContent = 'El DNI debe tener ' + dni.maxLength + ' carácteres.';
        }
        
        dniError.className = 'error active';
    }

    nombre.addEventListener('focusout', function (event) {
        if (nombre.validity.valid) {
            nombreError.innerHTML = '';
            nombreError.className = 'error';
        } else {
            showErrorNombre();
        }
    });

    function showErrorNombre() {
        if (apodo.validity.valueMissing) {
            apodoError.textContent = 'Debe introducir un nombre.';
        } 

        apodoError.className = 'error active';
    }

    email.addEventListener('focusout', function (event) {
        if (email.validity.valid) {
            emailError.innerHTML = '';
            emailError.className = 'error';
        } else {
            showErrorEmail();
        }
    });

    function showErrorEmail() {
        if (email.validity.valueMissing) {
            emailError.textContent = 'Debe introducir una dirección de correo electrónico.';
        } else if (email.validity.typeMismatch) {
            emailError.textContent = 'Debe introducir una dirección de correo electrónico correcta: ejemplo@ejemplo.com.';
        } 

        emailError.className = 'error active';
    }

    password.addEventListener('focusout', function (event) {
        if (password.validity.valid) {
            passwordError.innerHTML = '';
            passwordError.className = 'error';
        } else {
            showPasswordError();
        }
    });

    function showPasswordError() {
        if (password.validity.valueMissing) {
            passwordError.textContent = 'Debe introducir una contraseña.';
        } else if (password.validity.tooShort) {
            passwordError.textContent = 'La contraseña debe tener al menos ' + password.minLength + ' caracteres; ha introducido ' + password.value.length;
        } else if (password.validity.tooLong) {
            passwordError.textContent = 'La contraseña debe tener como máximo ' + password.maxLength + ' caracteres; ha introducido ' + password.value.length;
        }

        contraError.className = 'error active';
    }

    password.addEventListener('focusout', function (event) {
        checkPasswords();
    });

    function checkPasswords() {
        if (password.value != password2.value) {
            password2Error.textContent = 'Las contraseñas que ha introducido no coinciden. Vuelva a introducirlas, por favor.';
            password2Error.className = 'error active';
            correctasPasswd = false;
        } else {
            password2Error.innerHTML = '';
            password2Error.className = 'error';
            correctasPasswd = true;
        }
    }
}


