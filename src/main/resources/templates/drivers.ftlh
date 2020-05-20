<#include 'macros/main.ftlh'>

<@page>
    <div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="firstName">FirstName</label>
                <input type="text" class="form-control" id="firstName" placeholder="FirstName">
            </div>
            <div class="form-group col-md-6">
                <label for="lastName">Password</label>
                <input type="text" class="form-control" id="lastName" placeholder="LastName">
            </div>
        <form action="drivers/add" method="post">
            <p>Фамилия: <input type="text" name="firstName" id="firstName"/></p>
            <p>Имя: <input type="text" name="lastName" id="lastName"/></p>
            <p>Дата рождения: <input type="date" name="dateOfBirth" id="dateOfBirth"/></p>
            <p>Начал работать с: <input type="date" name="startWorkingDay" id="startWorkingDay"/></p>
            <p><button type="submit">Добавить</button></p>
        </form>
    </div>

    <div>
        <h3>Drivers:</h3>
        <#list drivers as driver>
            <div id="div:${driver.id}">
                FirstName: ${driver.firstName}
                LastName: ${driver.lastName}
                <form action="/drivers/delete" method="post">
                    <input type="hidden" value="${driver.id}" name="id">
                    <button type="submit">X</button>
                </form>
                <button onclick="update(${driver.id}, ${driver.firstName}, ${driver.lastName})">Update</button>
            </div>
        </#list>
    </div>

    <script>
        function update(id, firstName, lastName) {
            let row = document.getElementById('div:' + id)

            row.innerHTML = '<form action="/drivers/add" method="post">' +
                '<input type="hidden" name="id" value="' + id +'">' +
                'FirstName: <input type="text" name="firstName" id="firstName" value="' + firstName +'"/>' +
                'LastName: <input type="text" name="lastName" id="lastName" value="' + lastName + '"/>' +
                'DateOfBirth: <input type="date" name="dateOfBirth" id="dateOfBirth"/>' +
                'StartWorkingDay: <input type="date" name="startWorkingDay" id="startWorkingDay"/>' +
                '<button type="submit">Обновить</button>' +
                '</form>'
        }

    </script>
</@page>


