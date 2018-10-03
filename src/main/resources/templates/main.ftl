<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
<div>
<@l.logout/>
</div>
<form action="/main" method="post" >
    <input type="text" name="text" placeholder="Введите сообщение" >
    <input type="text" name="tag" placeholder="Тэг" >
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit">Добавить</button>
</form>
<div>Фильтр</div>
<form action="/main" method="get">
    <input type="text" name="filter" value="${filter?if_exists}">
    <button type="submit">Найти</button>

</form>
<div>Список сообщений</div>
<#list messages as message>
    <div>
        <b>${message.id}</b>
        <span>${message.text}</span>
        <i>${message.tag}</i>
        <strong>${message.authorName}</strong>
    </div>
<#else >
No messages
</#list>
</@c.page>