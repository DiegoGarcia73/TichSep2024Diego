function Calcular(urlws, CalculoISRvsIMSS) {
    $.ajax({
        type: 'GET',
        url: urlws,
        contentType: "application/json; charset=utf-8",
        dataType: "html",
        success: CalculoISRvsIMSS,
        error: respuestaErronea

    });
}
function respuestaErronea(jqXHR, estatus, error) {
    var mensaje = '';
    if (jqXHR === 0) {
        mensaje = 'No hay conexión con el servidor';
    } else if (jqXHR === 404) mensaje = 'No se encontró la página solicitada';
    else {
        mensaje = 'Error desconocido. Contacte al administrador de sitio web';
        console.log(exception);
    }
    alert(mensaje);
}
