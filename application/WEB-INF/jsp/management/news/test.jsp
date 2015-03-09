<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>

<form action="/management/news!test.do" method="post">

<c:forEach begin="0" end="9" varStatus="s">
	<input type="text" name="attr.a${s.index}" class="textInput" value="${s.index}"/>
</c:forEach>
<input type="text" name="attr.key1" value="aaa"/>
<input type="text" name="attr['key2']" value="bbb"/>


<input type="text" name="strs" value="1"/><!-- 测试直接支持, 会自动重新初始化strs -->
<input type="text" name="strs" value="2"/>
<input type="text" name="strs" value="3"/>

<input type="text" name="strs[5]" value="strs[5]"/><!-- 测试有方括号时action中必须先初始化strs -->
<input type="text" name="strs[6]" value="strs[6]"/>

<input type="text" name="strs[]" value="strs[]"/><!-- 测试不支持 -->

<input type="text" name="dwz.attr.key1" value="dwz"/>
<button type="submit">Save</button>

</form>

<p>key1 = ${attr["key1"]}</p>
<p>key2 = ${attr["key2"]}</p>
<p>strs.length: ${fn:length(strs)}</p>
<c:forEach begin="0" end="9" varStatus="s">
	<p>strs[${s.index}] = ${strs[s.index]}</p>
</c:forEach>
<c:forEach begin="0" end="9" varStatus="s">
	<c:set var="key" value="a${s.index}"></c:set>
	<p>${key} = ${attr[key]}</p>
</c:forEach>

<p>${param["dwz.attr.key1"] }</p>
proxy.namespace: ${proxy.namespace}<br/>
proxy.actionName: ${proxy.actionName}<br/>
proxy.method: ${proxy.method}