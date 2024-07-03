const express = require('express');
const categoryController = require('../controllers/category');

const router = express.Router();

// GET route to retrieve all categories
router.get('/', categoryController.getAllCategories);

// GET route to retrieve a specific category by its ID
router.get('/:id', categoryController.getOneCategory);

// POST route to create a new category
router.post('/', categoryController.createCategory);

// PUT route to update an existing category
router.put('/:id', categoryController.editCategory);

// DELETE route to delete a category by its ID
router.delete('/:id', categoryController.deleteCategory);

module.exports = router;
