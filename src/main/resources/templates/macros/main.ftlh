

<#macro page>
    <html lang="en">
    <head>
        <title>
            Car park
        </title>
        <link rel="stylesheet" href="/static/style.css">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>

    <div class="container mt-5">
        <#nested >
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script>
        function update(id, busCompanyName) {
            let row = document.getElementById('tr-' + id)

            row.innerHTML = '<form id="my-form" action="/buscompanies/add" method="post"></form>' +
                '<td><input type="text" form="my-form" name="name" value="' + busCompanyName +'"></td>' +
                '<td><input type="hidden" form="my-form" value="' + id +'" name="id">' +
                '<button type="submit" form="my-form" class="btn btn-primary btn-sm">Обновить</button>' +
                '</td>' +
                '' +
                '<td>' +
                '<form action="/buscompanies/delete" method="post">' +
                '<input type="hidden" value="' + id +'" name="id">' +
                '<button type="submit" class="btn btn-primary btn-sm">Удалить</button>' +
                '</form>' +
                '</td>'
        }
    </script>
    </body>
    </html>
</#macro>