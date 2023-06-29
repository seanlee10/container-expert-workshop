'use strict';
const os = require('os');
const express = require('express');

// Constants
const PORT = 3000;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', async (req, res) => {
  res.send(`blue (${os.hostname()})\n`)
});

app.listen(PORT, HOST, () => {
  console.log(`Running on http://${HOST}:${PORT}`);
});