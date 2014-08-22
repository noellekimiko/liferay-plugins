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

<h1>AlloyUI - Taglib</h1>

<aui:form action="" method="post" name="fm">
	<aui:input name="name" />

	<aui:input name="email" />

	<aui:fieldset>
		<aui:select label="maximum-activities-to-display" name="preferences--max--">
			<aui:option label="1" />
			<aui:option label="2" />
			<aui:option label="3" />
			<aui:option label="4" />
			<aui:option label="5" />
			<aui:option label="10" />
			<aui:option label="15" />
			<aui:option label="20" />
		</aui:select>
	</aui:fieldset>

	<aui:button-row>
		<aui:button type="submit" />
		<aui:button value="reset" />
	</aui:button-row>
</aui:form>