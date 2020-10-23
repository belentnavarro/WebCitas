/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validarLogin(){
    const form = document.getElementById("login");
    const email = document.getElementById("email");
    const emailError = document.querySelector('#email + span.error');
    const passwd = document.getElementById("passwd");
    const passwdError = document.getElementById('#passwd + span.error');
    
    form.addEventListener('submit', function(event){
       if(!email.validity.valid){
           showErrorEmail();
           event.preventDefault();
       } 
       if(!passwd.validity.valid){
           showErrorPasswd();
           event.preventDefault();
       }
    });
    
    email.addEventListener('blur', function(event){
       if(email.validity.valid){
           emailError.innerHTML = '';
           emailError.className = 'error';
       } else {
           showErrorEmail();
       }
    });
    
    passwd.addEventListener('blur', function(event){
        if(passwd.validity.valid){
            passwdError.innerHTML = '';
            passwdError.className ='error';
        } else {
            showErrorPasswd();
        }
    });
    
    function showErrorEmail(){
        if(email.validity.valueMissing){
            emailError.innerHTML = 'Campo vacío, debe introducir una dirección de correo electrónico.';
        } else if (email.validity.typeMismatch){
            emailError.txtContent = 'El valor introducido debe ser una dirección de correo electrónico: ejemplo@ejemplo.com.';
        }
        
        emailError.className = 'error active';
    }
    
    function showErrorPasswd(){
        if(passwd.validity.valueMissing){
            passwdError.innerHTML = 'Campo vacío, debe introducir la contraseña.';
        }
        
        passwdError.className = 'error active';
    }
}
