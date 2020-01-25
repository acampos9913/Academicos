       var origen,
                tipo;
    //window.imagenVacia = 'data:image/gif;base64,R0lGODlhAQABAI' + 
                     'AAAAAAAP///ywAAAAAAQABAAACAUwAOw==';
 
window.mostrarVistaPrevia = function mostrarVistaPrevia(){
 
    var Archivos,
        Lector;
 
    //Para navegadores antiguos
    if(typeof FileReader !== "function" ){
        jQuery('#infoNombre').text('[Vista previa no disponible]');
        jQuery('#infoTamaño').text('(su navegador no soporta vista previa!)');
        return;
    }
 
    Archivos = jQuery('#archivo')[0].files;
    if(Archivos.length>0){
         
        Lector = new FileReader();
        Lector.onloadend = function(e){
 
            //Envía la imagen a la pantalla
            origen = e.target; //objeto FileReader
             
            //Prepara la información sobre la imagen
            tipo = window.obtenerTipoMIME(origen.result.substring(0, 30));
 
            jQuery('#infoNombre').text(Archivos[0].name + ' (Tipo: ' + tipo + ')');
            jQuery('#infoTamaño').text('Tamaño: ' + e.total + ' bytes');
            //Si el tipo de archivo es válido lo muestra, 
            //sino muestra un mensaje 
            if(tipo!=='image/jpeg' && tipo!=='image/png' && tipo!=='image/gif'){
                jQuery('#vistaPrevia').attr('src', document.getElementById('Nada').value);
                alert('El formato de imagen no es válido: debe seleccionar una imagen JPG, PNG o GIF.');
            }else{
                jQuery('#vistaPrevia').attr('src', origen.result);
            }
 
        };
        Lector.onerror = function(e){
            console.log(e)
        }
        Lector.readAsDataURL(Archivos[0]); 
 
    }else{
        var objeto = jQuery('#archivo');
        objeto.replaceWith(objeto.val('').clone());
        jQuery('#vistaPrevia').attr('src', document.getElementById('Nada').value);
        jQuery('#infoNombre').text('[Seleccione una imagen]');
        jQuery('#infoTamaño').text('');
    };
 
 
};
 
//Lee el tipo MIME de la cabecera de la imagen
window.obtenerTipoMIME = function obtenerTipoMIME(cabecera){
    return cabecera.replace(/data:([^;]+).*/, '\$1');
}
 
jQuery(document).ready(function(){
     
    //Cargamos la imagen "vacía" que actuará como Placeholder
    jQuery('#vistaPrevia').attr('src',document.getElementById('Nada').value);
 
    //El input del archivo lo vigilamos con un "delegado"
    jQuery('#botonera').on('change', '#archivo', function(e){
        window.mostrarVistaPrevia();
    });
 
    //El botón Cancelar lo vigilamos normalmente
    jQuery('#cancelar').on('click', function(e){
        var objeto = jQuery('#archivo');
        objeto.replaceWith(objeto.val('').clone());
        jQuery('#vistaPrevia').attr('src', document.getElementById('Nada').value);
        jQuery('#infoNombre').text('[Seleccione una imagen]');
        jQuery('#infoTamaño').text('');
    });
 
});

            // le damos funcionalidad
            $(function(){
                $("#frmEditarCuenta").dialog({
                    height: 450,
                    width:450,
                    autoOpen: false,
                    show:{
                        effect: "blind",
                        duration: 1000
                    },
                    hide:{
                        effect: "explode",
                        duration: 1000
                        
                    },
                        resizable: false,
                        duration: 150,
                        modal: true
                });
                $("#ediPer").click(function(){
                    $("#frmEditarCuenta").dialog("open");
                    
                });
            });
            // le damos funcionalidad
            $(function(){
                $("#frmCambiarContra").dialog({
                    height: 300,
                    width:350,
                    autoOpen: false,
                    show:{
                        effect: "blind",
                        duration: 1000
                    },
                    hide:{
                        effect: "explode",
                        duration: 1000
                        
                    },
                        resizable: false,
                        duration: 150,
                        modal: true
                });
                $("#camContra").click(function(){
                    $("#frmCambiarContra").dialog("open");
                    
                });
            });