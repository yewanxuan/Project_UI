<%@ page contentType="text/html; charset=UTF-8"%>
<script src=" <%= request.getContextPath()%>/wap/js/public/globalFunction.js"></script>
<script>
    (function () {
        if (isPC()) {
            window.location.href = 'index.action';
        } else {
            window.location.href = 'wapindex.action'
        }
    })();
</script>
