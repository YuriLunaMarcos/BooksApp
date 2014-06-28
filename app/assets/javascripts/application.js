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
//= require turbolinks
//= require_tree .


$(document).ready(function(){  
  ocultarDatosCliente(); 
  $('#clavelibro').on("change",function() {
    //pasar a cantidad
    $("#cantidadlibro").focus();
  });

  $('#cantidadlibro').on("keypress",function(event) {
    //buscar el libro por codigo y agregarlo
    if ( event.which == 13)
    {
      //agregaOrden($('#clavelibro').val());
      //alert("Hemos presionado un enter");
      agregaOrden($('#clavelibro').val());
      
    }
  });

  $("#guardarVenta").on("click", function(){
    //enviar formulario
    $("#new_order").submit();
  });

//Busqueda de cliente http://gastonramos.com.ar/rails21/
  $('#clavecliente').on("keypress",function(event) {
    //buscar el cliente por rfc y agregarlo
    if ( event.which == 13)
    {
      //agregaLibro($('#clavelibro').val()); 
    //  alert("Hemos presionado para realizar busqueda de un cliente: " + $("#clavecliente").val().toLowerCase());
      var nombreCliente = $("#clavecliente").val().toLowerCase();
      buscarCliente($("#clavecliente").val().toLowerCase());
    }
  });

  //$('#checatipocliente').on("keypress",function(event) {
  //if (document.getElementById("checatipocliente").checked==true)) {    
    //alert("hemos seleccionado el checkbox");
  //}

});

