<html>
	<head>	    
		<title>BOOKMYSHOW</title>
	    <link href="show/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="show/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	    <link href="show/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	    <link href="show/css/style.css" rel="stylesheet">	
		<script src="js/registration.js" type="text/javascript"></script>
	</head>	
	<body>
		<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" method="getevents" returnVariable="events">
		<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" method="getlocations" returnVariable="locations">
		<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" method="getlanguage" returnVariable="language">
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
						<select class="form-select-sm" name="event" id="event" required="yes">
							<cfloop query="events">
								<OPTION VALUE="#events.comboname#">#events.comboname#</OPTION>
							</cfloop>
						</select>
					</td>
					<td><label class="form-label">Language</label></td>
					<td>
						<select class="form-select-sm" name="event" id="event" required="yes">
							<cfloop query="language">
								<OPTION VALUE="#language.comboname#">#language.comboname#</OPTION>
							</cfloop>
						</select>
					</td>
				</tr>
			</table>
			<div class="scroll">
			</div>
		</cfoutput>
	</body>
</html>