const express = require('express');
const commentController = require('../controllers/comment');

const router = express.Router();

// Route to create a comment
router.post('/', commentController.createComment);

// Route to get all comments for a specific product
router.get('/:productId/comments', commentController.getAllComments);

module.exports = router;
