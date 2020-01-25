$(document).ready(function() {
Listar();
llenaCategoria();
llenaProveedor();
ListarCategoria();
ListarProveedor();

if($('#btnRegistrar').val()=="Registrar"){
	 $("#frmProducto").validate({
		submitHandler: function() {
		
		var cboPro = document.getElementById("cboProveedor");
		var cboCat = document.getElementById("cboCategoria");
		
        var cbopro = cboPro.options[cboPro.selectedIndex].text;
		var cbocat = cboCat.options[cboCat.selectedIndex].text;
		
	$('#result').html("<img src='images/preload3.gif'/><span> Espere un momento por favor..</span>");
    $.post('libs/Producto.php', {
        tip:"Registro",
        nombre:$("#txtNombre").val(),
        precio:$("#txtPrecio").val(),
        stock:$("#txtStock").val(),
		prov:$("#cboProveedor").val(),
		cat:$("#cboCategoria").val()
    },function(data){
        if(data=="exito"){
        msjExito("#msje","Registro Correcto!!!");
		Listar();
        var l ="";
        $("#txtNombre").val(l);
        $("#txtPrecio").val(l);
        $("#txtStock").val(l);
		llenaCategoria();
		llenaProveedor();
		
    }else{msjError("#msje","Error")}
    });
},
	
	rules: {
            txtNombre:{required: true},
            txtPrecio:{required: true},
            txtStock:{required: true},
			cboProveedor:{required: true},
			cboCategoria:{required: true},
        },

        messages: {
			txtNombre: {required: "Escribir el Nombre"},
            txtPrecio: {required: "Escribir Precio"},
            txtStock:  {required: "Escribir Stock"},
			cboProveedor:{required: "Seleccione Proveedor"},
			cboCategoria:{required: "Seleccione Categoria"}
        }
		});	
}

$('#btnBuscarProveedor').click(function(){
    $('#resultprov').html("<img src='images/preload3.gif'/><span> Espere un momento por favor..</span>");
    $.post('libs/Producto.php', {
        tip:"bp",
        nomp:$("#txtBuscarProveedor").val()
    },function(data){
        if(data=="vacio")
            {
				$('#resultprov').html("<img src='images/preload3.gif'/><span> Espere un momento por favor..</span>");
                msjAviso("#resultprov","NO HAY DATOS");
            }
            else{
				$('#resultprov').html("<img src='images/preload3.gif'/><span> Espere un momento por favor..</span>");
                MostrarData("#resultprov",data);
            }
   });
});

$('#btnBuscarCategoria').click(function(){
    $('#resultcat').html("<img src='images/preload3.gif'/><span> Espere un momento por favor..</span>");
    $.post('libs/Producto.php', {
        tip:"bc",
        nomc:$("#txtBuscarCategoria").val()
    },function(data){
        if(data=="vacio")
            {
				$('#resultcat').html("<img src='images/preload3.gif'/><span> Espere un momento por favor..</span>");
                msjAviso("#resultcat","NO HAY DATOS");
            }
            else{
				$('#resultcat').html("<img src='images/preload3.gif'/><span> Espere un momento por favor..</span>");
                MostrarData("#resultcat",data);
            }
   });
});


$('#btnActualizar').click(function(){    
    $.post('libs/Producto.php', {
        tip:"upd",
        mcod:$("#txtCodm").val(),
        mnom:$("#txtNombrem").val(),
        mprecio:$("#txtPreciom").val(),
        mstock:$("#txtStockm").val(),
		mprov:$("#txtProm").val(),
		mcat:$("#txtCatm").val()	
    },function(data){
        if(data=="exito"){
       $('#mipopup').dialog('close');
        Listar();
        var l =""
    }else{msjError("#msje","Error")}
    });
});

});

function Listar(){
$.post('libs/Producto.php', {
        tip:"Listar"
    },function(data){
        if(data=="vacio")
            {
				$('#result').html("<img src='images/preload3.gif'/><span> Espere un momento por favor..</span>");
                msjAviso("#result","NO HAY DATOS");
            }
            else{
				$('#result').html("<img src='images/preload3.gif'/><span> Espere un momento por favor..</span>");
                MostrarData("#result",data);
            }
    });
}

function Paginacion(pag){
	var tip="Listar";
	document.getElementById("result").innerHTML = "<img src='images/preload3.gif' width='16' height='16'> Espere un momento por favor...";
	$.post("libs/Producto.php",{pag:pag,tip:tip},function(data){
	MostrarData("#result",data);
    });
    }

function ListarCategoria(){
$.post('libs/Producto.php', {
        tip:"lc"
    },function(data){
        if(data=="vacio")
            {
				$('#resultcat').html("<img src='images/preload3.gif'/><span> Espere un momento por favor..</span>");
                msjAviso("#resultcat","NO HAY DATOS");
            }
            else{
				$('#resultcat').html("<img src='images/preload3.gif'/><span> Espere un momento por favor..</span>");
                MostrarData("#resultcat",data);
            }
    });
}

