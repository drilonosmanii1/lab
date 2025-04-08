
const express = require('express');
const mysql = require('mysql2/promise');

const app = express();
const port = 3000;


const pool = mysql.createPool({
  host: 'mysql',
  user: 'user',
  database: 'mydb',
  password: 'password',
  port: 3306,
});

app.get('/', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT NOW() AS now');
    res.send(`MySQL connected: ${rows[0].now}`);
  } catch (error) {
    console.error(error);
    res.status(500).send('Database connection failed');
  }
});

app.listen(port, () => {
  console.log(`App running on http://localhost:${port}`);
});