const express = require('express');
const app = express();

app.use(express.json());

// Home route
app.get('/', (req, res) => {
  res.send('App is running 🚀');
});

// Health check route (VERY important in DevOps)
app.get('/health', (req, res) => {
  res.json({ status: 'OK' });
});

// Dummy users route
app.get('/users', (req, res) => {
  res.json([
    { id: 1, name: 'Saksham' },
    { id: 2, name: 'DevOps Learner' }
  ]);
});

// POST route
app.post('/add-user', (req, res) => {
  const user = req.body;
  res.json({
    message: 'User added',
    user: user
  });
});

app.listen(3000, '0.0.0.0', () => {
  console.log('Server running');
});