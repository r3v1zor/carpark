<#include 'macros/main.ftlh'>

<@page>
    <div>
        <form method="post" action="/drivers/add">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="firstName">Фамилия</label>
                    <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Фамилия">
                </div>
                <div class="form-group col-md-6">
                    <label for="lastName">Имя</label>
                    <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Имя">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="dateOfBirth">Дата рождения</label>
                    <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" placeholder="Дата рождения">
                </div>
                <div class="form-group col-md-6">
                    <label for="startWorkingDay">День трудоустройства</label>
                    <input type="date" class="form-control" id="startWorkingDay" name="startWorkingDay" placeholder="Начал работать с">
                </div>
            </div>

            <button type="submit" class="btn btn-primary">Добавить</button>
        </form>
    </div>

    <div>
        <h3>Таблица водителей:</h3>
        <#if drivers?size != 0>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Фамилия</th>
                    <th scope="col">Имя</th>
                    <th scope="col">Дата рождения</th>
                    <th scope="col">День трудоустройства</th>
                    <th scope="col">#</th>
                    <th scope="col">#</th>
                </tr>
                </thead>
                <tbody>
                <#list drivers as driver>
                    <tr id="tr-${driver.id}">
                        <td>${driver.firstName}</td>
                        <td>${driver.lastName}</td>
                        <td>${driver.dateOfBirth}</td>
                        <td>${driver.startWorkingDay}</td>
                        <td><button class="btn btn-primary btn-sm" onclick="updateDrivers(${driver.id}, '${driver.firstName}', '${driver.lastName}')">Обновить</button></td>
                        <td>
                            <form action="/drivers/delete" method="post">
                                <input type="hidden" value="${driver.id}" name="id">
                                <button type="submit" class="btn btn-primary btn-sm">Удалить</button>
                            </form>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </#if>
    </div>

    <script>
        function updateDrivers(id, firstName, lastName) {
            let row = document.getElementById('tr-' + id)

            row.innerHTML = '<form id="my-form" method="post" action="/drivers/add">' +
                            '<input form="my-form" type="hidden" value="' + id + '" name="id">' +
                            '<td><input form="my-form" type="text" class="form-control" id="firstName" name="firstName" value="' + firstName +'"></td>' +
                            '<td><input form="my-form" type="text" class="form-control" id="lastName" name="lastName" value="' + lastName + '"></td>' +
                            '<td><input form="my-form" type="date" class="form-control" id="dateOfBirth" name="dateOfBirth"></td>' +
                            '<td><input form="my-form" type="date" class="form-control" id="startWorkingDay" name="startWorkingDay"></td>' +
                            '<td><button form="my-form" class="btn btn-primary btn-sm" type="submit">Обновить</button></td>' +
                            '<td>' +
                                '<form action="/drivers/delete" method="post">' +
                                    '<input type="hidden" value="' + id +'" name="id">' +
                                    '<button type="submit" class="btn btn-primary btn-sm">Удалить</button>' +
                                '</form>' +
                            '</td>'
        }

    </script>
</@page>


