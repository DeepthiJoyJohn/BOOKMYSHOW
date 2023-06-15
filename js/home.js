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
function eventseats(value) {
	window.location="theatreseats.cfm?id="+value;
}
function markseat(value){
	alert(value);
	$(document).ready(function(){	
				$.ajax({
					type: "GET",
					url: '../Components/bookmyshow.cfc?method=updateseatstatus&seatid='+value,
					cache: false,
					success: function(data){
						alert(html(data));
					},
				});
		
	});
}

