<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jQuery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<head>
</head>
<body>
<jsp:include page="adminOpHeader.jsp"></jsp:include><br>
<script type="text/javascript">
function reset()
{
	window.location.href = "?pageName=updateStock.jsp";

}
function updatestock()
{
	event.preventDefault();
	var cansAvail = document.getElementById("cansAvail").value;
	
	var formData = "cansAvail=" +cansAvail;

    var url = "http://localhost:8080/watercanappf-api/UpdateStock?" + formData;
    console.log(url);
    $.get(url, function(response){
    console.log(response);
    var data= response;
    
    if ( data.errorMessage != null) {
    	alert(data.errorMessage);
    }
    else
    	{
    	alert("Cans added succesfully");
    	window.location.href= "?pageName=adminOperations.jsp";
    	}
       
    });
}
</script>
<%
String errorMessage = request.getParameter("errorMessage");
if(errorMessage!=null){
	out.println("<font color='red'>" + errorMessage + "</font>");
}
%>
<form onsubmit="upatestock()" >
Set Available Cans: 
<input type="number" id="cansAvail" name="cansAvail" placeholder="Enter the cans" required autofocus  /> <br>
<button type="submit"  value="Submit" class="btn btn-success" onclick="updatestock()">submit</button>
<button type="reset"  value="Reset" class="btn btn-danger" >Clear</button>
<input type="button" class ="button" value="Back" onclick="history.go(-1);"><br></br>

</form>
</body>
</html>