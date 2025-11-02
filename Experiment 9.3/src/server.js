require('dotenv').config();
const express = require('express');
const cors = require('cors');
const itemsRouter = require('./routes/items');

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => res.json({ message: 'Backend API running' }));

app.use('/api/items', itemsRouter);

// simple health check for ALB
app.get('/health', (req, res) => res.status(200).send('OK'));

app.listen(PORT, () => {
  console.log(`Backend listening on port ${PORT}`);
});
