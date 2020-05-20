<#include 'macros/main.ftlh'>

<@page>
    <#include 'macros/admin-bar.ftlh'>
    <@page>
    </@page>
    <div class="container">
        <div>
            <form method="post" action="/driver-reviews/add">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="driver">Водитель</label>
                        <select required id="driver" name="driver">
                            <#list drivers as driver>
                                <option value="${driver.id}">${driver.lastName + " " + driver.firstName}</option>
                            </#list>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="text">Текст отзыва</label>
                        <input required type="text" class="form-control" id="text" name="text" placeholder="Введите текст">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="authorNickname">Имя автора отзыва</label>
                        <input required type="text" class="form-control" id="authorNickname" name="authorNickname" placeholder="Введите имя">
                    </div>
                </div>

                <button type="submit" class="btn btn-primary">Добавить</button>
            </form>
        </div>

        <div>
            <h3>Отзывы на водителей:</h3>
            <#if driverReviews?size != 0>
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">Водитель</th>
                        <th scope="col">Текст отзыва</th>
                        <th scope="col">Автор отзыва</th>
                        <th scope="col">#</th>
                        <th scope="col">#</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list driverReviews as review>
                        <tr id="tr-${review.id}">
                            <td>${review.driver.lastName + " " + review.driver.firstName}</td>
                            <td>${review.text}</td>
                            <td>${review.authorNickname}</td>
                            <td><button class="btn btn-primary btn-sm" onclick="updateReviews(${review.id}, '${review.driver}', '${review.authorNickname}')">Обновить</button></td>
                            <td>
                                <form action="/driver-reviews/delete" method="post">
                                    <input type="hidden" value="${review.id}" name="id">
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
        function updateReviews(id, driver, authorName) {
            let row = document.getElementById('tr-' + id)

            row.innerHTML = '<form id="my-form" method="post" action="/driver-reviews/add">' +
                '<input form="my-form" type="hidden" value="' + id + '" name="id">' +
                '<td><input form="my-form" type="text" class="form-control" id="firstName" name="firstName" value="' + firstName +'"></td>' +
                '<td><input form="my-form" type="text" class="form-control" id="lastName" name="lastName" value="' + lastName + '"></td>' +
                '<td><input form="my-form" type="date" class="form-control" id="dateOfBirth" name="dateOfBirth"></td>' +
                '<td><input form="my-form" type="date" class="form-control" id="startWorkingDay" name="startWorkingDay"></td>' +
                '<td><button form="my-form" class="btn btn-primary btn-sm" type="submit">Обновить</button></td>' +
                '<td>' +
                '<form action="/driver-reviews/delete" method="post">' +
                '<input type="hidden" value="' + id +'" name="id">' +
                '<button type="submit" class="btn btn-primary btn-sm">Удалить</button>' +
                '</form>' +
                '</td>'
        }

    </script>
</@page>


