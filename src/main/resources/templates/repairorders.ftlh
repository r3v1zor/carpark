<#include 'macros/main.ftlh'>

<@page>
    <#include 'macros/admin-bar.ftlh'>
    <@page>
    </@page>
    <div class="container">
        <div>
            <form method="post" action="/repair-orders/add">
                <div class="form-row">
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
                        <label for="repairCompany">Ремонтная компания</label>
                        <select required id="repairCompany" name="repairCompany">
                            <#list repairCompanies as company>
                                <option value="${company.id}">${company.name}</option>
                            </#list>
                        </select>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Добавить</button>
            </form>
        </div>

        <div>
            <h3>Запросы на ремонт:</h3>
            <#if repairOrders?size != 0>
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">Автобус</th>
                        <th scope="col">Компания</th>
                        <th scope="col">#</th>
                        <th scope="col">#</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list repairOrders as order>
                        <tr id="tr-${order.id}">
                            <td>${order.bus.registrationNumber}</td>
                            <td>${order.repairCompany.name}</td>
                            <td><button class="btn btn-primary btn-sm" onclick="updateRepairOrders(${order.id}, '${order.bus.registrationNumber}', '${order.repairCompany.name}')">Обновить</button></td>
                            <td>
                                <form action="/repair-orders/delete" method="post">
                                    <input type="hidden" value="${order.id}" name="id">
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
        function updateRepairOrders(id, busNum, companyName) {
            let row = document.getElementById('tr-' + id)

            row.innerHTML = '<form id="my-form" method="post" action="/repair-orders/add">' +
                '<input form="my-form" type="hidden" value="' + id + '" name="id">' +
                '<td><input form="my-form" type="text" class="form-control" id="firstName" name="firstName" value="' + firstName +'"></td>' +
                '<td><input form="my-form" type="text" class="form-control" id="lastName" name="lastName" value="' + lastName + '"></td>' +
                '<td><input form="my-form" type="date" class="form-control" id="dateOfBirth" name="dateOfBirth"></td>' +
                '<td><input form="my-form" type="date" class="form-control" id="startWorkingDay" name="startWorkingDay"></td>' +
                '<td><button form="my-form" class="btn btn-primary btn-sm" type="submit">Обновить</button></td>' +
                '<td>' +
                '<form action="/repair-orders/delete" method="post">' +
                '<input type="hidden" value="' + id +'" name="id">' +
                '<button type="submit" class="btn btn-primary btn-sm">Удалить</button>' +
                '</form>' +
                '</td>'
        }

    </script>
</@page>


