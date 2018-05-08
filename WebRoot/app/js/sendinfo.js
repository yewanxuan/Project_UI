layui.use(['form','element'], function(){
    var form = layui.form;
    var element = layui.element;
    var selObj = [
        {
            index:  0,
            first_name: '前端开发',
            second_data: [
                {index: 0, second_name: 'html'},
                {index: 1, second_name:'css'},
                {index: 2, second_name: 'javascript'}
            ]
        },
        {
            index: 1,
            first_name: '后台开发',
            second_data: [
                {index: 0, second_name: 'java'},
                {index: 1, second_name:'php'},
                {index: 2, second_name: 'pathon'}
            ]
        }
    ]
    form.on('select(level)', function (data) {

        var secObj = selObj[data.value-1].second_data;
        var str = '<option value="请选择" selected>请选择</option>';
        for (var i=0; i < secObj.length; i++) {
            str += "<option value='" + secObj[i].index + "'>" + secObj[i].second_name + "</option>";
        }
        console.log(str);
        $("#second-level-select").html(str);
        str = '';

        form.render();

    });
    //监听提交
    form.on('submit(formSend)', function(data){
        console.log(JSON.stringify(data.field))
    });
});
