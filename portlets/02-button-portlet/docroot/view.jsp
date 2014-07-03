<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<h1> AlloyUI - Button </h1>

<div id="portlet02_foo">
	I am a foo button
</div>

<aui:script>
	YUI().use(
		'aui-button',
		function(Y) {
			new Y.Button (
				{
					on: {
						click: function(event) {
							alert('You have clicked the button');
						}
					},
					srcNode: '#portlet02_foo'
				}
			).render();
		}
	);
</aui:script>