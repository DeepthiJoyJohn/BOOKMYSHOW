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
		<cfoutput>
		<h1>WELCOME HOME</h1>
		<label class="form-label">Location</label>
		<CFQUERY NAME="locationlist" DATASOURCE="bookmyshow">
			SELECT 
				location
			FROM 
				location			
			ORDER BY 
				id
		</CFQUERY>   
		<select class="form-select-sm" name="location" id="location" required="yes">
			<cfloop query="locationlist">
				<OPTION VALUE="#locationlist.location#">#locationlist.location#</OPTION>
			</cfloop>
		</select>
		</cfoutput>
	</body>
</html>