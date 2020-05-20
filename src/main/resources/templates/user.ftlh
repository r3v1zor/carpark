<#include 'macros/main.ftlh'>

<@page>
    <#include 'macros/user-bar.ftlh'>
    <@page>
    </@page>
    <div class="container">
        <h1 class="display" style="padding-top: 15px;">Добро пожаловать!</h1>
        <p>Вы находитесь на сайте нашего автопарка в роли <b>пользователя</b>. Вам доступен просмотр маршрутов,
            водителей, а также поиск среди водителей по дате и маршруту.</p>

        <div>
            <input type="button" class="btn btn-info" value="Маршруты" onclick="location.href='userRoutes'">
            <input type="button" class="btn btn-info" value="Driver schedule" onclick="location.href='driverSchedule'">
            <input type="button" class="btn btn-info" value="Поиск водителя по дате и маршруту" onclick="location.href='driverRoute'">
        </div>
    </div>
    <style>
        .display {
            font-size: 4.5rem;
            font-weight: 300;
            line-height: 1.5;
        }
        .container {
            font-size: 2.0rem;
            width: 100%;
            padding-right: 15px;
            padding-left: 15px;
            margin-right: auto;
            margin-left: auto;
        }
    </style>
</@page>

