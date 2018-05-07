layui.use('form', function(){
    var form = layui.form;
    form.render();

    form.on('submit(formLogin)', function(data){
      //  layer.msg(JSON.stringify(data.field));
    });
});