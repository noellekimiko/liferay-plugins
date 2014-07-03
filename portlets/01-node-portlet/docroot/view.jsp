<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<h1> AlloyUI - Node </h1>

<div id="portlet01_foo">
	I am a foo element.
</div>

<aui:script>
	YUI().use(
		'aui-node',
		function(Y) {
			var foo = Y.one('#portlet01_foo');
			var node = Y.Node.create('<div />');

			node.setStyles(
				{
					background: '#000',
					color: '#FFF'
				}
			);

			node.setHTML('I am a bar element');

			foo.append(node);
		}
	);
</aui:script>