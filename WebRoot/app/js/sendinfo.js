layui.use(['form','element'], function(){
    var form = layui.form;
    var element = layui.element;
    var jsonStr = $("#jsonObj").val();
    jsonStr =jsonStr.replace(/'/g,"\"");
    var jsonObj = JSON.parse(jsonStr);

    form.on('select(level)', function (data) {
    	var selectIndex = data.value;
        var str = '<option value="请选择" selected>请选择</option>';
        for (var i=0; i< jsonObj.length;i++){
            if (selectIndex == jsonObj[i].pid) {
                for (var j=1;j<jsonObj[i].second_data.length;j++){
                    str += "<option value='" + jsonObj[i].second_data[j].id + "'>" + jsonObj[i].second_data[j].typeName + "</option>";
                }
            }
        }
        $("#second-level-select").html(str);
        str = '';

        form.render();

    });
    //监听提交
    form.on('submit(formSend)', function(data){
        console.log(JSON.stringify(data.field))
    });
});
