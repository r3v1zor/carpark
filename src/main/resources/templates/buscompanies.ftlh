<#include 'macros/main.ftlh'>

<@page>
    <#include 'macros/admin-bar.ftlh'>
    <@page>
    </@page>
    <div class="container">
        <div class="form-group row">
            <form class="form-inline" action="/bus-companies/add" method="post">
                <div class="form-group mx-sm-3">
                    <label for="companyName" class="form-control-plaintext">Название компании</label>
                    <input required type="text" class="form-control" id="companyName" name="name">
                </div>
                <div class="container">
                    <button type="submit" class="btn btn-primary mt-4">Добавить</button>
                </div>
            </form>
        </div>

        <div>
            <h3>Bus Companies:</h3>
            <#if busCompanies?size != 0>
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">Название компании</th>
                        <th scope="col">#</th>
                        <th scope="col">#</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list busCompanies as busCompany>
                        <tr id="tr-${busCompany.id}">
                            <td>${busCompany.name}</td>
                            <td><button class="btn btn-primary btn-sm" onclick="update(${busCompany.id}, '${busCompany.name}')">Обновить</button></td>
                            <td>
                                <form action="/bus-companies/delete" method="post">
                                    <input type="hidden" value="${busCompany.id}" name="id">
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
</@page>

<script>
    function update(id, busCompanyName) {
        let row = document.getElementById('tr-' + id)

        row.innerHTML = '<form id="my-form" action="/bus-companies/add" method="post"></form>' +
            '<td><input type="text" form="my-form" name="name" value="' + busCompanyName +'"></td>' +
            '<td><input type="hidden" form="my-form" value="' + id +'" name="id">' +
            '<button type="submit" form="my-form" class="btn btn-primary btn-sm">Обновить</button>' +
            '</td>' +
            '' +
            '<td>' +
            '<form action="/bus-companies/delete" method="post">' +
            '<input type="hidden" value="' + id +'" name="id">' +
            '<button type="submit" class="btn btn-primary btn-sm">Удалить</button>' +
            '</form>' +
            '</td>'
    }
</script>