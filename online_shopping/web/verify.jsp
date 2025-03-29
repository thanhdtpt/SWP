<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Xác nhận OTP</title>
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
                padding: 25px;
                border-radius: 12px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
                text-align: center;
                width: 350px;
            }
            h2 {
                color: #333;
                font-size: 22px;
                margin-bottom: 15px;
            }
            input[type="text"] {
                width: 100%;
                padding: 12px;
                margin: 12px 0;
                border: 1px solid #ccc;
                border-radius: 6px;
                font-size: 16px;
                text-align: center;
                outline: none;
                display: block;
                box-sizing: border-box;
            }
            input[type="text"]:focus {
                border-color: #5981d1;
            }
            input[type="submit"] {
                background: linear-gradient(0, #5981d1, #10218a);
                color: white;
                border: none;
                padding: 12px 20px;
                font-size: 16px;
                border-radius: 6px;
                cursor: pointer;
                width: 100%;
                transition: background 0.3s;
            }
            input[type="submit"]:hover {
                background: #10218a;
            }
            .error-message {
                color: red;
                font-size: 14px;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <div class="otp-container">
            <h2>Nhập mã OTP</h2>
            <form action="verifyOTP" method="post">
                <c:if test="${not empty requestScope.error}">
                    <p class="error-message">${requestScope.error}</p>
                </c:if>
                <input type="text" name="otp" required placeholder="Nhập mã OTP">
                <input type="submit" value="Xác nhận">
            </form>
        </div>
    </body>
</html>