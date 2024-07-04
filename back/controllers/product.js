const Product = require('../models/product');

exports.createProduct = async (req, res) => {
    try {
        const product = await Product.create(req.body);
        res.status(201).json(product);
    } catch (error) {
        res.status(500).json({ error: 'Une erreur est survenue lors de la création du produit.' });
    }
};

exports.getAllProducts = async (req, res) => {
    try {
        const products = await Product.findAll();
        res.json(products);
    } catch (error) {
        res.status(500).json({ error: 'Une erreur est survenue lors de la récupération des produits.' });
    }
};

exports.getProductsByCategoryId = async (req, res) => {
    try {
        const products = await Product.findAll({ where: { categoryId: req.params.categoryId } });
        res.json(products);
    } catch (error) {
        res.status(500).json({ error: 'Une erreur est survenue lors de la récupération des produits par categoryId.' });
    }
};

exports.getTopRatedProducts = async (req, res) => {
    try {
        const products = await Product.findAll({ order: [['rating', 'DESC']], limit: 5 });
        res.json(products);
    } catch (error) {
        res.status(500).json({ error: 'Une erreur est survenue lors de la récupération des meilleurs produits.' });
    }
};

exports.getProductById = async (req, res) => {
    try {
        const product = await Product.findByPk(req.params.id);
        if (!product) {
            return res.status(404).json({ error: 'Produit non trouvé.' });
        }
        res.json(product);
    } catch (error) {
        res.status(500).json({ error: 'Une erreur est survenue lors de la récupération du produit.' });
    }
};

exports.updateProduct = async (req, res) => {
    try {
        const product = await Product.findByPk(req.params.id);
        if (!product) {
            return res.status(404).json({ error: 'Produit non trouvé.' });
        }
        
        await product.update(req.body);
        res.json(product);
    } catch (error) {
        res.status(500).json({ error: 'Une erreur est survenue lors de la mise à jour du produit.' });
    }
};

exports.deleteProduct = async (req, res) => {
    try {
        const product = await Product.findByPk(req.params.id);
        if (!product) {
            return res.status(404).json({ error: 'Produit non trouvé.' });
        }

        await product.destroy();
        res.json({ message: 'Produit supprimé avec succès.' });
    } catch (error) {
        res.status(500).json({ error: 'Une erreur est survenue lors de la suppression du produit.' });
    }
};
