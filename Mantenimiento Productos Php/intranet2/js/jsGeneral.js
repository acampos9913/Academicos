function removerobjeto (obj){
    $(obj).css({
        'background-color': 'yellow',
        'border-color':'red'
    });
    $(obj).fadeOut(1000, function(){
        $(obj).remove().fadeIn("slow");
    });
}
function removermsje (obj){
    //$(obj).fadeOut(10000, function(){$(obj).remove().fadeOut(10000);});
    $(obj).delay(3000);
    $(obj).fadeOut(7000, function(){
        $(obj).remove().fadeOut(7000);
    })
//  $(obj).delay(3000).remove().fadeOut(10000);
}
function msjAviso(obj,msje){
    $(obj).html("<div class='aviso'id='msjeii'><img src='images/ico_aviso.png'/>"+" "+msje+"</div>");
}

function msjAlerta(obj,msje){ //se usa para mostrar un msje de alerta
    $(obj).html("<div class='alerta'id='msjeii'><img src='images/ico_alerta.png'/>"+" "+msje+"</div>");
}

function msjExito(obj,msje){ //se usa para mostrar un msje de Exito de un insert en la BD
    $(obj).html("<div class='exito'id='msjeii'><img src='images/ico_exito.png'/>"+" "+msje+"</div>");
    removermsje("#msjeii");
}

function msjError(obj,msje){ //se usa para mostrar un msje de error
    $(obj).html("<div class='errora'id='msjeii'><img src='images/ico_error.png'/>"+" "+msje+"</div>");
}

function msjLoadList(obj,msje){ //se usa para mostrar un preload cuando se esta listando data
    $(obj).html("<div id='msjeii'><img src='images/preload3.gif'/>"+" "+msje+"</div>");
}

function MostrarData(obj,data){ //se usa para mostrar un efecto cuando hacemos un listado de filas de una BD
    $(obj).fadeOut("fast", function(){
        $(obj).html(data).fadeIn("slow");
    })
}

function verurl(url){
	var randomnumber=Math.random()*11;	
        msjLoadList("#contenido","Espere un momento por favor");
	$.post(url,{rn:randomnumber},function(data){
	MostrarData("#contenido",data);});
}