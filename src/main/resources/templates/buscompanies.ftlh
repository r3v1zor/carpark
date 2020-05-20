<#include 'macros/main.ftlh'>

<@page>
    <div class="form-group row">
        <form class="form-inline" action="/buscompanies/add" method="post">
            <div class="form-group mx-sm-3 mb-2">
                <label for="companyName" class="form-control-plaintext">Название Компании</label>
                <input type="text" class="form-control" id="companyName" name="name">
            </div>
            <button type="submit" class="btn btn-primary mt-4">Добавить</button>
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
                                <form action="/buscompanies/delete" method="post">
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
</@page>

