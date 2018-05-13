layui.use(['form','element'], function(){
    var form = layui.form;
    var element = layui.element;
    var selObj = [
        {
            index:  0,
            first_name: '',
            second_data: [
                {index: 19, second_name: 'html'},
                {index: 12, second_name:'web'},
                {index: 13, second_name: 'javascript'}
            ]
        },
        {
            index: 1,
            first_name: '',
            second_data: [
                {index: 14, second_name: 'java'},
                {index: 15, second_name:'php'},
                {index: 16, second_name: '.net'}
            ]
        }
    ]
    form.on('select(level)', function (data) {
    	//var secObj = selObj;
    	var i = data.value;
    	var secid = nameid[i];
    	var secString = nameString[i];
        var str = '<option value="请选择" selected>请选择</option>';
        for (var j=0;secid[j]>0 ; j++) {
            str += "<option value='" + secid[j] + "'>" + secString[j] + "</option>";
            layui.alert(str);

        }
    	
/*        var secObj = selObj[data.value-1].second_data;
        var str = '<option value="请选择" selected>请选择</option>';
        for (var i=0; i < secObj.length; i++) {
            str += "<option value='" + secObj[i].index + "'>" + secObj[i].second_name + "</option>";
        }*/
        $("#second-level-select").html(str);
        str = '';

        form.render();

    });
    //监听提交
    form.on('submit(formSend)', function(data){
        console.log(JSON.stringify(data.field))
    });
});
