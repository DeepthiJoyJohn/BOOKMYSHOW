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
	<body>	
        <section  class="d-flex flex-column justify-content-center align-items-center">
            <cfset id=0>
            <cfset title="Mr">
            <cfset firstname="">
            <cfset lastname="">
            <cfset gender="Male">
            <cfset dob="">
            <cfset photo="">
            <cfset address="">
            <cfset street="">
            <cfset email="">
            <cfset phone="">
            <cfset btnname="Submit">
            <cfset btnvalue="Create & Close">            
            <cfset display="block">
            <cfif #url.id# neq 0 AND #url.id# neq "">
                <cfset contactdetails = EntityNew("contactdetails")>
                <cfset contactdetails = EntityLoad('contactdetails', {id=#url.id#}, true)>
                <cfset id=contactdetails.getid()>
                <cfset title=contactdetails.gettitle()>
                <cfset firstname=contactdetails.getfirstname()>
                <cfset lastname=contactdetails.getlastname()>
                <cfset gender=contactdetails.getgender()>
                <cfset dob=contactdetails.getdob()>
                <cfset photo=contactdetails.getphoto()>
                <cfset address=contactdetails.getaddress()>
                <cfset street=contactdetails.getstreet()>
                <cfset email=contactdetails.getemail()>
                <cfset phone=contactdetails.getphone()>	
                <cfset btnname="Update">
                <cfset btnvalue="Update & Close">                       
            </cfif>
            <cfif url.view eq "true">
                <cfset display="none">	
            </cfif>
            <cfset titlemssg="">
            <cfset firstnamemssg="">
            <cfset lastnamemssg="">
            <cfset gendermssg="">
            <cfset dobmssg="">
            <cfset addressmssg="">
            <cfset streetmssg="">
            <cfset emailmssg="">
            <cfset phonemssg="">
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
									<span id="eventtypespan"></span>
                                </td>
                                <td>
                                    <label class="form-label">Event Name</label><br>
                                    <input type="text" class="form-control-sm" name="eventname" maxlength="25" id="eventname" required="yes" value="#firstname#"><br>
                                    <span id="eventnamespan"></span>
                                </td>
								<td>
                                    <label class="form-label">Event Location</label><br> 
                                    <select class="form-select-sm"  name="eventlocation" id="eventlocation" required="yes">
										<OPTION VALUE="">Select</OPTION>
										<cfloop query="locations">
                                            <OPTION VALUE="#id#">#locationname#</OPTION>
                                        </cfloop>
                                    </select><br>
									<span id="eventlocationspan"></span>
                                </td>
								<td>
                                    <label class="form-label">Event Language</label><br> 
                                    <select class="form-select-sm"  name="eventlanguage" id="eventlanguage" required="yes">
										<OPTION VALUE="">Select</OPTION>
										<cfloop query="languages">
                                            <OPTION VALUE="#id#">#languagename#</OPTION>
                                        </cfloop>
                                    </select><br>
									<span id="eventlanguagespan"></span>
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
									<span id="eventratespan"></span>
                                </td>
								<td>
                                    <label class="form-label">Event Time</label><br>
                                    <input type="time" id="eventtime" name="eventtime" class="form-control-sm" min="00:00" max="24:00" required><br>
									<span id="eventtimespan"></span>
                                </td>
								<td colspan="2">
									<label class="form-label">Event Image</label><br>
								 	<input class="form-control-sm" type="file" name="eventpath" id="eventpath" value=""><br>
									<span id="eventpathspan"></span>
								</td>              
                            </tr>
                        </table>
                    </div>
                    <div class="container">
                        <table>
                            <tr>
								<td>
									<label class="form-label">Event From</label><br>
                                    <input type="date" id="eventfrom" name="eventfrom"><br>
									<span id="eventfromspan"></span>                                   
                                </td>
								<td>
									<label class="form-label">Event To</label><br>
                                    <input type="date" id="eventto" name="eventto"><br>
									<span id="eventtospan"></span>                                    
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
            <cfif isDefined("form.Update")>
                <cfinvoke component="ADDRESSBOOK.Components.addressbook" method="updatecontact" 
                form="#form#">
                <cflocation url="listing.cfm" addtoken="no">
            </cfif>	    
        </section>
	</body>
</html>