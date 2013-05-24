<% 
    String context = request.getContextPath();
    request.setAttribute("context",context);
    //String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+context+"/";
%>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="3600" />
<meta name="description" content="Your page description here ..." />
<meta name="keywords" content="Your keywords, keywords, keywords, here ..." />
<link rel="stylesheet" type="text/css" media="screen,projection,print"
	href="<%=context %>/css/layout4_setup.css" />
<link rel="stylesheet" type="text/css" media="screen,projection,print"
	href="<%=context %>/css/layout4_text.css" />
<link rel="icon" type="image/x-icon" href="<%=context %>/img/favicon.ico" />
<!-- Global IE fix to avoid layout crash when single word size wider than column width -->
<!--[if IE]><style type="text/css"> body {word-wrap: break-word;}</style><![endif]-->
<link rel="stylesheet" type="text/css" href="<%=context %>/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=context %>/js/easyui/themes/icon.css">
<script type="text/javascript" src="<%=context %>/js/easyui/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=context %>/js/easyui/jquery.easyui.min.js"></script>

<link rel="stylesheet" href="<%=context %>/js/jwysiwyg/jquery.wysiwyg.css" type="text/css" />
<script type="text/javascript" src="<%=context %>/js/jwysiwyg/jquery.wysiwyg.js"></script>
