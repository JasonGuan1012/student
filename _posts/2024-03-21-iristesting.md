---
toc: true
comments: false
layout: post
title: Iris Testing
description: 
type: plans
courses: { compsci: {week: 19} }
image: images/erfef.webp
---

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Iris Predictor</title>
</head>
<body>

<h2>Iris Predictor</h2>

<div>
  <label for="sepal_length">Sepal Length:</label>
  <input type="number" id="sepal_length" step="0.1" placeholder="Enter Sepal Length">
</div>
<div>
  <label for="sepal_width">Sepal Width:</label>
  <input type="number" id="sepal_width" step="0.1" placeholder="Enter Sepal Width">
</div>
<div>
  <label for="petal_length">Petal Length:</label>
  <input type="number" id="petal_length" step="0.1" placeholder="Enter Petal Length">
</div>
<div>
  <label for="petal_width">Petal Width:</label>
  <input type="number" id="petal_width" step="0.1" placeholder="Enter Petal Width">
</div>
<div>
  <button onclick="predictIris()">Submit</button>
</div>

<script>
  function predictIris() {
    const sepal_length = parseFloat(document.getElementById('sepal_length').value);
    const sepal_width = parseFloat(document.getElementById('sepal_width').value);
    const petal_length = parseFloat(document.getElementById('petal_length').value);
    const petal_width = parseFloat(document.getElementById('petal_width').value);
    
    const data = JSON.stringify({
        "sepal_length": sepal_length,
        "sepal_width": sepal_width,
        "petal_length": petal_length,
        "petal_width": petal_width
    });

    console.log('Data to be sent:', data);
    
    fetch('http://localhost:8086/predict', {
      method: 'POST',
      mode: 'cors',
      headers: {
        'Content-Type': 'application/json'
      },
      body: data
    })
    .then(response => {
      console.log('Response status:', response.status);
      if (!response.ok) {
        throw new Error('Error predicting variety');
      }
      return response.json();
    })
    .then(data => {
      console.log('Response data:', data);
      const predicted_variety = data.predicted_variety;
      alert('Predicted variety: ' + predicted_variety);
    })
    .catch(error => {
      console.error('Error predicting variety:', error);
      alert('Error predicting variety. Please try again.');
    });
  }
</script>

</body>
</html>
