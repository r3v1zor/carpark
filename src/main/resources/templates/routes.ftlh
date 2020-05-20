<#include 'macros/main.ftlh'>

<@page>
    <#include 'macros/admin-bar.ftlh'>
    <@page>
    </@page>
    <div class="container">
        <form action="/routes/add" method="post">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label> Название маршрута: </label>
                    <input required type="text" class="form-control" name="name"/>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Добавить</button>
        </form>
        <#if routes?size != 0>
            <div class="form-group row">
                <form class="form-inline" action="/routes/addBusStop" method="post">
                    <div class="form-group mx-sm-3 mb-2">
                        <label for="route" class="form-control-plaintext">Название маршрута</label>
                        <select required class="form-control" name="route">
                            <#list routes as route>
                                <option value="${route.id}">${route.name}</option>
                            </#list>
                        </select>
                    </div>
                    <div class="form-group mx-sm-3 mb-2">
                        <label for="route" class="form-control-plaintext">Автобусная остановка</label>
                        <select required class="form-control" name="busStop">
                            <#list busStops as busStop>
                                <option value="${busStop.id}">${busStop.name}</option>
                            </#list>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Добавить</button>
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
                        <td><button class="btn btn-primary btn-sm" onclick="updateRoute(${route.id}, '${route.name}')">Обновить</button></td>
                        <td>
                            <form action="/busstops/delete" method="post">
                                <input type="hidden" value="${route.id}" name="id">
                                <button type="submit" class="btn btn-primary btn-sm">Удалить</button>
                            </form>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>


        </div>
    </div>
    <script>
        function updateRoute(id, name) {
            let row = document.getElementById('div-' + id)

            row.innerHTML = '<form action="/routes/add" method="post">' +
                '<p>Название компании: <input type="text" name="name" value="' + name + '"/></p>' +
                '<p><button type="submit">Обновить</button></p>' +
                '</form>'
        }

    </script>
</@page>

