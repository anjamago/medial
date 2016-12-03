$(document).ready(function(){

  $('#search').on('click',function(){

      var min = $('#min').val() !=='' ? $('#min').val() : 0  ;
      var max = $('#max').val() !=='' ? $('#max').val() : 0;
      var product = $('#product').val();
      var labs = $('#labs').val();
      console.log(product, labs);
      if(product === '' && labs === '')
        {
          console.log('campos vacio');
          alert('Campos Vacios Ingrese un valor ');
          return ;
        }
      var data = {
        'min':min,
        'max':max,
        'product':product,
        'labs':labs
      };
      $.ajax({
        url:'/search',
        dataType:'json',
        data:data,
        method:'post',
        success:function(dataJson){
          console.log(dataJson);
        },
        error:function(dataJsonError){
          console.log(dataJsonError);
        }

      });
  });
});
