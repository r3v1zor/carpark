<#include 'macros/main.ftlh'>

<@page>
    <div>
        <form class="form-inline" method="post" action="/login">
                <label for="selectForm">Выберите режим: </label>
                <select id="selectForm" name="param">
                    <option value="admin">Admin</option>
                    <option value="user">User</option>
                </select>

            <button class="btn-primary" type="submit">Login</button>
        </form>
    </div>

</@page>

