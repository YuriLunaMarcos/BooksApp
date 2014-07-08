// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .
$(document).ready(function(){  
  
  
    $('#clavelibro').on("change",function() {
    //pasar a cantidad
    
  });
  $('#cantidadlibro').on("keypress",function(event) {

    //buscar el cliente por rfc y agregarlo
    if ( event.which == 13)
    {
   
      //agregaLibro($('#clavelibro').val()); 
    //  alert("Hemos presionado para realizar busqueda de un cliente: " + $("#clavecliente").val().toLowerCase());
      alert("sumando");
       agregaOrden($('#clavelibro').val());
    }
  });

  $("#guardarVenta").on("click", function(){
    //enviar formulario
    $("#new_sale").submit();
  });
  
  

//Busqueda de cliente http://gastonramos.com.ar/rails21/
  $('#clavecliente').on("keypress",function(event) {
    //buscar el cliente por rfc y agregarlo
   // alert("hola");
    if ( event.which == 13)
    {

      //agregaLibro($('#clavelibro').val()); 
    //  alert("Hemos presionado para realizar busqueda de un cliente: " + $("#clavecliente").val().toLowerCase());
      //var nombreCliente = $("#clavecliente").val().toLowerCase();
      //alert("hola si entro");
      datosCostumer($("#clavecliente").val().toLowerCase());
    }
  });


$('#clavelibro').on("keypress",function(event) {
    //buscar el cliente por rfc y agregarlo
   alert("hola si entro");
    if ( event.which == 13)
    {
      //agregaLibro($('#clavelibro').val()); 
    //  alert("Hemos presionado para realizar busqueda de un cliente: " + $("#clavecliente").val().toLowerCase());
      alert("hola si entro");
      buscarlibro($("#clavelibro").val().toLowerCase());
    }
  });



  //$('#checatipocliente').on("keypress",function(event) {
  //if (document.getElementById("checatipocliente").checked==true)) {    
    //alert("hemos seleccionado el checkbox");
  //}

});
function Suma() 
  {
    var valorA = parseFloat($("#precio").val());
    var valorB = parseFloat($("#cantidadlibro").val());
    alert(valorA);
    alert(valorB);
    var resultado=(valorA * valorB); 
    
    alert(resultado);
    

    var dxlibro = parseFloat(((resultado / 100) * $("#descuento").val()));
    alert(dxlibro);


    var Totaldetodo= parseFloat((resultado)-(dxlibro));

        $("#total").val(Totaldetodo);
        $("#jaja").val(dxlibro)
  }
var sumatotal =0.
var sumatdedescuentos=0;
var sumatdecantidad=0;
function agregaOrden(isbn){
  var index = $(".idLibroVender").length;
  alert("Codigo"+index);
 $.ajax({
    dataType: "json",
    url: "http://localhost:3000/books/findR.json?isbn=" + isbn
  })
  .done(function(data) {
      if(data.id == null){
        alert("No se encontró el libro.");
        resetAgregaLibro();
        return;
      }      
      //armar el nuevo producto a agregar
      var can = parseFloat($("#cantidadlibro").val());

      //total por librito
       var totalporlibro=parseFloat(data.precio) * (can);

       //sacar el pinche descuento
       var descuento = ((data.precio / 100) * $("#descuentolibro").val());
      var totaldescuento = (descuento * $("#cantidadlibro").val());
      
        alert("Datos del libro:" + data.id +" "+ " Codigo: " + data.isbn +" nombre"+data.nombre+" precio "+ data.precio);
       var nuevaOrden = "<tr><td><input class=\"idLibroVender\" id=\"sale_detailsales_attributes_0_book_id\" name=\"sale[detailsales_attributes]["+index+"][book_id]\" readonly=\"readonly\" type=\"text\" value=\""+ data.isbn+"\"></td> <td><input class=\"cantidad\" id=\"sale_detailsales_attributes_0_cantidad\" name=\"sale[detailsales_attributes]["+index+"][cantidad]\" readonly=\"readonly\" type=\"text\" value=\"" +can+ "\"></td> <td><input type=\"text\" id=\"preciolibro\" value=\""+data.precio+"\" readonly=\"readonly\"></td> <td><input type=\"text\" id=\"txl\" value=\""+totalporlibro+"\" readonly=\"readonly\"></td> </td> <td><input type=\"text\" id=\"descuentoporlibro\" value=\""+totaldescuento+"\" readonly=\"readonly\"></tr>";
                                                                                                                                                                                                                                              
        $("#detallesVentaTable tbody").append(nuevaOrden);
        sumatotal+=parseFloat(totalporlibro);
        alert("sumatotal"+sumatotal);
        $("#total").val(sumatotal);
        sumatdedescuentos+=totaldescuento;
        alert("suma total de descuento"+sumatdedescuentos);
        var totalapagaryeah= (sumatotal)-(sumatdedescuentos);
        alert("total a pagar con descuento y todo"+totalapagaryeah);
        $("#totalapagar").val(totalapagaryeah);
        $("#descuentoregistrar").val(sumatdedescuentos);
        sumatdecantidad+=can;
        alert(sumatdecantidad);
       
      }).fail(function(){
        resetAgregaLibro();
    });
}




