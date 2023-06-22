<cfcomponent output="false">
	<cfset this.name="bookmyshow"/>
	<cfset this.applicationTimeout=createtimespan(0,1,0,0)/>
	<cfset this.datasource="bookmyshow"/>
	<cfset this.sessionmanagement="yes"/>
	<cfset session.username = "">
	<cfset session.userid = "">
	<cfset session.eventimages = "">
</cfcomponent>