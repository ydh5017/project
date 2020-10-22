<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String user_mail=(String)session.getAttribute("SS_userEmail");
%>
<html>
<head>
    <title>chat</title>

    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.1/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.js"></script>

    <style>
        #main {
            margin: auto;
            text-align: center;
            width: 800px;
            min-width: 800px;
            height: 500px;
            min-height: 500px;
            overflow-y: auto;
            scroll-behavior:smooth;
        }
        #messageWindow {
            height: 90%;
            width: 100%;
            border: 1px solid black;
            display: block;
        }
        #inputMessage {
            width: 700px;
        }
        #msg_process {
            width: 90px;
        }
    </style>
</head>
<body>
    <div id="main">
        <div id="messageWindow"></div>
    </div>
    <input type="text" id="inputMessage" />
    <input id="msg_process" type="submit" onclick="logincheck()" value="전송" />

    <script>
        var chat = io('http://localhost:3000/');
        console.log(chat);
        let user_mail = "<%=user_mail%>";

        function send() {

            chat.emit("login", {
                userid: user_mail
            });
            chat.emit("chat",{
                msg: $('#inputMessage').val()
            });
        }

        function logincheck(){

            if (user_mail == "null"){
                user_mail = "익명";

                send();
                $('#inputMessage').val('');

            }else{
                send();
                $('#inputMessage').val('');
            }
        }


        chat.on("s2c chat", function(data){
            var time = new Date();
            var timeStr = time.toLocaleTimeString();
            document.getElementById('messageWindow').innerHTML = "<div>"+"[ "+timeStr+ " ] " + data.from.userid + " 님이 보낸 채팅 : " + data.msg + "</div>" + "<br/>" + document.getElementById('messageWindow').innerHTML;
        })



    </script>


</body>
</html>
