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

<h1> AlloyUI - Node </h1>

<div id="portlet01_foo">
	I am a foo element.
</div>

<aui:script use="aui-node">

	var foo = A.one('#portlet01_foo');

	var node = A.Node.create('<div>  </div>');

	node.setStyle('background', 'black');
	node.setStyle('color', 'white');

	node.setHTML('I am a bar element');

	foo.append(node);
</aui:script>