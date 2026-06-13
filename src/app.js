// src/app.js
const http = require('http');
const { add, subtract, multiply } = require('./math');

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'application/json' });
  res.end(JSON.stringify({
    status: 'ok',
    examples: {
      'add(2,3)': add(2, 3),
      'subtract(10,4)': subtract(10, 4),
      'multiply(3,3)': multiply(3, 3)
    }
  }));
});

server.listen(3000, () => {
  console.log('Server running on http://localhost:3000');
});

module.exports = server;