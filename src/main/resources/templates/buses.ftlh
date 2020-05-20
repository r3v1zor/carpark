<#include 'macros/main.ftlh'>

<@page>
    <div>
        <form method="post" action="/buses/add">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="busCompany">Автобусная компания</label>
                    <select class="form-control" name="busCompany">
                        <#list busCompanies as busCompany>
                            <option value="${busCompany.id}">${busCompany.name}</option>
                        </#list>
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="mark">Марка</label>
                    <input type="text" class="form-control" id="mark" name="mark" placeholder="Марка">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="registrationNumber">Регистрационный номер</label>
                    <input type="text" class="form-control" id="registrationNumber" name="registrationNumber" placeholder="Регистрационный номер">
                </div>
                <div class="form-group col-md-6">
                    <label for="dateOfLastRepair">Дата последнего ремонта</label>
                    <input type="date" class="form-control" id="dateOfLastRepair" name="dateOfLastRepair" placeholder="Дата последнего ремонта">
                </div>
            </div>

            <button type="submit" class="btn btn-primary">Добавить</button>
        </form>
    </div>

    <div>
        <h3>Buses:</h3>
        <#if buses?size != 0>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Автобусная компания</th>
                    <th scope="col">Марка</th>
                    <th scope="col">Регистрационный номер</th>
                    <th scope="col">Дата последнего ремонта</th>
                    <th scope="col">#</th>
                    <th scope="col">#</th>
                </tr>
                </thead>
                <tbody>
                <#list buses as bus>
                    <tr id="tr-${bus.id}">
                        <td>${bus.busCompany.name}</td>
                        <td>${bus.mark}</td>
                        <td>${bus.registrationNumber}</td>
                        <td>${bus.dateOfLastRepair}</td>
                        <td><button class="btn btn-primary btn-sm" onclick="updateBuses(${bus.id}, ${bus.busCompany.id}, '${bus.mark}', '${bus.registrationNumber}')">Обновить</button></td>
                        <td>
                            <form action="/drivers/delete" method="post">
                                <input type="hidden" value="${bus.id}" name="id">
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
        function updateBuses(id, busCompanyId, mark, registrationNumber) {
            let row = document.getElementById('tr-' + id)
            <#assign busCompanyId>busCompanyId</#assign>

            row.innerHTML = '<form id="my-form" action="/buses/add" method="post">' +
                            '<input form="my-form" type="hidden" name="id" value="' + id + '">' +
                            '<td>' +
                                '<select form="my-form" class="form-control" name="busCompany">' +
                                    '<#list busCompanies as busCompany>' +
                                    '   <option <#if busCompany.id == busCompanyId>selected</#if> value="${busCompany.id}">${busCompany.name}</option>' +
                                    '</#list>' +
                                '</select>' +
                            '</td>' +
                            '<td><input form="my-form" type="text" class="form-control" id="mark" name="mark" value="' + mark + '"></td>' +
                            '<td><input form="my-form" type="text" class="form-control" id="registrationNumber" name="registrationNumber" value="' + registrationNumber +'"></td>' +
                            '<td><input form="my-form" type="date" class="form-control" id="dateOfLastRepair" name="dateOfLastRepair"></td>' +
                            '<td><button form="my-form" type="submit" class="btn btn-primary btn-sm">Обновить</button></td>' +
                            '<td>' +
                                '<form action="/drivers/delete" method="post">' +
                                '<input type="hidden" value="" name="id">' +
                                '<button type="submit" class="btn btn-primary btn-sm">Удалить</button>' +
                                '</form>' +
                            '</td>'
        }

    </script>
</@page>