function ListarProveedor(){
$.post('libs/Producto.php', {
        tip:"lp"
    },function(data){
        if(data=="vacio")
            {
				$('#resultprov').html("<img src='images/preload3.gif'/><span> Espere un momento por favor..</span>");
                msjAviso("#resultprov","NO HAY DATOS");
            }
            else{
				$('#resultprov').html("<img src='images/preload3.gif'/><span> Espere un momento por favor..</span>");
                MostrarData("#resultprov",data);
            }
    });
}

$(function() {
    $( "input:button" ).button();
    $( "input:submit" ).button();	
	//Listar();

     $('#mipopup').dialog({
        autoOpen: false,
        width: 950,
        position: 'center',
        resizable: false,
        modal:true
    });
	$('#mipopupbp').dialog({
        autoOpen: false,
        width: 600,
		height:400,
        position: 'center',
        resizable: false,
        modal:true
    });
	$('#mipopupbc').dialog({
        autoOpen: false,
        width: 600,
		height:400,
        position: 'center',
        resizable: false,
        modal:true
    });
	$('#popupVerPdf').dialog({
        autoOpen: false,
        width: 950,
		height:600,
        position: 'center',
        resizable: false,
        modal:true
    });	
});

function show_popupActualizarProducto(cod,nom,pre,stock,prov,cat,nprov,ncat){
	var prov_conv = nprov.replace(/_/g,' ');
    msjLoadList("#mipopup","Espere un momento por favor..");
    $.post("modificarProducto.php", {
		cod:cod,
		nombre:nom,
		precio:pre,
		stock:stock,
		proveedor:prov,
		categoria:cat,
		nProveedor:prov_conv,
		nCategoria:ncat
    }, function(data){
        $('#mipopup').html(data);
    });
    $(function(){
        $('#mipopup').dialog('open');
    });
}

function show_popupBuscarProveedor(){
    msjLoadList("#mipopupbp","Espere un momento por favor..");
    $.post("buscarProveedor.php", {
    }, function(data){
        $('#mipopupbp').html(data);
    });
    $(function(){
        $('#mipopupbp').dialog('open');
    });
}

function show_popupBuscarCategoria(){
    var rdn=Math.random()*11;
    msjLoadList("#mipopupbc","Espere un momento por favor..");
    $.post("buscarCategoria.php", {
        rdn:rdn
    }, function(data){
        $('#mipopupbc').html(data);
    });
    $(function(){
        $('#mipopupbc').dialog('open');
    });
}

function EliminarProducto(cod){
$.post('libs/Producto.php', {
        tip:"del",
        dcod: cod
    },function(data){
        if(data=="exito"){
            Listar();
        }else{
            msjError("#msjee","Ocurrió un error inesperado, vuelva a intentarlo !!")
        }
    });
}

function llenaCategoria(){
    $.post('libs/Producto.php', {
        tip:"c"
    },function(data){
       $('#cboCategoria').html(data);
	   $('#cboCategoriam').html(data);
    });
}

function llenaProveedor(){
    $.post('libs/Producto.php', {
        tip:"p"
    },function(data){
       $('#cboProveedor').html(data);
	   $('#cboProveedorm').html(data);
    });
}

function AgregarProveedor(codigo,nombre)
{
    var nomb = nombre;
    var cod = codigo;
    var nomb_conv = nomb.replace(/_/g,' ');
	
	$("#txtProm").val(cod);
	$("#txtProveedorm").val(nomb_conv);
	
	$(function(){
        $('#mipopupbp').dialog('close');		
    });
}

function AgregarCategoria(codigo,nombre)
{
    var nomb = nombre;
    var cod = codigo;
    var nomb_conv = nomb.replace(/_/g,' ');
	
	$("#txtCatm").val(cod);
	$("#txtCategoriam").val(nomb_conv);
	
	$(function(){
        $('#mipopupbc').dialog('close');		
    });
}

function VerPdf(cod,nom,pre,stock,npro,ncat){
	var prov_conv = npro.replace(/_/g,' ');
    msjLoadList("#popupVerPdf","Espere un momento por favor..");
    $.post("verPDF.php", {
        tip:"verProd",
		cod:cod,
		nom:nom,
		precio:pre,
		stock:stock,
		prov:prov_conv,
		cat:ncat
    }, function(data){
       MostrarData("#popupVerPdf",data);

    });
    $(function(){
        $('#popupVerPdf').dialog('open');
    });
}

function limpiar(){
	var l ="";
    $("#txtNombre").val(l);
    $("#txtPrecio").val(l);
	$("#txtStock").val(l);
	llenaCategoria();
	llenaProveedor();
}