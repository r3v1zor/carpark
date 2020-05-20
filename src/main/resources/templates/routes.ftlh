<#include 'macros/main.ftlh'>

<@page>
    <#include 'macros/admin-bar.ftlh'>
    <@page>
    </@page>
    <div class="container">
        <div>
            <form action="/routes/add" method="post">
                <p>Название маршрута:
                    <input required type="text" name="name"/>
                </p>
                <p><button type="submit">Добавить</button></p>
            </form>
        </div>

        <div>
            <form action="/routes/addbusstop" method="post">
                <select><#list busStops as busStop><option value=""></option></#list></select>
                <p><button type="submit">Добавить</button></p>
            </form>
        </div>

        <div>
            <h3>Bus Companies:</h3>
            <#list routes as route>
                <div id="div-${route.id}">
                    Название маршрута: ${route.name}
                    Остановки:
                    <#list route.busStops as busStop>
                        <div id="r-${route.id}-bs-${busStop.id}">
                            Название: ${busStop.name}
                            <form action="/routes/deleteBusStop" method="post">
                                <input type="hidden" name="routeId" value="${route.id}">
                                <input type="hidden" name="busStopId" value="${busStop.id}">
                                <button type="submit">X</button>
                            </form>
                        </div>
                    </#list>
                    <form action="/routes/delete" method="post">
                        <input type="hidden" value="${route.id}" name="id">
                        <button type="submit">X</button>
                    </form>
                    <button onclick="update(${route.id}, ${route.name})">Update</button>
                </div>
            </#list>
        </div>
    </div>
    <script>
        function update(id, name) {
            let row = document.getElementById('div-' + id)

            row.innerHTML = '<form action="/routes/add" method="post">' +
                '<p>Название компании: <input type="text" name="name" value="' + name + '"/></p>' +
                '<p><button type="submit">Обновить</button></p>' +
                '</form>'
        }

    </script>
</@page>

