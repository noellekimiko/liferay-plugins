<#assign renderUrlMax = request["render-url-maximized"]>
<#assign namespace = request["portlet-namespace"]>
<#assign date_DateObj = dateUtil.newDate(getterUtil.getLong(date.getData()))>

<h6>${dateUtil.getDate(date_DateObj, "dd MMM yyyy - HH:mm:ss", locale)}</h6>
<p>${body.getData()}</p>
<p>${category.getData()}</p>