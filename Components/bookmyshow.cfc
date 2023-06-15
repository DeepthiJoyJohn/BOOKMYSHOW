<cfcomponent output="false"> 
    <cffunction name="getlogin" access="remote">
		<cfargument name="Uname">
		<cfargument name="Pass">
		<cfquery name="local.getlogin" datasource="bookmyshow">
				SELECT 					
					id,username  
				FROM 
					login 
				WHERE 
					username=<cfqueryparam value="#arguments.Uname#" cfsqltype="CF_SQL_VARCHAR">
					AND password=<cfqueryparam value="#arguments.Pass#" cfsqltype="CF_SQL_VARCHAR">
		</cfquery> 
		<cfreturn local.getlogin>
	</cffunction>  
	<cffunction name="getevents" access="remote">		
		<CFQUERY NAME="local.eventlist" DATASOURCE="bookmyshow">
			SELECT 
				comboname
			FROM 
				combos
			WHERE
				combotype="events"			
			ORDER BY 
				id
		</CFQUERY>
		<cfreturn local.eventlist>
	</cffunction>
	<cffunction name="getlocations" access="remote">		
		<CFQUERY NAME="local.locationlist" DATASOURCE="bookmyshow">
			SELECT 
				comboname
			FROM 
				combos
			WHERE
				combotype="location"				
			ORDER BY 
				id
		</CFQUERY>
		<cfreturn local.locationlist>
	</cffunction> 
	<cffunction name="getlanguage" access="remote">		
		<CFQUERY NAME="local.languagelist" DATASOURCE="bookmyshow">
			SELECT 
				comboname
			FROM 
				combos
			WHERE
				combotype="language"				
			ORDER BY 
				id
		</CFQUERY>
		<cfreturn local.languagelist>
	</cffunction> 
	<cffunction name="geteventimages" access="remote">	
		<CFQUERY NAME="local.eventimages" DATASOURCE="bookmyshow">
			SELECT 
				eventpath,eventname,eventrate,HOUR(eventtime) AS hr,MINUTE(eventtime) AS mi
			FROM 
				events		   
			ORDER BY 
				id
		</CFQUERY>
		<cfreturn local.eventimages>
	</cffunction>  
    <cffunction name="login" access="remote">
        <cfargument name="Uname">
		<cfargument name="Pass">
		<cfset session.username="">
		<cfset session.userid="">
		<cfset local.errorarray=ArrayNew(1)>
		<cfif arguments.Uname eq "">
			<cfset ArrayAppend(local.errorarray, "Username Required")> 
		</cfif>
		<cfif arguments.Pass eq "">
			<cfset ArrayAppend(local.errorarray, "Password Required")> 
		</cfif>
		<cfif (arguments.Uname NEQ "") &&  (arguments.Pass NEQ "")>
			<cfset myRecordSet = getlogin("#arguments.Uname#","#arguments.Pass#") />
			<cfif myRecordSet.RecordCount GTE 1> 				
				<cfset session.username="#myRecordSet.username#">
				<cfset session.userid="#myRecordSet.id#">
				<cfset ArrayAppend(local.errorarray, "Correct")> 
			<cfelse>
				<cfset ArrayAppend(local.errorarray, "Wrong Credendials")> 
			</cfif>
		</cfif>
		<cfreturn local.errorarray>
    </cffunction>
    <cffunction name="signup" access="public">
        <cfargument name="form">
		<cfset local.errorarray=ArrayNew(1)>
		<cfif form.username eq "">
			<cfset ArrayAppend(local.errorarray, "usernamemessage")>
		</cfif>  
		<cfif form.emailname eq "">
			<cfset ArrayAppend(local.errorarray, "emailmessage")>
		</cfif>
		<cfif form.password1 eq "">
			<cfset ArrayAppend(local.errorarray, "password1")>
		</cfif>
		<cfif form.password2 eq "">
			<cfset ArrayAppend(local.errorarray, "password2")>
		</cfif>
		<cfif Form.password1 NEQ form.password2>				
			<cfset ArrayAppend(local.errorarray, "passwordmissmatch")>	
		</cfif>
		<cfif (form.username neq "") && (form.emailname neq "") && (form.password1 eq form.password2)>	
			<cfset local.myRecordSet = getlogin("#form.username#","#form.password1#") />
			<cfif local.myRecordSet.RecordCount GTE 1>  
				<cfset ArrayAppend(local.errorarray, "Already Exists")>  
			<cfelse>			                             
				<cfquery name="local.signup" datasource="addressbook">
					INSERT INTO 
						login (username,password,email) 
					VALUES
						(<cfqueryparam value="#form.username#" cfsqltype="CF_SQL_VARCHAR">,
						<cfqueryparam value="#form.password1#" cfsqltype="CF_SQL_VARCHAR">,
						<cfqueryparam value="#form.emailname#" cfsqltype="CF_SQL_VARCHAR">)
				</cfquery>				
				<cfset ArrayAppend(local.errorarray, "Registered Please Login")>  
			</cfif>			
		</cfif>
        <cfreturn local.errorarray>
    </cffunction>	
	<cffunction name="gettheatreinfo" access="remote">	
		<CFQUERY NAME="local.gettheatreinfo" DATASOURCE="bookmyshow">
			SELECT 
				theatrename,theatreadd,HOUR(showtime) AS hr,MINUTE(showtime) AS mi
			FROM 
				theatre	
			WHERE 
				eventid="1"	   
			ORDER BY 
				id
		</CFQUERY>
		<cfreturn local.gettheatreinfo>
	</cffunction>
	<cffunction name="getseats" access="remote">	
		<CFQUERY NAME="local.getseats" DATASOURCE="bookmyshow">
			SELECT 
				*
			FROM 
				theatredetails	
			WHERE 
				theatreid="1"	
		</CFQUERY>
		<cfreturn local.getseats>
	</cffunction>
	<cffunction name="getseatdetails" access="remote">	
		<CFQUERY NAME="local.getseatdetails" DATASOURCE="bookmyshow">
			SELECT 
				*
			FROM 
				theatreseatdetails	
			WHERE 
				theatredetailsid="1"	
		</CFQUERY>
		<cfreturn local.getseatdetails>
	</cffunction>
	<cffunction name="updateseatstatus1" access="remote">
		<CFQUERY NAME="local.updateseatstatus" DATASOURCE="bookmyshow">
			UPDATE 
				theatreseatdetails	
			SET 
				status="selected"
			WHERE
				id="#url.seatid#"					
		</CFQUERY>
		<cfreturn local.updateseatstatus.RecordCount> 
	</cffunction>
	<cffunction name="updateseatstatus" access="remote">
		<cfset local.btntxt="#url.seatid#">
		<cfreturn local.btntxt> 
	</cffunction>
</cfcomponent>  