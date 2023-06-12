<html>
	<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" method="getevents" returnVariable="events">
	<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" method="getlocations" returnVariable="locations">
	<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" method="getlanguage" returnVariable="language">	
	<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" method="geteventimages" returnVariable="images">					
	<form id="form" name="form" method="post" action="" enctype="multipart/form-data">
	<head>	    
		<title>BOOKMYSHOW</title>
	    <link href="show/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="show/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	    <link href="show/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	    <link href="show/css/style.css" rel="stylesheet">		
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>		
		<script src="js/home.js" type="text/javascript"></script>
	</head>	
	<body>		
		<cfoutput>			
			<table class="table">
				<tr> 
					<td><label class="form-label">Location</label></td>
					<td>
						<select class="form-select-sm" name="location" id="location" required="yes">
							<cfloop query="locations">
								<OPTION VALUE="#locations.comboname#">#locations.comboname#</OPTION>
							</cfloop>
						</select>
					</td>
					<td><label class="form-label">Events</label></td>
					<td>
						<select class="form-select-sm" onchange="invokecfc(this.value)" name="event" id="event" required="yes">
							<cfloop query="events">
								<OPTION VALUE="#events.comboname#">#events.comboname#</OPTION>
							</cfloop>
						</select>
					</td>
					<td><label class="form-label">Language</label></td>
					<td>
						<select class="form-select-sm" name="language" id="language" required="yes">
							<cfloop query="language">
								<OPTION VALUE="#language.comboname#">#language.comboname#</OPTION>
							</cfloop>
						</select>						
					</td>
				</tr>
			</table>			
			<div class="scroll">
				<table class="table">
					<tr>
						<cfloop index="i" from="1" to="#images.RecordCount#">
							<cfimage action="read" source="#images.eventpath[i]#" name="myImage">
							<td>
								<cfimage source="#myImage#" action="writeToBrowser"><br>
								<label class="eventname">#images.eventname[i]#</label>
								<span class="eventspan">
									<i class="bi bi-star"></i>
									<label class="eventname">#images.eventrate[i]#/10</label>
									<label class="eventname">#images.hr[i]#h #images.mi[i]#m</label>
								</span><br>
								<button type="button" name="eventbutton" onclick="eventdetails(#i#)" class="btn btn-danger btn-sm">BOOK TICKET</button>
							</td>
							<cfif i%4 eq 0>
								<tr>
							</cfif>
						</cfloop>
					</tr>
				</table>
			</div>
		</cfoutput>
	</body>
	</form>
</html>