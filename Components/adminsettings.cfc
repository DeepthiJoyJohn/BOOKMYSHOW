<cfcomponent output="false"> 

	<!--Insert to location table-->
	<cffunction name="addlocation" access="remote">
		<cfargument name="locationname">
		<cfquery name="local.addlocation" datasource="bookmyshow">
				INSERT INTO
					locations (locationname)
				VALUES 
					(<cfqueryparam value="#arguments.locationname#" cfsqltype="CF_SQL_VARCHAR">)
		</cfquery> 
	</cffunction>
	<!--End-->

	<!--Delete location-->
	<cffunction name="deletelocation" access="remote">
		<cfargument name="id">
		<cfquery name="local.deletelocation" datasource="bookmyshow">
				DELETE 
				FROM
					locations 
				WHERE 
					(id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">)
		</cfquery> 
		<cflocation url="../locations.cfm">
	</cffunction>
	<!--End-->

	<!--Insert to eventtype table-->
	<cffunction name="addeventtypes" access="remote">
		<cfargument name="eventtypename">
		<cfquery name="local.addeventtype" datasource="bookmyshow">
				INSERT INTO
					eventtypes (eventtypename)
				VALUES 
					(<cfqueryparam value="#arguments.eventtypename#" cfsqltype="CF_SQL_VARCHAR">)
		</cfquery> 
	</cffunction>
	<!--End-->

	<!--Delete eventtype-->
	<cffunction name="deleteeventtype" access="remote">
		<cfargument name="id">
		<cfquery name="local.deleteeventtype" datasource="bookmyshow">
				DELETE 
				FROM
					eventtypes 
				WHERE 
					(id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">)
		</cfquery> 
		<cflocation url="../eventtypes.cfm">
	</cffunction>
	<!--End-->

	<!--Insert to language table-->
	<cffunction name="addlanguages" access="remote">
		<cfargument name="languagename">
		<cfquery name="local.addlanguage" datasource="bookmyshow">
				INSERT INTO
					languages (languagename)
				VALUES 
					(<cfqueryparam value="#arguments.languagename#" cfsqltype="CF_SQL_VARCHAR">)
		</cfquery> 
	</cffunction>
	<!--End-->

	<!--Delete language-->
	<cffunction name="deletelanguages" access="remote">
		<cfargument name="id">
		<cfquery name="local.deletelanguages" datasource="bookmyshow">
				DELETE 
				FROM
					languages 
				WHERE 
					(id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">)
		</cfquery> 
		<cflocation url="../languages.cfm">
	</cffunction>
	<!--End-->

	<!--Creating Events-->
	<cffunction name="createevents" access="public">
        <cfargument name="form"> 
        <cfset local.filename="">
        <cfif isDefined("form.eventpath") AND evaluate("form.eventpath") NEQ "" >
            <cffile action="upload" fileField="form.eventpath" destination="#expandpath('./')#/Events" 
            accept="image/png,image/jpg,image/gif,image/jpeg"  
            nameconflict="makeunique">
            <cfset local.filename="#cffile.serverfile#">            
   	    </cfif> 
		<cfset local.errorarray=ArrayNew(1)>
		<cfset local.flag="true"> 		
   	    <cfif form.eventtype EQ "">
			<cfset ArrayAppend(local.errorarray, "eventtypemssg")> 
			<cfset local.flag="false"> 
		</cfif>
   	    <cfif form.eventname EQ "">   	    	
   	    	<cfset ArrayAppend(local.errorarray, "eventnamemssg")> 
			<cfset local.flag="false"> 
		</cfif> 
   	    <cfif form.eventlocation EQ "">
   	    	<cfset ArrayAppend(local.errorarray, "eventlocationmssg")> 
			<cfset local.flag="false"> 
		</cfif>
   	    <cfif form.eventlanguage EQ "">
   	    	<cfset ArrayAppend(local.errorarray, "eventlanguagemssg")>
			<cfset local.flag="false">  
		</cfif>
   	    <cfif form.eventrate EQ "">
   	    	<cfset ArrayAppend(local.errorarray, "eventratemssg")>
			<cfset local.flag="false">  
		</cfif>
   	    <cfif form.eventtime EQ "">
   	    	<cfset ArrayAppend(local.errorarray, "eventtimemssg")>
			<cfset local.flag="false">  
		</cfif>
   	    <cfif form.eventpath EQ "">
   	    	<cfset ArrayAppend(local.errorarray, "eventpathmssg")> 
			<cfset local.flag="false"> 
	    </cfif>
   	    <cfif form.eventfrom EQ "">
   	    	<cfset ArrayAppend(local.errorarray, "eventfrommssg")> 
		</cfif>
   	    <cfif form.eventto EQ "">   	   
   	    	<cfset ArrayAppend(local.errorarray, "eventtomssg")> 
			<cfset local.flag="false"> 
   	    </cfif>
		 <cfif form.theatres EQ "">   	   
   	    	<cfset ArrayAppend(local.errorarray, "theatresmssg")> 
			<cfset local.flag="false"> 
   	    </cfif>
		<cfquery name="local.createevents" datasource="bookmyshow">
			INSERT INTO 
				events (eventpath,eventtype,eventname,eventrate,eventtime,eventlocation,eventfrom,
				eventto,eventlanguage,theatres)  
			VALUES
				(
				<cfqueryparam value="#local.filename#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#form.eventtype#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#form.eventname#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#form.eventrate#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#form.eventtime#" cfsqltype="CF_SQL_TIME">,
				<cfqueryparam value="#form.eventlocation#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#form.eventfrom#" cfsqltype="CF_SQL_DATE">,
				<cfqueryparam value="#form.eventto#" cfsqltype="CF_SQL_DATE">,
				<cfqueryparam value="#form.eventlanguage#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#form.theatres#" cfsqltype="CF_SQL_VARCHAR">								
				)
		</cfquery>
		<cfreturn local.errorarray>        
    </cffunction>
	<!--End-->

	<!--Delete events-->
	<cffunction name="deleteevents" access="remote">
		<cfargument name="id">
		<cfquery name="local.deleteevents" datasource="bookmyshow">
				DELETE 
				FROM
					events
				WHERE 
					(id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">)
		</cfquery> 
		<cflocation url="../events.cfm">
	</cffunction>
	<!--End-->

	<!--Delete theatre-->
	<cffunction name="deletetheatre" access="remote">
		<cfargument name="id">
		<cfquery name="local.deletetheatre" datasource="bookmyshow">
				DELETE 
				FROM
					theatre
				WHERE 
					(id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">)
		</cfquery> 
		<cflocation url="../theatres.cfm">
	</cffunction>
	<!--End-->

	<!--Insert to theatre table-->
	<cffunction name="addtheatres" access="remote">
		<cfargument name="theatrename">
		<cfargument name="theatreaddress">
		<cfargument name="showtime">
		<cfquery name="local.addtheatre" datasource="bookmyshow">
				INSERT INTO
					theatre (theatrename,theatreadd,showtime)
				VALUES 
					(<cfqueryparam value="#arguments.theatrename#" cfsqltype="CF_SQL_VARCHAR">,
					<cfqueryparam value="#arguments.theatreaddress#" cfsqltype="CF_SQL_VARCHAR">,
					<cfqueryparam value="#arguments.showtime#" cfsqltype="CF_SQL_VARCHAR">)
		</cfquery> 
	</cffunction>
	<!--End-->

</cfcomponent>  