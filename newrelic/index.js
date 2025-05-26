require('newrelic'); // First line
const express = require('express');
const app = express();
app.get('/', (req, res) => res.send('New Relic Test App'));
app.listen(3000);
