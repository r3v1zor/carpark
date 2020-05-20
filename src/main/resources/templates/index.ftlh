<#include 'macros/main.ftlh'>

<@page>
    <div>
        <form method="get" action="/">
            <p><select id="selectForm">
                    <option value="admin">Admin</option>
                    <option value="user">User</option>
                </select></p>
            <p><button type="button" name="button" onclick="redirect()">Login</button></p>
        </form>
    </div>
    <script>
        let strPage = null;

        function redirect() {
            let e = document.getElementById("selectForm");
            strPage = e.options[e.selectedIndex].value;

            console.log('some: ' + strPage)
            window.location.href = 'localhost:8080/' + strPage
        }
    </script>
</@page>

