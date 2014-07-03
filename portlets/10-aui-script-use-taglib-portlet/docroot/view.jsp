<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<h1>AlloyUI - AUI Script Use Taglib</h1>

<aui:form action="" method="post" name="fm">
	<aui:input name="name" />
</aui:form>

<aui:script use="aui-node">
	console.log(A.one('#<portlet:namespace />name'));
</aui:script>