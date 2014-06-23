<#assign renderUrlMax = request["render-url-maximized"]>
<#assign namespace = request["portlet-namespace"]>
<#assign date_DateObj = dateUtil.newDate(getterUtil.getLong(date.getData()))>

<h6>${dateUtil.getDate(date_DateObj, "dd MMM yyyy - HH:mm:ss", locale)}</h6>
<p>
<#if image.getSiblings()?has_content>
	<#list image.getSiblings() as cur_image>

	<img alt="Image" src="${cur_image.getData()}" border="0" align="right" />

	</#list>
</#if>
</p>
<p>${body.getData()}</p>
<p>${category.getData()}</p>