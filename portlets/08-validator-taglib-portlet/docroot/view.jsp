<%
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<h1>AlloyUI - Validator Taglib</h1>

<aui:form action="" method="post" name="fm">
	<aui:input name="name" />

	<aui:input name="email">
		<aui:validator name="email" />
		<aui:validator name="required" />
	</aui:input>

	<aui:input name="birthday" type ="text">
		<aui:validator name="date" />
		<aui:validator name="required" />
	</aui:input>

	<aui:input label="password" name="password1" />

	<aui:input label="enter-again" name="password2">
		<aui:validator name="equalTo">
			'#<portlet:namespace />password1'
		</aui:validator>
	</aui:input>
	<aui:button-row>
		<aui:button onClick='<%= "portlet08_getContent();" %>' type="submit" />
		<aui:button value="reset" />
	</aui:button-row>
</aui:form>

<aui:script>
	function portlet08_getContent() {
		return window.<portlet:namespace />editor.getHTML();
	}
</aui:script>