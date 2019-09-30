<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jQuery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<head>
</head>
<body style="text-align:center" font-color="pink">
<jsp:include page="userOpHeader.jsp"></jsp:include><br>

<script type="text/javascript">

</script>

<div id="name"></div>
<a href="?pageName=availableCans.jsp">Available Cans</a><br>
<a href="?pageName=directOrder.jsp">Order Cans</a><br>
<a href="?pageName=reserveCans.jsp">Reserve Cans</a><br>

<input type="button"  value="Logout" class="btn btn-danger" onclick= "logout()">
<script type="text/javascript">
function logout()
{
	localStorage.clear();
	window.location.href = "?pageName=index.jsp";

}
function displayName()
{
	var user=JSON.parse(localStorage.getItem("LOGGED_IN_USER"));
	var name=user.name;
	document.getElementById("name").innerHTML="<h2>Welcome        " + name +"</h2>";
    return name;
}
displayName();
</script>
</body>

</html>