<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>WebSocket Teste</title>
</head>
<body>
    <h1>Teste WebSocket</h1>
    <input id="msg" type="text" placeholder="Digite uma mensagem">
    <button onclick="enviar()">Enviar</button>
    <div id="chat"></div>
    <script>
        var ws = new WebSocket("ws://" + location.host + "/websocket");
        ws.onmessage = function(event) {
            var chat = document.getElementById("chat");
            chat.innerHTML += "<div>Servidor: " + event.data + "</div>";
        };
        function enviar() {
            var msg = document.getElementById("msg").value;
            ws.send(msg);
            var chat = document.getElementById("chat");
            chat.innerHTML += "<div>Você: " + msg + "</div>";
        }
    </script>
</body>
</html>