const express  = require('express')
const router = express.Router()

router.post('/submit', async (req, res) => {
    if (!req.session.userId) {
      return res.status(401).json({ message: 'You must be logged in to submit a score.' });
    }
    
    // Handle score submission...
  });

module.exports = router
