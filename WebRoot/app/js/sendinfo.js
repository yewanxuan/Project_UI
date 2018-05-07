
layui.use(['form','element'], function(){
    var form = layui.form;
    var element = layui.element;

    //监听提交
    form.on('submit(formSend)', function(data){

        console.log(JSON.stringify(data.field))
    });
});


