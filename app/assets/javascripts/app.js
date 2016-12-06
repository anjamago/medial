$(document).ready(function(){

  $('#search').on('click',function(){

      var min = $('#min').val() !=='' ? $('#min').val() : 0  ;
      var max = $('#max').val() !=='' ? $('#max').val() : 0;
      var product = $('#product').val();
      var lab = $('#labs').val();
      var element = $('#msjReques');
      if(product === '' && labs === '')
      {
          element.innetHTML = 'Ingrese un Laboratorio o un producto';
      }
      var data = {
        'min':min,
        'max':max,
        'product':product,
        'labs':lab
      };
      $.ajax({
        url:'/search',
        dataType:'json',
        data:data,
        method:'post',
        success:function(dataJson){
          products = dataJson.product;
          labs = dataJson.labs;
          console.log(products);
          console.log(labs);
          if (product != "") {

            for(p in products ){
                element.prepend(products[p].nombre);
            }
          }
          if(labs !=""){
            for(l in labs ){
                for(p in products ){
                  if(products[p].id_laboratorio === labs[l].id)
                  {
                    element.prepend(products[p].nombre);
                    element.prepend(labs[l].nombre);
                  }
              }
            }
          }
        },
        error:function(dataJsonError){
          console.log(dataJsonError);
        }

      });

  });
});
