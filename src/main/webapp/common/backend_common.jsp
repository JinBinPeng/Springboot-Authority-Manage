<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta http-equiv="pragma" content="no-cache"/>
<meta charset="utf-8"/>
<title>管理员控制台</title>
<meta name="description" content="overview &amp; stats"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="/assets/css/bootstrap.min.css"/>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css"/>
<!-- page specific plugin styles -->
<!-- text fonts -->
<link rel="stylesheet" href="/assets/css/google-fonts.css"/>
<!-- ace styles -->
<link rel="stylesheet" href="/assets/css/ace.min.css"/>
<!--[if lte IE 9]>
<link rel="stylesheet" href="/assets/css/ace-part2.min.css"/>
<![endif]-->
<link rel="stylesheet" href="/assets/css/ace-skins.min.css"/>
<link rel="stylesheet" href="/assets/css/ace-rtl.min.css"/>
<link rel="stylesheet" href="/assets/css/jquery.gritter.css" />
<link rel="stylesheet" href="/assets/css/jquery-ui.min.css" />
<link rel="stylesheet" href="/assets/css/chosen.css" />
<!--[if lte IE 9]>
<link rel="stylesheet" href="/assets/css/ace-ie.min.css"/>
<![endif]-->
<!-- inline styles related to this page -->
<!-- ace settings handler -->
<script src="/assets/js/ace-extra.min.js"></script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lte IE 8]>
<script src="/js/html5shiv.min.js"></script>
<script src="/js/respond.min.js"></script>
<![endif]-->

<script src="/js/jquery-1.9.1.min.js"></script>
<script src="/assets/js/jquery-ui.min.js"></script>
<script src="/assets/js/jquery.gritter.min.js"></script>
<script src="/assets/js/chosen.jquery.min.js"></script>
<script src="http://cdn.bootcss.com/mustache.js/2.2.1/mustache.js"></script>
<script src="/bootstrap3.3.5/js/bootstrap.min.js"></script>

<script type="text/javascript">
    // 展示提示信息
    function showMessage(title, msg, isSuccess) {
        if (!isSuccess) {
            msg = msg || '';
        } else {
            msg = msg || '操作成功'
        }
        $.gritter.add({
            title: title,
            text: msg != '' ? msg : "服务器处理异常, 建议刷新页面来保证数据是最新的",
            time: '',
            class_name: (isSuccess ? 'gritter-success' : 'gritter-warning') + (!$('#gritter-light').get(0).checked ? ' gritter-light' : '')
        });
    }
</script>