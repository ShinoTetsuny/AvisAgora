const Category = require('../models/category');

exports.getAllCategories = (req, res, next) => {
    Category.findAll()
        .then((categories) => res.status(200).json(categories))
        .catch((error) => res.status(400).json({ error }));
}

exports.getOneCategory = (req, res, next) => {
    Category.findOne({ where: { id: req.params.id } })
        .then((category) => res.status(200).json(category))
        .catch((error) => res.status(400).json({ error }));
}

exports.createCategory = (req, res, next) => {
    Category.create({
        name: req.body.name,
    })
        .then((category) => res.status(200).json(category))
        .catch((error) => res.status(400).json({ error }));
}

exports.editCategory = (req, res, next) => {
    Category.update({
        name: req.body.name,
    }, { where: { id: req.params.id } })
        .then((category) => res.status(200).json(category))
        .catch((error) => res.status(400).json({ error }));
}

exports.deleteCategory = (req, res, next) => {
    Category.destroy({ where: { id: req.params.id } })
        .then((category) => res.status(200).json(category))
        .catch((error) => res.status(400).json({ error }));
}