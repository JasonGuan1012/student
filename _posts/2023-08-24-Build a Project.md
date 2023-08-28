---
layout: post
title: Build a Project
description: This the page for the assignment "Build a Project". This page added the Calculator with the language in JavaScript.
--- 

<body>
    <h1>Calculator</h1>
    <input type="text" id="result" readonly>
    <br>
    <button onclick="appendToResult('1')">1</button>
    <button onclick="appendToResult('2')">2</button>
    <button onclick="appendToResult('3')">3</button>
    <button onclick="appendToResult('+')">+</button>
    <br>
    <button onclick="appendToResult('4')">4</button>
    <button onclick="appendToResult('5')">5</button>
    <button onclick="appendToResult('6')">6</button>
    <button onclick="appendToResult('-')">-</button>
    <br>
    <button onclick="appendToResult('7')">7</button>
    <button onclick="appendToResult('8')">8</button>
    <button onclick="appendToResult('9')">9</button>
    <button onclick="appendToResult('*')">*</button>
    <br>
    <button onclick="appendToResult('0')">0</button>
    <button onclick="clearResult()">C</button>
    <button onclick="calculateResult()">=</button>
    <button onclick="appendToResult('/')">/</button>

    <script>
        function appendToResult(value) {
            document.getElementById('result').value += value;
        }

        function clearResult() {
            document.getElementById('result').value = '';
        }

        function calculateResult() {
            try {
                const expression = document.getElementById('result').value;
                const result = eval(expression);
                document.getElementById('result').value = result;
            } catch (error) {
                document.getElementById('result').value = 'Error';
            }
        }
    </script>
</body>






