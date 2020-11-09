function alertaRoja() {
    alert("¡ALERTA ROJA!");
}
function Redirect(site) {
    window.location.href = site;
}
function noticia(site) {
    site = 0;
    window.location.href = "noticia.php";
}
function like(x) {
    x.classList.toggle("bi-suit-heart-fill");
    var count = document.getElementById("likeCounter").innerHTML;
    document.getElementById("input").innerHTML = count + 1;
}


function validacionRegistrarse() {

    email = document.getElementById("emailRegistrarse").value;
    if (!(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(email))) {
        alert("correo invalido");
        return false;
    }

    usuario = document.getElementById("usuarioRegistrarse").value;
    if (usuario == null || usuario.length < 3 || /^\s+$/.test(usuario)) {
        alert("agrege un usuario");
        return false;
    }


    pass = document.getElementById("contraseñaRegistrarse").value;
    if (pass == null || pass.length < 8 || /^[a-zA-Z0-9]+$/.test(pass)) {
        alert("agrege una contraseña valida");
        return false;
    }

    pass2 = document.getElementById("contraseñaConfirmarRegistrarse").value;
    if (pass2 != pass) {
        alert("confirme correctamente su contraseña");
        return false;
    }

    alert("Usted esta registrado");

}

function validacionInicioSesion() {

    email = document.getElementById("emailIniciarSesion").value;
    if (!(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(email))) {
        alert("correo no registrado");
        return false;
    }

    usuario = document.getElementById("usuarioIniciarSesion").value;
    if (usuario == null || usuario.length < 3 || /^\s+$/.test(usuario)) {
        alert("usuario incorrecto");
        return false;
    }

    pass = document.getElementById("contraseñaIniciarSesion").value;
    if (pass == null || pass.length < 8 || /^[a-zA-Z0-9]+$/.test(pass)) {
        alert("contraseña incorrecta");
        return false;
    }

    alert("Inicio de sesion exitoso");

}

function validacionConfig() {
    
    usuario = document.getElementById("UsuarioConfig").value;
    if (usuario == null || usuario.length == 0 || /^\s+$/.test(usuario)) {
        alert("usuario no valido");
        return false;
    }    
    
    email = document.getElementById("mailCofig").value;
    if (!(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(email))) {
        alert("correo no valido");
        return false;
    }

    pass = document.getElementById("contraConfig").value;
    if (pass == null || pass.length < 8 || /^[a-zA-Z0-9]+$/.test(pass)) {
        alert("contraseña no valida");
        return false;
    }
    
    pass2 = document.getElementById("confirmarContraConfig").value;
    if (pass2 != pass) {
        alert("confirme correctamente su contraseña");
        return false;
    }
    
    nombreConfig = document.getElementById("nombreConfig").value;
    if (nombreConfig == null || nombreConfig.length == 0 || nombreConfig == " " ||/^\s+$/.test(nombreConfig)) {

    }
    else {
        if (!(/^[A-Z]+$/i.test(nombreConfig))) {
            alert("El nombre solo acepta letras");
            return false;
        }
    }

    apellidoPaConfig = document.getElementById("apellidoPaConfig").value;
    if (apellidoPaConfig == null || apellidoPaConfig.length == 0 || apellidoPaConfig == " " ||/^\s+$/.test(apellidoPaConfig)) {
            
    }
    else {
        if (!(/^[A-Z]+$/i.test(apellidoPaConfig))) {
            alert("El apellido paterno solo acepta letras");
            return false;
        }
    }
    
    apellidoMaConfig = document.getElementById("apellidoMaConfig").value;
    if (apellidoMaConfig == null || apellidoMaConfig.length == 0 || apellidoMaConfig == " " ||/^\s+$/.test(apellidoMaConfig)) {

    }
    else {
        if (!(/^[A-Z]+$/i.test(apellidoMaConfig))) {
            alert("El apellido materno solo acepta letras");
            return false;
        }
    }
    
    TelefonoConfig = document.getElementById("TelefonoConfig").value;
    if (!(/^\d{10}$/.test(TelefonoConfig))) {
        alert("numero de telefono no valido");
        return false;
    }
    
    CpConfig = document.getElementById("CpConfig").value;
    if (CpConfig == null || CpConfig.length == 0 || CpConfig.length > 5 || CpConfig == " " ||/^\s+$/.test(CpConfig)) {

    }
    else  {
        if(!(/^[1-9]+$/i.test(apellidoMaConfig))){
            alert("codigo postal no valido");
            return false;  
        }

    } 

    alert("los datos se an actualizado");

}

function BajaUsuariro(){
    var ask = window.confirm("Seguro que quiere dar de baja su cuenta?");
    if (ask) {
        window.alert("Su cuenta a sido dada de baja.");

        window.location.href = "index.html";

    }
}
function ventanaNueva(documento){	
	window.open(documento,'nuevaVentana','width=500, height=600');
}

function CrearLista() {
    nombreLista = document.getElementById("nombreLista").value;
    if (nombreLista == null || nombreLista.length == 0 || nombreLista == " " || /^\s+$/.test(nombreLista)) {
        alert("escriba una nombre para la lista");
        return false;
    }

    alert("Lista creada exitosamente");
    window.close();
}
    
function BajaLista() {
    var ask = window.confirm("Seguro que quiere dar de baja esta lista?");
    if (ask) {
        window.alert("La lista a sido dada de baja.");

        window.close();

    }
}

function validaCompra() {
    
    
    nombreCompra = document.getElementById("nombreCompra").value;
    if (nombreCompra == null || nombreCompra.length == 0 || nombreCompra == " " ||/[^a-z A-Z]+$/.test(nombreCompra)) {
        alert("El nombre solo acepta letras");
        return false;
    }

    
    TelefonoCompra = document.getElementById("TelefonoCompra").value;
    if (!(/^\d{10}$/.test(TelefonoCompra))) {
        alert("numero de telefono no valido");
        return false;
    }
    
    DomicilioCompra = document.getElementById("DomicilioCompra").value;
    if (DomicilioCompra == null || DomicilioCompra.length == 0 || DomicilioCompra == " " ) {
        alert("Domicilio no valido");
        return false;
    }

    CpCompra = document.getElementById("CpCompra").value;
    if (CpCompra == null || CpCompra.length == 0 || CpCompra.length != 5 || CpCompra == " " ||/[^1-9]+$/.test(CpCompra)) {
            alert("codigo postal no valido");
            return false;  
    }

    tarjetaCompra = document.getElementById("NTCompra").value;
    if (tarjetaCompra == null || tarjetaCompra.length < 13 || tarjetaCompra.length > 18 || tarjetaCompra == " " ||/[^1-9]+$/.test(tarjetaCompra)) {
            alert("Numero de tarjeta no valido");
            return false;  
    }

    cvvCompra = document.getElementById("CVVCompra").value;
    if (cvvCompra == null || cvvCompra.length != 3 || cvvCompra == " " ||/[^1-9]+$/.test(cvvCompra)) {
            alert("codigo CVV no valido");
            return false;  
    }

    alert("compra realizada exitosamente");

}

