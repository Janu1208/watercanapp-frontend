<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jQuery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<head>
</head>
<body style="text-align:center" font-color="red">
<jsp:include page="adminOpHeader.jsp"></jsp:include><br>

<script type="text/javascript">
function logout()
{
	localStorage.clear();
	window.location.href = "?pageName=adminLogin.jsp";

}
</script>

<h3>Welcome_Admin</h3>
<a href="?pageName=adAvailCans.jsp">Available Cans</a><br>

<a href="?pageName=updateStock.jsp">Update Stock</a><br>
<input type="button"  value="Logout" class="btn btn-primary" onclick= "logout()">
</body>
</html>