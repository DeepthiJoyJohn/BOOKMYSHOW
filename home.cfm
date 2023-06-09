<html>
	<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" method="geteventtypes" returnVariable="eventtypes">
	<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" method="getlocations" returnVariable="locations">
	<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" method="getlanguage" returnVariable="language">
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
		<cfset session.key = generateSecretKey("AES") />
		<cfset locationsel="">
		<cfset eventtype="">
		<cfset languagetype="">
		<cfif isDefined("form.location") OR isDefined("form.event") OR isDefined("form.language")>
			<cfset locationsel="#form.location#">
			<cfset eventtype="#form.event#">
			<cfset languagetype="#form.language#">
			<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" language="#form.language#" listing="" event="#form.event#" location="#form.location#" method="geteventimages" returnVariable="images">					
		<cfelse>
			<cfinvoke component="BOOKMYSHOW.Components.bookmyshow" language="" event="" location="" listing="" method="geteventimages" returnVariable="images">		
		</cfif>	
		<body>		
			<cfoutput>	
				<table class="table">
					<tr> 
						<td><label class="form-label">Location</label></td>
						<td>					 	
							<select class="form-select-sm" name="location" id="location" onchange="comboassign();" required="yes">
								<OPTION VALUE="">All</OPTION>
								<cfloop query="locations">
									<cfif (#locationsel# eq #locations.id#)>
										<cfset locsel="selected">
									<cfelse>
										<cfset locsel="">
									</cfif>
									<OPTION #locsel# VALUE="#locations.id#">#locations.locationname#</OPTION>
								</cfloop>
							</select>
						</td>
						<td><label class="form-label">Events</label></td>
						<td>
							<select class="form-select-sm"  name="event" id="event" onchange="comboassign();" required="yes">
								<OPTION VALUE="">All</OPTION>
								<cfloop query="eventtypes">
									<cfif (#eventtype# eq #eventtypes.id#)>
										<cfset evesel="selected">
									<cfelse>
										<cfset evesel="">
									</cfif>
									<OPTION #evesel# VALUE="#eventtypes.id#">#eventtypes.eventtypename#</OPTION>
								</cfloop>
							</select>
						</td>
						<td><label class="form-label">Language</label></td>
						<td>
							<select class="form-select-sm" name="language" onchange="comboassign();" id="language" required="yes">
								<OPTION VALUE="">All</OPTION>
								<cfloop query="language">
									<cfif (#languagetype# eq #language.id#)>
										<cfset lansel="selected">
									<cfelse>
										<cfset lansel="">
									</cfif>
									<OPTION #lansel# VALUE="#language.id#">#language.languagename#</OPTION>
								</cfloop>
							</select>						
						</td>
						<td>
							<a href="login.cfm"><span>Log Out</span></a> 
						</td>
					</tr>
				</table>			
				<div class="scroll">
					<table class="table">
						<tr>
							<cfloop index="i" from="1" to="#images.RecordCount#">
								<cfimage action="read" source="Events/#images.eventpath[i]#" name="myImage">
								<td>
									<cfimage source="#myImage#" action="writeToBrowser"><br>
									<label class="eventname">#images.eventname[i]#</label>
									<span class="eventspan">
										<i class="bi bi-star"></i>
										<label class="eventname">#images.eventrate[i]#/10</label>
										<label class="eventname">#images.hr[i]#h #images.mi[i]#m</label>
									</span><br>
									<cfset encryptedimagesid = Encrypt(#images.id[i]#, session.key, "AES", "HEX") /> 
									<button type="button" name="eventbutton" onclick="eventdetails('#encryptedimagesid#')" class="btn btn-danger btn-sm">BOOK TICKET</button>
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