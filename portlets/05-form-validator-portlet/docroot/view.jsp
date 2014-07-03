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

<h1> AlloyUI - Form Validator </h1>

<form id="portlet05_form">
	<div class="alert alert-success hide" id="portlet05_success">Success!</div>

	<label for="portlet05_name">Name:</label>
	<input id="portlet05_name" name="portlet05_name" placeholder="Joey Bloggs" type="text"/>

	<br />

	<label for="portlet05_email">Email:</label>
	<input id="portlet05_email" name="portlet05_email" placeholder="test@liferay.com" type="text"/>

	<br />

	<label for="portlet05_date">Birthday:</label>
	<input id="portlet05_date" name="portlet05_date" placeholder="mm/dd/yyyy" type="text"/>

	<br />

	<button class="btn">Submit</button>
	<button class="btn" type="reset">Reset</button>
</form>

<aui:script>
	YUI().use (
		'aui-button',
		'aui-form-validator',
		function(Y) {
			new Y.FormValidator (
				{
					boundingBox: '#portlet05_form',
					rules: {
						portlet05_date: {
							date: true,
							required: true
						},
						portlet05_email: {
							email: true,
							required: true
						},
						portlet05_name: {
							alpha: true,
							required: true
						}
					},
					on: {
						submit: function(event) {
							Y.one('#portlet05_success').show();
							event.validator.formEvent.halt();
						}
					}
				}
			);
		}
	);
</aui:script>