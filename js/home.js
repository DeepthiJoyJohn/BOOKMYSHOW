$(document).ready( function() {
	$('#datepicker').attr('min',today); 	
	
});
function comboassign(value) {
   document.form.submit();
}
function checknull() {
	var locationname=document.getElementById("locationname").value;	
	if(locationname==""){
      document.getElementById("locationnamediv").innerHTML="Please Enter Location Name!!";
	  return false;
	}
	
 }
function invokecfc(value) {	
	$.ajax({
		type: "GET",
		url: '../Components/bookmyshow.cfc?method=geteventimages&event='+value,
		cache: false,
		success: function(data){	
			
		},
	});
}

function eventdetails(value) {	
	window.location="eventdetails.cfm?id="+value;
}
function eventseats(value,eventid,datevalue) {
	window.location="theatreseats.cfm?id="+value+"&eventid="+eventid+"&datevalue="+datevalue.value;
}
function payamt(id) {
	$.ajax({
		type: "GET",
		url: 'Components/bookmyshow.cfc?method=updatepayment&theatredetailsid='+id,					
		success: function(data){
			location.reload();
		},
	});
}
function markseat(value){
	$.ajax({
		type: "GET",
		url: 'Components/bookmyshow.cfc?method=updateseatstatus&seatid='+value,					
		success: function(data){
			location.reload();
		},
	});
}

