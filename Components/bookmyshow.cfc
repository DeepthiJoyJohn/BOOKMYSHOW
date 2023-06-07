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
    <cffunction name="createcontact" access="public">
        <cfargument name="form"> 
        <cfset local.filename="">
        <cfif isDefined("form.photo") AND evaluate("form.photo") NEQ "" >
            <cffile action="upload" fileField="form.photo" destination="C:\Pictures" 
            accept="image/png,image/jpg,image/gif,image/jpeg"  
            nameconflict="makeunique">
            <cfset local.filename="#cffile.serverdirectory#/#cffile.serverfile#">            
   	    </cfif> 
		<cfset local.errorarray=ArrayNew(1)>
		<cfset local.flag="true"> 		
   	    <cfif form.title EQ "">
			<cfset ArrayAppend(local.errorarray, "titlemssg")> 
			<cfset local.flag="false"> 
		</cfif>
   	    <cfif form.firstname EQ "">   	    	
   	    	<cfset ArrayAppend(local.errorarray, "firstnamemssg")> 
			<cfset local.flag="false"> 
		</cfif> 
   	    <cfif form.lastname EQ "">
   	    	<cfset ArrayAppend(local.errorarray, "lastnamemssg")> 
			<cfset local.flag="false"> 
		</cfif>
   	    <cfif form.gender EQ "">
   	    	<cfset ArrayAppend(local.errorarray, "gendermssg")>
			<cfset local.flag="false">  
		</cfif>
   	    <cfif form.dob EQ "">
   	    	<cfset ArrayAppend(local.errorarray, "dobmssg")>
			<cfset local.flag="false">  
		</cfif>
   	    <cfif form.address EQ "">
   	    	<cfset ArrayAppend(local.errorarray, "addressmssg")>
			<cfset local.flag="false">  
		</cfif>
   	    <cfif form.street EQ "">
   	    	<cfset ArrayAppend(local.errorarray, "streetmssg")> 
			<cfset local.flag="false"> 
	    </cfif>
   	    <cfif form.email EQ "">
   	    	<cfset ArrayAppend(local.errorarray, "emailmssg")> 
		</cfif>
   	    <cfif form.phone EQ "">   	   
   	    	<cfset ArrayAppend(local.errorarray, "phonemssg")> 
			<cfset local.flag="false"> 
   	    </cfif>
   	   <cfif session.userid neq "" && local.flag neq "false">  	        
	        <cfquery name="local.createcontact" datasource="addressbook">
	            INSERT INTO 
					contactdetails (title,firstname,lastname,gender,dob,photo,address,
	            	street,email,phone,createdby) 
				VALUES
					(
					<cfqueryparam value="#form.title#" cfsqltype="CF_SQL_VARCHAR">,
					<cfqueryparam value="#form.firstname#" cfsqltype="CF_SQL_VARCHAR">,
					<cfqueryparam value="#form.lastname#" cfsqltype="CF_SQL_VARCHAR">,
					<cfqueryparam value="#form.gender#" cfsqltype="CF_SQL_VARCHAR">,
					<cfqueryparam value="#form.dob#" cfsqltype="CF_SQL_VARCHAR">,
					<cfqueryparam value="#local.filename#" cfsqltype="CF_SQL_VARCHAR">,
					<cfqueryparam value="#form.address#" cfsqltype="CF_SQL_VARCHAR">,
					<cfqueryparam value="#form.street#" cfsqltype="CF_SQL_VARCHAR">,
					<cfqueryparam value="#form.email#" cfsqltype="CF_SQL_VARCHAR">,
					<cfqueryparam value="#form.phone#" cfsqltype="CF_SQL_VARCHAR">,
					<cfqueryparam value="#session.userid#" cfsqltype="CF_SQL_INTEGER">
	           		 )
	        </cfquery>
		</cfif>
		<cfreturn local.errorarray>        
    </cffunction>
    <cffunction name="updatecontact" access="public">
        <cfargument name="form"> 
        <cfset local.filename="#form.photopath#">
        <cfif isDefined("form.photo") AND evaluate("form.photo") NEQ "" >
            <cffile action="upload" fileField="form.photo" destination="C:\Pictures" 
            accept="image/png,image/jpg,image/gif,image/jpeg"  
            nameconflict="makeunique">
            <cfset local.filename="#cffile.serverdirectory#/#cffile.serverfile#">		
   	    </cfif>
        <cfquery name="local.updatecontact" datasource="addressbook">
            UPDATE 
				contactdetails 
			SET 
				title=<cfqueryparam value="#form.title#" cfsqltype="CF_SQL_VARCHAR">,
            	firstname=<cfqueryparam value="#form.firstname#" cfsqltype="CF_SQL_VARCHAR">,
            	lastname=<cfqueryparam value="#form.lastname#" cfsqltype="CF_SQL_VARCHAR">,
            	gender=<cfqueryparam value="#form.gender#" cfsqltype="CF_SQL_VARCHAR">,
            	dob=<cfqueryparam value="#form.dob#" cfsqltype="CF_SQL_DATE">,				
            	photo=<cfqueryparam value="#local.filename#" cfsqltype="CF_SQL_VARCHAR">,				
            	address=<cfqueryparam value="#form.address#" cfsqltype="CF_SQL_VARCHAR">,
            	street=<cfqueryparam value="#form.street#" cfsqltype="CF_SQL_VARCHAR">,
            	email=<cfqueryparam value="#form.email#" cfsqltype="CF_SQL_VARCHAR">,
            	phone=<cfqueryparam value="#form.phone#" cfsqltype="CF_SQL_VARCHAR"> 
			WHERE 
				id=<cfqueryparam value="#form.id#" cfsqltype="CF_SQL_INTEGER">          
        </cfquery>
    </cffunction>
    <cffunction name="delete" access="remote">                 
        <cfquery name="local.delete" datasource="addressbook">
			UPDATE 
				contactdetails 
			SET 
				flag="INACTIVE" 
			WHERE 
				id=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
        <cflocation url="../listing.cfm" addtoken="false">
    </cffunction>
	<cffunction name="selectcontacts" access="public"> 
		<cfquery name="local.selectcontacts" datasource="addressbook"> 
	       SELECT firstname,email,phone 
	       FROM contactdetails where createdby="#session.userid#" AND flag ="ACTIVE"
		</cfquery> 
		<cfreturn local.selectcontacts>
	</cffunction>
</cfcomponent>  