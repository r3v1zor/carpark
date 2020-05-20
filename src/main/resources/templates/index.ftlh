<#include 'macros/main.ftlh'>
<@page>
    <nav class="navbar navbar-dark bg-dark">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link active" href="/">Главная</a>
            </li>
            </ul>
    </nav>
    <div class="container">
        <form class="form-inline" method="post" action="/login" style="max-width: 800px">
            <div style="padding-right: 5px">
                <label style="padding-right: 5px" for="selectForm">Выберите режим: </label>
                <select id="selectForm" name="param" >
                    <option value="admin">Admin</option>
                    <option value="user">User</option>
                </select>
            </div>
            <button class="btn-primary" type="submit">Login</button>
        </form>
    </div>
</@page>

