<#assign renderUrlMax = request["render-url-maximized"]>
<#assign namespace = request["portlet-namespace"]>
<#assign date_DateObj = dateUtil.newDate(getterUtil.getLong(date.getData()))>

<h6>${dateUtil.getDate(date_DateObj, "dd MMM yyyy - HH:mm:ss", locale)}</h6>
<a href="${URL.getData()}"> ${URL.getData()}</a>
<p>${category.getData()}</p>