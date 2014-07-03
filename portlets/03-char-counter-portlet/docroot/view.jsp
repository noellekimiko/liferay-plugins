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

<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<h1> AlloyUI - Char Counter </h1>
<input id="portlet03_charInput" type="text">
<span id="portlet03_counter"></span> character(s) remaining

<aui:script>
	YUI().use(
		'aui-char-counter',
		function(Y) {
			new Y.CharCounter(
				{
					counter: '#portlet03_counter',
					input: '#portlet03_charInput',
					maxLength: 10
				}
			);
		}
	);
</aui:script>