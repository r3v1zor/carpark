<#include 'macros/main.ftlh'>

<@page>
    <#include 'macros/admin-bar.ftlh'>
    <@page>
    </@page>
    <div class="container">
        <div class="form-group row">
            <form class="form-inline" action="/busstops/add" method="post">
                <div class="form-group mx-sm-3 mb-2">
                    <label for="busStopName" class="form-control-plaintext">Название остановки</label>
                    <input type="text" class="form-control" id="busStopName" name="name">
                </div>

                <div class="form-group mx-sm-3 mb-2">
                    <label for="busStopAddress" class="form-control-plaintext">Адрес остановки</label>
                    <input type="text" class="form-control" id="busStopAddress" name="address">
                </div>

                <button type="submit" class="btn btn-primary mt-4">Добавить</button>
            </form>
        </div>

        <div>
            <h3>Автобусные остановки:</h3>

            <#if busStops?size != 0>
                <div>
                    <h3>Bus Stops:</h3>
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">Название остановки</th>
                            <th scope="col">Адрес</th>
                            <th scope="col">#</th>
                            <th scope="col">#</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list busStops as busStop>
                            <tr id="tr-${busStop.id}">
                                <td>${busStop.name}</td>
                                <td>${busStop.address}</td>
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
            </#if>
        </div>
    </div>
    <script>
        function updateBusStops(id, name, address) {
            let row = document.getElementById('tr-' + id)

            row.innerHTML = '<form id="my-form" action="/busstops/add" method="post"></form>' +
                '<input form="my-form" type="hidden" name="id" value="' + id + '">' +
                '<td><input form="my-form" type="text" class="form-control" id="busStopName" name="name" value="' + name + '"></td>' +
                '<td><input form="my-form" type="text" class="form-control" id="busStopAddress" name="address" value="' + address + '"></td>' +
                '<td><button form="my-form" type="submit" class="btn btn-primary btn-sm">Обновить</button></td>' +
                '<td>' +
                '<form action="/busstops/delete" method="post">' +
                '<input type="hidden" value="' + id + '" name="id">' +
                '<button type="submit" class="btn btn-primary btn-sm">Удалить</button>' +
                '</form>' +
                ' </td>'
        }

    </script>
</@page>

