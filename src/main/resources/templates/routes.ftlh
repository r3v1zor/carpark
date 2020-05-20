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

    <#if routes?size != 0>
        <div class="form-group row">
            <form class="form-inline" action="/routes/addBusStop" method="post">
                <div class="form-group mx-sm-3 mb-2">
                    <label for="route" class="form-control-plaintext">Название маршрута</label>
                    <select class="form-control" name="route">
                        <#list routes as route>
                            <option value="${route.id}">${route.name}</option>
                        </#list>
                    </select>
                </div>
                <div class="form-group mx-sm-3 mb-2">
                    <label for="route" class="form-control-plaintext">Автобусная остановка</label>
                    <select class="form-control" name="busStop">
                        <#list busStops as busStop>
                            <option value="${busStop.id}">${busStop.name}</option>
                        </#list>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary mt-4">Добавить</button>
            </form>
        </div>
    </#if>


    <div>
        <h3>Routes:</h3>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">Название маршрута</th>
                <th scope="col">Остановки</th>
                <th scope="col">#</th>
                <th scope="col">#</th>
            </tr>
            </thead>
            <tbody>
            <#list routes as route>
                <tr id="tr-${route.id}">
                    <td>${route.name}</td>
                    <td>
                        <#list route.busStops as busStop>
                            <p>${busStop.name}</p>
                        </#list>
                    </td>
                    <td><button class="btn btn-primary btn-sm" onclick="updateBusStops(${busStop.id}, '${busStop.name}', '${busStop.address}')">Обновить</button></td>
                    <td>
                        <form action="/busstops/delete" method="post">
                            <input type="hidden" value="${busStop.id}" name="id">
                            <button type="submit" class="btn btn-primary btn-sm">Удалить</button>
                        </form>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>


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

