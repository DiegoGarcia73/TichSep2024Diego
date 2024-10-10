document.addEventListener('DOMContentLoaded', function () {
    const datosAlumnos = [
        { id: '1', nombre: 'Sandra', edad: 25  },
        { id: '2', nombre: 'Lucas', edad: 20 },
        { id: '3', nombre: 'Martin', edad: 22 },
        { id: '4', nombre: 'María López', edad: 28 },
        { id: '5', nombre: 'Carlos Fernández', edad: 35 },
        { id: '6', nombre: 'Patricia Ruiz', edad: 27},
        { id: '7', nombre: 'José Morales', edad: 32 },
        { id: '8', nombre: 'Laura Rodríguez', edad: 29 },
        { id: '9', nombre: 'Santiago Pérez', edad: 24 },
        { id: '10', nombre: 'Gabriela Martínez', edad: 26 }
    ];

    const idInput = document.getElementById('id');
    const nombreInput = document.getElementById('nombre');
    const edadInput = document.getElementById('edad');
    const estadoInput = document.getElementById('estado');
    const activoCheck = document.getElementById('activoCheck');
    const consultarBtn = document.getElementById('consultarBtn');
    const guardarBtn = document.getElementById('guardarBtn');

    function habilitarCampos() {
        nombreInput.disabled = false;
        edadInput.disabled = false;
        estadoInput.disabled = false;
        idInput.disabled = true;
        consultarBtn.style.display = 'none';  // Ocultar
        guardarBtn.style.display = 'inline';  // Mostrar
        guardarBtn.disabled = false;
        activoCheck.disabled = false;  // Habilitar 
    }

    function deshabilitarCampos() {
        nombreInput.disabled = true;
        edadInput.disabled = true;
        estadoInput.disabled = true;
        idInput.disabled = false;
        consultarBtn.style.display = 'inline';  // Mostrar
        guardarBtn.style.display = 'none';  // Ocultar  
        guardarBtn.disabled = true;
        activoCheck.disabled = true;  // 
        activoCheck.checked = false;  // 
    }

    function limpiarCampos() {
        idInput.value = '';
        nombreInput.value = '';
        edadInput.value = '';
        estadoInput.value = '';
    }

    consultarBtn.addEventListener('click', function () {
        const idValue = idInput.value.trim();
        if (idValue === '') {
            alert('No se ingresó ID, por favor ingrese uno.');
            return;
        }

        const alumno = datosAlumnos.find(a => a.id === idValue);

        if (alumno) {
            nombreInput.value = alumno.nombre;
            edadInput.value = alumno.edad;
            estadoInput.value = alumno.estado;
            habilitarCampos();
        } else {
            alert('No se encontró un alumno .');
        }
    });

    guardarBtn.addEventListener('click', function () {
        alert('Actualización exitosa');
        limpiarCampos();
        deshabilitarCampos();
    });
      
    deshabilitarCampos();
});