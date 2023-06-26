$(document).ready( function() {
	$('#datepicker').attr('min',today); 	
	
});
window.onunload = refreshParent;
    function refreshParent() {
        window.opener.location.reload();
		window.close();
    }
function comboassign(value) {
   document.form.submit();
}
function checknull() {
	var locationname=document.getElementById("locationname").value;	
	if(locationname==""){
      document.getElementById("errornamediv").innerHTML="Please Enter Location Name!!";
	  return false;
	}
 }
function checknulllan() {
	var languagename=document.getElementById("languagename").value;	
	if(languagename==""){
      document.getElementById("errornamediv").innerHTML="Please Enter language Name!!";
	  return false;
	}	
 }
 function checknulleve() {
	var eventtypename=document.getElementById("eventtypename").value;	
	if(eventtypename==""){
      document.getElementById("errornamediv").innerHTML="Please Enter Event Type Name!!";
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
function eventcheck(){
	var eventtype = document.getElementById("eventtype").value;
	var eventname = document.getElementById("eventname").value;	
	var eventlocation = document.getElementById("eventlocation").value;	
	var eventlanguage = document.getElementById("eventlanguage").value;	
	var eventrate = document.getElementById("eventrate").value;
	var eventtime = document.getElementById("eventtime").value;	
	var eventpath = document.getElementById("eventpath").value;
	var eventfrom = document.getElementById("eventfrom").value;	
	var eventto = document.getElementById("eventto").value;											
	document.getElementById("eventtypespan").innerHTML="";
	document.getElementById("eventnamespan").innerHTML="";
	document.getElementById("eventlocationspan").innerHTML="";
	document.getElementById("eventlanguagespan").innerHTML="";
	document.getElementById("eventratespan").innerHTML="";
	document.getElementById("eventtimespan").innerHTML="";
	document.getElementById("eventpathspan").innerHTML="";
	document.getElementById("eventfromspan").innerHTML="";
	document.getElementById("eventtospan").innerHTML="";
	
		if(eventtype=="" || eventtype==null){
			document.getElementById("eventtypespan").innerHTML="Required";				
		}
		if(eventname=="" || eventname==null){
		 	document.getElementById("eventnamespan").innerHTML="Required";			 
		}
		if(eventlocation=="" || eventlocation==null){
			document.getElementById("eventlocationspan").innerHTML="Required";					
		}
		if(eventlanguage=="" || eventlanguage==null){
			document.getElementById("eventlanguagespan").innerHTML="Required";								
		}
		if(eventrate=="" || eventrate==null){
			document.getElementById("eventratespan").innerHTML="Required";								
		}
		if(eventtime=="" || eventtime==null){
			document.getElementById("eventtimespan").innerHTML="Required";								
		}
		if(eventpath=="" || eventpath==null){
			document.getElementById("eventpathspan").innerHTML="Required";								
		}
		if(eventfrom=="" || eventfrom==null){
			document.getElementById("eventfromspan").innerHTML="Required";								
		}
		if(eventto=="" || eventto==null){
			document.getElementById("eventtospan").innerHTML="Required";								
		}			 
}

