<#include 'macros/main.ftlh'>

<@page>
    <#include 'macros/admin-bar.ftlh'>
    <@page>
    </@page>
    <div class="container">
        <div>
            <form method="post" action="/voyages/add">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="driver">Водитель</label>
                        <select required id="driver" name="driver">
                            <#list drivers as driver>
                                <option value="${driver.id}">${driver.lastName + " " + driver.firstName}</option>
                            </#list>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="bus">Автобус</label>
                        <select required id="bus" name="bus">
                            <#list buses as bus>
                                <option value="${bus.id}">${bus.registrationNumber}</option>
                            </#list>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="route">Маршрут</label>
                        <select required id="route" name="route">
                            <#list routes as route>
                                <option value="${route.id}">${route.name}</option>
                            </#list>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="voyageDate">Дата рейса</label>
                        <input required type="date" class="form-control" id="voyageDate" name="voyageDate" placeholder="Введите дату">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Добавить</button>
            </form>
        </div>

        <div>
            <h3>Рейсы:</h3>
            <#if voyages?size != 0>
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">Водитель</th>
                        <th scope="col">Автобус</th>
                        <th scope="col">Маршрут</th>
                        <th scope="col">Дата рейса</th>
                        <th scope="col">#</th>
                        <th scope="col">#</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list voyages as voyage>
                        <tr id="tr-${voyage.id}">
                            <td>${voyage.driver.lastName}</td>
                            <td>${voyage.bus.registrationNumber}</td>
                            <td>${voyage.route.name}</td>
                            <td>${voyage.voyageDate}</td>
                            <td><button class="btn btn-primary btn-sm" onclick="updateVoyages(${voyage.id},
                                        '${voyage.driver.lastName}','${voyage.driver.firstName}','${voyage.bus.registrationNumber}',
                                        '${voyage.route.name}', '${voyage.voyageDate}')">
                                    Обновить</button></td>
                            <td>
                                <form action="/voyages/delete" method="post">
                                    <input type="hidden" value="${voyage.id}" name="id">
                                    <button type="submit" class="btn btn-primary btn-sm">Удалить</button>
                                </form>
                            </td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </#if>
        </div>
    </div>
    <script>
        function updateVoyages(id, lastName, firstName, busNum, routeName, date) {
            let row = document.getElementById('tr-' + id)

            row.innerHTML = '<form id="my-form" method="post" action="/voyages/add">' +
                '<input form="my-form" type="hidden" value="' + id + '" name="id">' +
                '<td><input form="my-form" type="text" class="form-control" id="firstName" name="firstName" value="' + firstName +'"></td>' +
                '<td><input form="my-form" type="text" class="form-control" id="lastName" name="lastName" value="' + lastName + '"></td>' +
                '<td><input form="my-form" type="date" class="form-control" id="dateOfBirth" name="dateOfBirth"></td>' +
                '<td><input form="my-form" type="date" class="form-control" id="startWorkingDay" name="startWorkingDay"></td>' +
                '<td><button form="my-form" class="btn btn-primary btn-sm" type="submit">Обновить</button></td>' +
                '<td>' +
                '<form action="/voyages/delete" method="post">' +
                '<input type="hidden" value="' + id +'" name="id">' +
                '<button type="submit" class="btn btn-primary btn-sm">Удалить</button>' +
                '</form>' +
                '</td>'
        }

    </script>
</@page>


