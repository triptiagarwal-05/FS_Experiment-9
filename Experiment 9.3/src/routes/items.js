const express = require('express');
const router = express.Router();

// mock data
const items = [
  { id: 1, name: 'Item One', description: 'First item' },
  { id: 2, name: 'Item Two', description: 'Second item' },
];

router.get('/', (req, res) => {
  res.json({ items });
});

router.get('/:id', (req, res) => {
  const item = items.find(i => i.id === Number(req.params.id));
  if (!item) return res.status(404).json({ message: 'Not found' });
  res.json(item);
});

module.exports = router;
