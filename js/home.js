function invokecfc(value) {	
	$(document).ready(function(){	
		$.ajax({
			type: "GET",
			url: '../Components/bookmyshow.cfc?method=geteventimages&event='+value,
			cache: false,
			success: function(data){	
				
			},
		});

});
}
function eventdetails(value) {	
	window.location="eventdetails.cfm?id="+value;
}