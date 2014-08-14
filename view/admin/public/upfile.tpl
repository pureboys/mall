<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>上传缩略图</title>
</head>
<body id="main">

<form action="?a=call&m=upLoad" method="post" enctype="multipart/form-data" style="text-align: center;margin: 30px">
    <input type="hidden" name="MAX_FILE_SIZE" value="204800"/>
    <input type="file" name="pic"/>
    <input type="submit" name="send" value="确定上传"/>
</form>

</body>
</html>