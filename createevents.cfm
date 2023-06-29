<!DOCTYPE html>
<html lang="en">
	<head>	    
	    <title>BOOKMYSHOW</title>
        <link rel="stylesheet" type="text/css" href="css/createcontact .css">	    
	    <link href="show/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="show/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	    <link href="show/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	    <link href="show/css/style.css" rel="stylesheet">	    
		<script src="show/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>		
		<script src="js/home.js" type="text/javascript"></script>
	</head>
	<cfinvoke component="BOOKMYSHOW.Components.bookmyshow"  method="geteventtypes" returnVariable="eventtype">
	<cfinvoke component="BOOKMYSHOW.Components.bookmyshow"  method="getlocations" returnVariable="locations">
	<cfinvoke component="BOOKMYSHOW.Components.bookmyshow"  method="getlanguage" returnVariable="languages">
    <cfinvoke component="BOOKMYSHOW.Components.bookmyshow"  datepicker="#LSDateFormat(now(), 'yyyy-mm-dd')#" method="gettheatreinfo" returnVariable="theatres">
	<body>	
        <section  class="d-flex flex-column justify-content-center align-items-center">
            <cfset btnname="Submit">
            <cfset btnvalue="Create & Close">            
            <cfset display="block">
            <cfif url.view eq "true">
                <cfset display="none">	
            </cfif>
            <cfset eventtypemssg="">
            <cfset eventnamemssg="">
            <cfset eventlocationmssg="">
            <cfset eventlanguagemssg="">
            <cfset eventratemssg="">
            <cfset eventtimemssg="">
            <cfset eventpathmssg="">
            <cfset eventfrommssg="">
            <cfset eventtomssg="">
            <cfset theatresmssg="">
            <cfif isDefined("form.Submit")>
                <cfinvoke component="BOOKMYSHOW.Components.adminsettings" method="createevents" 
                form="#form#" returnVariable="res">
                <cfset local.flag="true">
                <cfif  ArrayContains(res, "eventtypemssg")>
                    <cfset eventtypemssg="Required"> 
                    <cfset local.flag="false">
                </cfif>
                <cfif  ArrayContains(res, "eventnamemssg")>
                    <cfset eventnamemssg="Required"> 
                    <cfset local.flag="false">
                </cfif>
                <cfif  ArrayContains(res, "eventlocationmssg")>
                    <cfset eventlocationmssg="Required"> 
                    <cfset local.flag="false">
                </cfif>
                <cfif  ArrayContains(res, "eventlanguagemssg")>
                    <cfset eventlanguagemssg="Required"> 
                    <cfset local.flag="false">
                </cfif>
                <cfif  ArrayContains(res, "eventratemssg")>
                    <cfset eventratemssg="Required">
                    <cfset local.flag="false"> 
                </cfif>
                <cfif  ArrayContains(res, "eventtimemssg")>
                    <cfset eventtimemssg="Required"> 
                </cfif>
                <cfif  ArrayContains(res, "eventpathmssg")>
                    <cfset eventpathmssg="Required"> 
                </cfif>
                <cfif  ArrayContains(res, "eventfrommssg")>
                    <cfset eventfrommssg="Required"> 
                </cfif>
                <cfif  ArrayContains(res, "eventtomssg")>
                    <cfset eventtomssg="Required">
                    <cfset local.flag="false"> 
                </cfif>
                <cfif  ArrayContains(res, "theartsmssg")>
                    <cfset theartsmssgmssg="Required">
                    <cfset local.flag="false"> 
                </cfif>
                <cfif local.flag eq "true">
                    <cflocation url="events.cfm?view=false" addtoken="no">
                </cfif>
            </cfif>            
            <form id="form" name="form" method="post" action="" enctype="multipart/form-data"> 
                <cfoutput>           
                    <div class="profile">        
                        <h5 class="text-light"><a href="index.html">Event Details</a></h5>        
                    </div>        
                    <div class='container'>
                        <table class="table">
                            <tr>
                                <td>
                                    <label class="form-label">Event Type</label><br> 
                                    <select class="form-select-sm"  name="eventtype" id="eventtype" required="yes">
										<OPTION VALUE="">Select</OPTION>
										<cfloop query="eventtype">
                                            <OPTION VALUE="#id#">#eventtypename#</OPTION>
                                        </cfloop>
                                    </select><br>
									<span id="eventtypespan">#eventtypemssg#</span>
                                </td>
                                <td>
                                    <label class="form-label">Event Name</label><br>
                                    <input type="text" class="form-control-sm" name="eventname" maxlength="25" id="eventname" required="yes" value=""><br>
                                    <span id="eventnamespan">#eventnamemssg#</span>
                                </td>
								<td>
                                    <label class="form-label">Event Location</label><br> 
                                    <select class="form-select-sm"  name="eventlocation" id="eventlocation" required="yes">
										<OPTION VALUE="">Select</OPTION>
										<cfloop query="locations">
                                            <OPTION VALUE="#id#">#locationname#</OPTION>
                                        </cfloop>
                                    </select><br>
									<span id="eventlocationspan">#eventlocationmssg#</span>
                                </td>
								<td>
                                    <label class="form-label">Event Language</label><br> 
                                    <select class="form-select-sm"  name="eventlanguage" id="eventlanguage" required="yes">
										<OPTION VALUE="">Select</OPTION>
										<cfloop query="languages">
                                            <OPTION VALUE="#id#">#languagename#</OPTION>
                                        </cfloop>
                                    </select><br>
									<span id="eventlanguagespan">#eventlanguagemssg#</span>
                                </td>                                 
                            </tr>
                            <tr>								
								<td>
                                    <label class="form-label">Event Rating</label><br>
                                    <select class="form-select-sm"  name="eventrate" id="eventrate" required="yes">
										<OPTION VALUE="">Select</OPTION>
										<OPTION VALUE="1">1</OPTION>
										<OPTION VALUE="2">2</OPTION>
										<OPTION VALUE="3">3</OPTION>
										<OPTION VALUE="4">4</OPTION>
										<OPTION VALUE="5">5</OPTION>
										<OPTION VALUE="6">6</OPTION>
										<OPTION VALUE="7">7</OPTION>
										<OPTION VALUE="8">8</OPTION>
										<OPTION VALUE="9">9</OPTION>
										<OPTION VALUE="10">10</OPTION>
                                    </select><br>
									<span id="eventratespan">#eventratemssg#</span>
                                </td>
								<td>
                                    <label class="form-label">Event Time</label><br>
                                    <input type="time" id="eventtime" name="eventtime" class="form-control-sm" min="00:00" max="24:00" required><br>
									<span id="eventtimespan">#eventtimemssg#</span>
                                </td>
								<td colspan="2">
									<label class="form-label">Event Image</label><br>
								 	<input class="form-control-sm" type="file" name="eventpath" id="eventpath" value="" required="yes"><br>
									<span id="eventpathspan">#eventpathmssg#</span>
								</td>              
                            </tr>
                        </table>
                    </div>
                    <div class="container">
                        <table>
                            <tr>
								<td>
									<label class="form-label">Event From</label><br>
                                    <input type="date" id="eventfrom" name="eventfrom" required="yes"><br>
									<span id="eventfromspan">#eventfrommssg#</span>                                   
                                </td>
								<td>
									<label class="form-label">Event To</label><br>
                                    <input type="date" id="eventto" name="eventto" required="yes"><br>
									<span id="eventtospan">#eventtomssg#</span>                                    
                                </td>
                                <td>
									<label class="form-label">Theatre Running</label><br>
                                    <select class="form-select-sm"  name="theatres" id="theatres" required="yes">
                                            <OPTION VALUE="">Select</OPTION>
                                            <cfloop query="theatres">
                                                <OPTION VALUE="#theatres.id#">#theatres.theatrename#</OPTION>
                                            </cfloop>
                                    </select><br>
                                    <span id="theartsmssgspan">#theatresmssg#</span>
                                </td>
                            </tr>
							<tr>
								<td><br>
                                    <input class="btn btn-success" type="Submit" onclick="javascript:eventcheck()" style="display:#display#;" name="#btnname#" class="buttonclose" value="#btnvalue#">                                    
                                </td>
							</tr>							
                        </table>                
                    </div>
                </cfoutput>
            </form> 
        </section>
	</body>
</html>