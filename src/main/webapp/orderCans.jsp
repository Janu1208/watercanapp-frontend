<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jQuery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<head>

</head>
<body>
<jsp:include page="userOpHeader.jsp"></jsp:include><br>


<p>Do you want to order your reserved cans?:</p>
<input type = "submit" value = "Yes" class="btn btn-success" onclick="window.location.href = "?pageName=reserveOrder.jsp';">
<input type = "button" value = "No" class="btn btn-danger" onclick="window.location.href = '?pageName=directOrder.jsp';">

</body>
</html>