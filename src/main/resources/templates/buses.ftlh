<#include 'macros/main.ftlh'>

<@page>
    <div>
        <form action="buses/add" method="post">
            <p>Автобусная компания:
                <select name="busCompany">
                    <#list busCompanies as busCompany>
                        <option value="${busCompany.id}">${busCompany.name}</option>
                    </#list>
                </select>
            </p>

            <p>Марка: <input type="text" name="mark"/></p>
            <p>Регистрационный номер: <input type="text" name="registrationNumber"/></p>
            <p>Последний ремонт: <input type="date" name="dateOfLastRepair"/></p>
            <p><button type="submit">Добавить</button></p>
        </form>
    </div>

    <div>
        <h3>Drivers:</h3>
        <#list buses as bus>
            <div id="div:${bus.id}">
                Автобусная компания: ${bus.busCompany.name}
                Марка: ${bus.mark}
                Регистрационный номер: ${bus.registrationNumber}
                <form action="/buses/delete" method="post">
                    <input type="hidden" value="${bus.id}" name="id">
                    <button type="submit">X</button>
                </form>
                <button onclick="update(${bus.id}, ${bus.busCompany.id}, ${bus.mark}, ${bus.registrationNumber})">Update</button>
            </div>
        </#list>
    </div>

    <script>
        function update(id, busCompanyId, mark, registrationNumber) {
            let row = document.getElementById('div:' + id)
            <#assign busCompanyId>busCompanyId</#assign>

            row.innerHTML = '<form action="/buses/add" method="post">' +
                '<input type="hidden" name="id" value="' + id +'">' +
                '<p>Автобусная компания:' +
                '<select name="busCompany">' +
                '<#list busCompanies as busCompany>' +
                '<option value="${busCompany.id}">${busCompany.name}</option>' +
                '</#list>' +
                '</select>' +
                '</p>' +
                '<p>Марка: <input type="text" name="mark" value="' + mark +'"/></p>' +
                '<p>Регистрационный номер: <input type="text" name="registrationNumber" value="' + registrationNumber +'"/></p>'+
                '<p>Последний ремонт: <input type="date" name="dateOfLastRepair"/></p>'+
                '<p><button type="submit">Обновить</button></p>'+
                '</form>'
        }

    </script>
</@page>