function agregaOrden(isbn){
  var index = $("#clavelibro").length;

  alert("Codigo"+index);

  if(isbn == "" || isbn == NaN)
  {
    alert("ingrese el código del libro.");
    $("#cantidadlibro").val(1);
    $('#clavelibro').focus();
    return;
  }

  $.ajax({
    dataType: "json",
    url: "http://localhost:3000/books/find.json?isbn=" + isbn
  })
  .done(function(data) {
      if(data.id == null){
        alert("No se encontró el libro.");
        resetAgregaLibro();
        return;
      }
      //80precio/100*20%      
      var descuento = ((data.precio / 100) * $("#descuentolibro").val());
      var totaldescuento = (descuento * $("#cantidadlibro").val());

      alert("El descuento es de: "+ descuento);
      alert("El total de descuento es de: "+ totaldescuento);

      //armar el nuevo producto a agregar
        alert("Datos del libro:" + data.id +" "+ " Codigo: " + data.isbn +" "+ data.precio);
       //var nuevoLibro = "<tr><td><input class=\"idLibroVender\" id=\"sale_saleDetails_attributes_0_product_id\" name=\"sale[saleDetails_attributes]["+index+"][product_id]\" readonly=\"readonly\" type=\"text\" value=\"" + data.id + "\"></td><td><input type=\"text\" id=\"nombreProducto\" readonly=\"readonly\" value=\"" + data.nombre+"\"></td> <td><input id=\"sale_saleDetails_attributes_0_preciounitario\" name=\"sale[saleDetails_attributes]["+index+"][preciounitario]\" readonly=\"readonly\" type=\"text\" value=\"" + data.precio + "\"></td><td><input class=\"cantidadVender\" id=\"sale_saleDetails_attributes_0_cantidad\" name=\"sale[saleDetails_attributes]["+index+"][cantidad]\" readonly=\"readonly\" type=\"text\" value=\"" + $("#cantidadlibro").val() + "\"></td><td><input class=\"importeProducto\" id=\"sale_saleDetails_attributes_0_importe\" name=\"sale[saleDetails_attributes]["+index+"][importe]\" readonly=\"readonly\" type=\"text\" value=\"" + (data.precio * $("#cantidadlibro").val()) + "\"></td></tr>";       
         var nuevaOrden = "<tr><td><input class=\"idLibroVender\" id=\"order_orderDs_attributes_0_product_id\" name=\"order[orderDs_attributes]["+index+"][product_id]\" readonly=\"readonly\" type=\"text\" value=\""+ data.id +"\"></td> <td><input type=\"text\" id=\"nombreProducto\" value=\""+data.nombre+"\" readonly=\"readonly\"></td>   <td><input id=\"order_orderDs_attributes_0_precioUnitario\" name=\"order[orderDs_attributes]["+index+"][precioUnitario]\" readonly=\"readonly\" type=\"text\" value=\"" + data.precio + "\" ></td>         <td><input class=\"cantidadVender\" id=\"order_orderDs_attributes_0_cantidad\" name=\"order[orderDs_attributes]["+index+"][cantidad]\" readonly=\"readonly\" type=\"text\" value=\"" + $("#cantidadlibro").val() + "\"></td>      <td><input class=\"descuentoProducto\" id=\"order_orderDs_attributes_0_desceuento\" name=\"order[orderDs_attributes]["+index+"][desceuento]\" readonly=\"readonly\" type=\"text\" value=\"" + ((data.precio / 100) * $("#descuentolibro").val()) +"\"></td>    <td><input class=\"importeProducto\" id=\"order_orderDs_attributes_0_importeTotal\" name=\"order[orderDs_attributes]["+index+"][importeTotal]\" readonly=\"readonly\" type=\"text\" value=\"" + ((data.precio * $("#cantidadlibro").val()) - (totaldescuento)) + "\"></td></tr>";
       alert(nuevaOrden);
        $("#detallesVentaTable tbody").append(nuevaOrden);
        resetAgregaLibro();
        calculaTotales();
      }).fail(function(){
        resetAgregaLibro();
    });
  }

  function buscarCliente(rfc){
   if(rfc == "" || rfc == NaN)
    {
      alert("ingrese el el nombre del cliente.");
      ocultarDatosCliente(); 
      return;
    } 

    $.ajax({
    dataType: "json",
    url: "http://localhost:3000/costumers/findRFC.json?rfc=" + rfc.toLowerCase() })
    .done(function(data) {
      if(data.id == null){
        alert("No se encontró el cliente."); 
        mostrarDatosCliente();
        $("#clavecliente").focus(); 
        $("#nombrecliente").val("");
        $("#diraccioncliente").val("");
        $("#emailcliente").val("");
        $("#telefonocliente").val("");
        $("#facebookcliente").val("");
        $("#lynkedincliente").val("");            
        return;
      }
      else{
        //alert("Se ha encontrado un cliente.");    
        mostrarDatosCliente();
        $("#nombrecliente").val(data.nombre);
        $("#apellidoscliente").val(data.apellidos);
        $("#direccioncliente").val(data.diraccion);
        $("#emailcliente").val(data.correoE);
        $("#telefonocliente").val(data.telefono);
        $("#facebookcliente").val(data.facebook);
        $("#lynkedincliente").val(data.linkedin);

      }
    });
    alert("ingrese el el nombre del cliente."); 
  }

  function resetAgregaLibro(){
    $("#cantidadlibro").val(1);
    $('#clavelibro').val("");
    $('#clavelibro').focus();
    $('#descuentolibro').val(0);
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
//Se acentan solo valores númericos
function validaNumeros() {
 if ((event.keyCode < 48) || (event.keyCode > 57)) 
  event.returnValue = false;
}
//Se acentan solo letras M y m
function validaLetras() {
 if ((event.keyCode != 32) && (event.keyCode < 65) || (event.keyCode > 90) && (event.keyCode < 97) || (event.keyCode > 122))
  event.returnValue = false;
}

function ocultarDatosCliente(){ 
  document.getElementById("cliente").style.display = "none";
  /*$(document).ready(function(){
   function fnOcultar(objDiv){
      $("#"+objDiv).css("display", "none"); 
   }
});*/
}

function mostrarDatosCliente(){ 
  document.getElementById("cliente").style.display = 'block';
}