'use strict';
const os = require('os');
const express = require('express');

// Constants
const PORT = 3000;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', async (req, res) => {
  try {
    const red = await fetch('http://red-service:3000').then(res => res.text())
    const blue = await fetch('http://blue-service:3000').then(res => res.text())
    res.send(`violet = ${blue}+${red} (${os.hostname()})\n`)
  } catch (e) {
    res.send(e)
  }
});

app.listen(PORT, HOST, () => {
  console.log(`Running on http://${HOST}:${PORT}`);
});