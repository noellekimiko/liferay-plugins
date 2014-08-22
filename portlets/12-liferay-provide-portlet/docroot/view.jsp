<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<h1>AlloyUI - Liferay.provide()</h1>

<aui:form action="" method="post" name="fm" onSubmit='<%= "event.preventDefault(); portlet12_generateOutput();" %>'>
	<aui:input name="name" />

	<aui:input name="email">
		<aui:validator name="email" />
		<aui:validator name="required" />
	</aui:input>

	<aui:input name="birthday" type="text">
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
		<aui:button type="submit" />
		<aui:button value="reset" />
	</aui:button-row>

	<aui:fieldset cssClass="hide" id="output">
		<div id="portlet12_message"></div>
	</aui:fieldset>
</aui:form>

<aui:script>
	// Create generated output

	Liferay.provide(
		window,
		'portlet12_generateOutput',
		function() {
			var A = AUI();

			var messageNode = A.one('#portlet12_message');

			var date = A.one('#<portlet:namespace />birthday');
			var email = A.one('#<portlet:namespace />email');
			var name = A.one('#<portlet:namespace />name');
			var outputNode = A.one('#<portlet:namespace />output');

			var messageString = 'My name is ' + name.val() + ' and my email address is ' + email.val() + '. My birthday is ' + date.val() + '.';

			messageNode.setHTML(messageString);

			outputNode.show();
		},
		['aui-node']
	);
</aui:script>