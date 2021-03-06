<cfoutput>
	<cfscript>
		request.fieldslist = "";
		include "/models/services/global/functions.cfm";
	</cfscript>

	<cffunction name="getFieldVal">
		<cfargument name="name">
		<cftry>
			<cfreturn formStruct[arguments.name]>
			<cfcatch>
				<cfreturn "">
			</cfcatch>
		</cftry>
	</cffunction>

	<cfset request.inputNum = 0>
	<cffunction name="inputId">
		<cfset request.inputNum++>
		<cfreturn NumberFormat(request.inputNum,"000")>
	</cffunction>

	<!--- Initialize Shortcode plugins --->
	<cfinclude template="/views/plugins/plugins-register.cfm">

</cfoutput>
