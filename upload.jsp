<!DOCTYPE html>
<html>
<head>
    <title>Image Upload</title>
</head>
<body>
    <h1>Upload Image</h1>
    <form action="uploadimage.jsp" method="post" enctype="multipart/form-data">
        <input type="file" name="imageFile" accept="image/*" />
        <input type="submit" value="Upload" />
    </form>
</body>
</html>
