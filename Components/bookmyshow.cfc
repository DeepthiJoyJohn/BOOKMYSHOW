<cfcomponent output="false">

	<!--function to get Login Details--> 
    <cffunction name="getlogin" access="remote">
		<cfargument name="Uname">
		<cfargument name="Pass">
		<cfquery name="local.getlogin" datasource="bookmyshow">
				SELECT 					
					id,username,userrole  
				FROM 
					login 
				WHERE 
					username=<cfqueryparam value="#arguments.Uname#" cfsqltype="CF_SQL_VARCHAR">
					AND password=<cfqueryparam value="#arguments.Pass#" cfsqltype="CF_SQL_VARCHAR">
		</cfquery> 
		<cfreturn local.getlogin>
	</cffunction> 
	<!--End-->

	<!--function to get Event Types--> 
	<cffunction name="geteventtypes" access="remote">		
		<CFQUERY NAME="local.eventtypes" DATASOURCE="bookmyshow">
			SELECT 
				eventtypename,id
			FROM 
				eventtypes
			ORDER BY 
				eventtypename 
			DESC
		</CFQUERY>
		<cfreturn local.eventtypes>
	</cffunction>
	<!--End-->

	<!--function to get Locations-->
	<cffunction name="getlocations" access="remote">		
		<CFQUERY NAME="local.locationlist" DATASOURCE="bookmyshow">
			SELECT 
				locationname,id
			FROM 
				locations							
			ORDER BY 
				locationname 
			DESC
		</CFQUERY>
		<cfreturn local.locationlist>
	</cffunction> 
	<!--End-->

	<!--function to get Languages-->
	<cffunction name="getlanguage" access="remote">		
		<CFQUERY NAME="local.languagelist" DATASOURCE="bookmyshow">
			SELECT 
				languagename,id
			FROM 
				languages
			ORDER BY 
				languagename
			DESC
		</CFQUERY>
		<cfreturn local.languagelist>
	</cffunction> 
	<!--End--> 

	<!--function to get Events for listing-->
	<cffunction name="geteventimages" access="remote">
		<cfargument name="location">
		<cfargument name="event">
		<cfargument name="language">
		<cfargument name="listing">
		<CFQUERY NAME="local.eventimages" DATASOURCE="bookmyshow">
			SELECT 
				events.id as id,locations.locationname,languages.languagename,eventtypes.eventtypename 
				as eventtypename,eventpath,eventname,eventtype,eventlanguage,eventrate,HOUR(eventtime) 
				AS hr,MINUTE(eventtime) AS mi,DATE_FORMAT(eventfrom, "%d-%m-%Y") as eventfrom,
				DATE_FORMAT(eventto, "%d-%m-%Y") as eventto
			FROM 
				events 
			INNER JOIN 
				eventtypes on (eventtypes.id=events.eventtype)
			INNER JOIN 
				languages on (languages.id=events.eventlanguage)
			INNER JOIN 
				locations on (locations.id=events.eventlocation)
			WHERE 1
			<cfif #arguments.listing# neq "admin">
				AND DATE(NOW()) <= eventfrom 
			</cfif>
			<cfif #arguments.location# neq "">
				AND eventlocation="#arguments.location#"
			</cfif>
			<cfif #arguments.event# neq "">
				AND eventtype="#arguments.event#"
			</cfif>
			<cfif #arguments.language# neq "">
				AND eventlanguage="#arguments.language#"
			</cfif>
		</CFQUERY>		
		<cfreturn local.eventimages>
	</cffunction>  
	<!--End-->

    <!--Assiging Session in login-->
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
			<cfif (myRecordSet.RecordCount GTE 1) AND myRecordSet.userrole eq ""> 				
				<cfset session.username="#myRecordSet.username#">
				<cfset session.userid="#myRecordSet.id#">
				<cfset ArrayAppend(local.errorarray, "Correct")> 
			<cfelseif (myRecordSet.RecordCount GTE 1) AND (myRecordSet.userrole eq "admin")>
				<cfset session.username="#myRecordSet.username#">
				<cfset session.userid="#myRecordSet.id#">
				<cfset ArrayAppend(local.errorarray, "admin")>
			<cfelse>
				<cfset ArrayAppend(local.errorarray, "Wrong Credendials")> 
			</cfif>
		</cfif>
		<cfreturn local.errorarray>
    </cffunction>
	<!--End-->

	<!--Sign Up-->
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
				<cfquery name="local.signup" datasource="bookmyshow">
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
	<!--End-->
	<cffunction name="updatepayment" access="remote">
		<CFQUERY NAME="local.updatepayment" DATASOURCE="bookmyshow">
				INSERT INTO 
					theatreseatstatus(theatreid,seatid,seatstatus,showdate)
				VALUES
					(#url.theatreid#,#url.seatid#,"sold","#url.date#")
			</CFQUERY>
	</cffunction>

	<cffunction name="gettheatreinfo" access="remote">	
		<cfargument name="datepicker">	
		<cfargument name="eventid">	
		<CFQUERY NAME="local.gettheatreinfo" DATASOURCE="bookmyshow">
			SELECT 
				theatre.id,theatre.theatrename,theatre.theatreadd,HOUR(theatre.showtime) AS hr,MINUTE(theatre.showtime) AS mi
			FROM 
				theatre
			<cfif #arguments.eventid# neq "">
			INNER JOIN
				events on (theatre.id=events.theatres)
			</cfif>
			WHERE 1 
			<cfif #arguments.eventid# neq "">
				AND events.id=#arguments.eventid#
			</cfif>
			<cfif #arguments.datepicker# neq "" and  #arguments.eventid# neq "">
				AND "#arguments.datepicker#" BETWEEN events.eventfrom AND events.eventto
			</cfif>
			ORDER BY 
				theatre.id
		</CFQUERY>
		<cfreturn local.gettheatreinfo>
	</cffunction>

	<cffunction name="getseats" access="remote">
		<cfargument name="theatreid">	
		<CFQUERY NAME="local.getseats" DATASOURCE="bookmyshow">
			SELECT 
				*
			FROM 
				theatredetails
		</CFQUERY>
		<cfreturn local.getseats>
	</cffunction>
	
	<cffunction name="getsoldseats" access="remote">
		<cfargument name="theatreid">
		<cfset local.soldstruct=StructNew()>
		<CFQUERY NAME="local.getsoldseats" DATASOURCE="bookmyshow">
			SELECT 
				seatid
			FROM
				theatreseatstatus
			WHERE
				theatreid="#arguments.theatreid#"
			ORDER BY ID
		</CFQUERY>
		<cfloop query="local.getsoldseats">
			<cfset value=StructInsert(local.soldstruct, "#local.getsoldseats.seatid#", "#local.getsoldseats.seatid#")> 
		</cfloop>
		<cfreturn local.soldstruct> 
	</cffunction>	

	

</cfcomponent>  