function datosCostumer(rfc){
  if(rfc == "" || rfc == NaN)
    {
      //alert("ingrese el el nombre del cliente.");
      ocultardatosCostumer(); 
      return;
    } 

    $.ajax({
    dataType: "json",
    url: "http://localhost:3000/costumers/findRFC.json?rfc=" + rfc.toLowerCase() })
    .done(function(data) {
      if(data.id == null){
        //alert("No se encontró el cliente."); 
       mostrardatosCostumer();
        $("#clavecliente").focus(); 
        $("#nombrecliente").val("");
        $("#direccioncliente").val("");
                 
        return;
      }
      else{
        //alert("Se ha encontrado un cliente.");    
        mostrardatosCostumer();
        $("#nombrecliente").val(data.nombre);
        $("#direccioncliente").val(data.telefono);
         
      }
    });
}

function buscarlibro(isbn){
   if(isbn == "" || isbn == NaN)
    {
      a//lert("ingrese el el isbn del cliente.");
      
      return;
    } 

    $.ajax({
    dataType: "json",
    url: "http://localhost:3000/books/findR.json?isbn=" + isbn.toLowerCase() })
    .done(function(data) {
      if(data.id == null){
        alert("No se encontró el libro."); 
       
        $("#clavelibro").focus(); 
        
                 
        return;
      }
      else{
        alert("Se ha encontrado un libro.");    
      
       mostrarDatosLibro();
         $("#precio").val(data.precio);
         $("#nombrelibro").val(data.nombrelibro);
          $("#precio").val(data.precio);
          $("#autor").val(data.autor);
            $("#jaja").val("si entra wey");

        
      }
    });
}


function resetAgregaLibro(){
    $("#cantidadlibro").val(1);
    $('#clavelibro').val("");
    $('#clavelibro').focus();
    
}

  function calculaTotales(){
    var productos = 0;
    var descuento = 0;
    var importeTotal = 0;
    $(".cantidadVender").each(function(index){
      productos += parseInt($(this).val());
    });

    $(".importeProducto").each(function(index){
      importeTotal += parseFloat($(this).val());
    });

    $("#totalArts").html(productos);
    $("#importeTotalVenta").html(formatCurrency(importeTotal));

  }

  //funcion tomada de http://selfcontained.us/2008/04/22/format-currency-in-javascript-simplified/
  function formatCurrency(num) {
    num = isNaN(num) || num === '' || num === null ? 0.00 : num;
    return "$ "+parseFloat(num).toFixed(2);
}

function validaNumeros() {
 if ((event.keyCode < 48) || (event.keyCode > 57)) 
  event.returnValue = false;
}
//Se acentan solo letras M y m
function validaLetras() {
 if ((event.keyCode != 32) && (event.keyCode < 65) || (event.keyCode > 90) && (event.keyCode < 97) || (event.keyCode > 122))
  event.returnValue = false;
}

function ocultardatosCostumer(){ 
  document.getElementById("costumer").style.display = "none";
  /*$(document).ready(function(){
   function fnOcultar(objDiv){
      $("#"+objDiv).css("display", "none"); 
   }
});*/
}

function mostrarDatosLibro(){ 
  document.getElementById("libro").style.display = 'block';
}

