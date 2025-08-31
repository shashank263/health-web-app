<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Health Tracker Result</title>
    <style>
        body {
            font-family: "Segoe UI", sans-serif;
            background: linear-gradient(120deg, #c9ffbf, #fffb7d);
            padding: 40px;
            margin: 0;
        }
        .box {
            background: #ffffff;
            padding: 25px;
            border-radius: 20px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.15);
            max-width: 900px;
            margin: auto;
        }
        h2 {
            color: #388e3c;
            margin-bottom: 10px;
        }
        h3 {
            color: #2e7d32;
            margin-top: 25px;
            border-bottom: 2px solid #81c784;
            padding-bottom: 5px;
        }
        .record {
            background: #e8f5e9;
            margin: 12px 0;
            padding: 12px;
            border-left: 6px solid #43a047;
            border-radius: 8px;
        }
        .progress-bar {
            background: #c8e6c9;
            border-radius: 10px;
            overflow: hidden;
            margin-top: 6px;
        }
        .progress {
            height: 18px;
            background: #43a047;
            text-align: center;
            color: white;
            font-size: 12px;
            line-height: 18px;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            background: #43a047;
            color: white;
            padding: 10px 18px;
            border-radius: 12px;
            font-weight: bold;
            transition: 0.3s;
        }
        a:hover {
            background: #2e7d32;
        }
        .leaderboard {
            margin-top: 20px;
            border-collapse: collapse;
            width: 100%;
        }
        .leaderboard th, .leaderboard td {
            padding: 10px;
            text-align: center;
        }
        .leaderboard th {
            background: #388e3c;
            color: white;
        }
        .leaderboard tr:nth-child(even) {
            background: #f1f8e9;
        }
        .gold { color: #FFD700; font-weight: bold; }
        .silver { color: #C0C0C0; font-weight: bold; }
        .bronze { color: #CD7F32; font-weight: bold; }
    </style>
</head>
<body>
<div class="box">
    <h2>✅ Health Data Saved</h2>

    <c:if test="${not empty healthData}">
        <p><strong>Name:</strong> ${healthData.name}</p>
        <p><strong>Age:</strong> ${healthData.age}</p>
        <p><strong>Steps:</strong> ${healthData.steps}</p>
    </c:if>

    <h3>📋 All Records</h3>
    <c:forEach var="d" items="${all}">
        <div class="record">
            <strong>${d.name}</strong> (Age: ${d.age}) → ${d.steps} steps
            <div class="progress-bar">
                <div class="progress" style="width: ${d.steps/100}%;">
                    ${d.steps} / 10000
                </div>
            </div>
        </div>
    </c:forEach>

    <h3>🏆 Leaderboard</h3>
    <table class="leaderboard">
        <tr>
            <th>Rank</th>
            <th>Name</th>
            <th>Steps</th>
        </tr>
        <c:forEach var="d" items="${all}" varStatus="loop">
            <tr>
                <td>
                    <c:choose>
                        <c:when test="${loop.index == 0}"><span class="gold">🥇 1</span></c:when>
                        <c:when test="${loop.index == 1}"><span class="silver">🥈 2</span></c:when>
                        <c:when test="${loop.index == 2}"><span class="bronze">🥉 3</span></c:when>
                        <c:otherwise>${loop.index + 1}</c:otherwise>
                    </c:choose>
                </td>
                <td>${d.name}</td>
                <td>${d.steps}</td>
            </tr>
        </c:forEach>
    </table>

    <a href="index.jsp">⬅ Back to Home</a>
</div>
</body>
</html>
