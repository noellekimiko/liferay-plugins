<#assign renderUrlMax = request["render-url-maximized"]>
<#assign namespace = request["portlet-namespace"]>
<#assign readmore = request.parameters?is_hash && getterUtil.getBoolean(request.parameters.read_more, false)>
<h1>${title.getData()}</h1>
<h6>${date.getData()}</h6>
<#if readmore>
<p>${body.getData()}</p>
<p>${category.getData()}</p>
<#else>
<a href="${renderUrlMax}&${namespace}read_more=true">Read More</a>
</#if>