<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Health Tracker</title>
    <style>
        body {
            font-family: "Segoe UI", sans-serif;
            background: linear-gradient(135deg, #d4fc79, #96e6a1);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #ffffff;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
            width: 360px;
            text-align: center;
        }
        h2 {
            color: #2e7d32;
            margin-bottom: 20px;
        }
        input[type="text"] {
            width: 85%;
            padding: 10px;
            margin: 10px 0;
            border: 2px solid #81c784;
            border-radius: 10px;
            outline: none;
            transition: 0.3s;
        }
        input[type="text"]:focus {
            border-color: #388e3c;
        }
        input[type="submit"] {
            background: #43a047;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 15px;
            transition: 0.3s;
        }
        input[type="submit"]:hover {
            background: #2e7d32;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>🌿 Welcome to Health Tracker</h2>
    <form action="health" method="post">
        <input type="text" name="name" placeholder="Enter Name"/><br/>
        <input type="text" name="age" placeholder="Enter Age"/><br/>
        <input type="text" name="steps" placeholder="Enter Steps"/><br/>
        <input type="submit" value="Submit"/>
    </form>
</div>
</body>
</html>
