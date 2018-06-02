layui.use(['carousel', 'form', 'element'], function(){
    var carousel = layui.carousel;
    var form = layui.form;
    var element = layui.element;

    carousel.render({
        elem: '#test1'
        ,width: '100%' //设置容器宽度
        ,arrow: 'hover' //始终显示箭头
        ,inteval: '5000'
        //,anim: 'updown' //切换动画方式
    });

    form.render();
    //监听提交，这里是表单提交的内容
    form.on('submit(formDemo)', function(data){
        layer.msg(JSON.stringify(data.field));
        return false;
    });

});


