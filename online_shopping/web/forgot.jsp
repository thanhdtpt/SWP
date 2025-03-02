<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quên mật khẩu</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            .otp-container {
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            h2 {
                color: #333;
            }
            input[type="text"] {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
            }
            input[type="submit"] {
                background: linear-gradient(0, #5981d1, #10218a);
                color: white;
                border: none;
                padding: 10px 15px;
                font-size: 16px;
                border-radius: 5px;
                cursor: pointer;
                width: 100%;
            }
            input[type="submit"]:hover {
                background: #10218a;
            }
            input[type="text"] {
                width: 100%;
                padding: 12px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
                box-sizing: border-box;
                text-align: center;
            }

        </style>
        <link rel="stylesheet" href="./asserts/css/footer.css">
    </head>
    <body>
        <div class="otp-container">
            <h2>Email của bạn</h2>
            <form action="forgotPassword" method="post">
                <h3 style="color: red">${requestScope.error}</h3>

                <input type="text" name="email" required placeholder="Nhập Email của bạn">
                <input type="submit" value="Xác nhận">
            </form>
        </div>
    </body>
    <%@ include file="footer.jsp" %>
</html>
