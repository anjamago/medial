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
          labs = dataJson.labs

          if(product !=""){
            for(p in products ){
              if(products[p].nombre === product)
              {
                element.innetHTML=products[p].nombre;

              }
            }
          }
            if(labs !=""){
              for(l in labs ){
                if(labs[l].nombre === lab)
                {
                  for(p in products ){
                    if(products[p].id_laboratorio === labs[l].id)
                    {
                      element.innetHTML=products[p].nombre;
                      element.innetHTML = labs[l].nombre;

                    }
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
