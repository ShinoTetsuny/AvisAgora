const Comment = require('../models/comment');
const Product = require('../models/product');

// Importez les modules nécessaires

// Contrôleur pour créer un commentaire
exports.createComment = async (req, res) => {
    try {
        // Créez le commentaire
        const comment = await Comment.create(req.body);

        // Mettez à jour le rating du produit
        const productId = comment.productId;
        const comments = await Comment.find({ productId });
        const ratings = comments.map(comment => comment.rating);
        const averageRating = ratings.reduce((total, rating) => total + rating, 0) / ratings.length;

        await Product.findByIdAndUpdate(productId, { rating: averageRating });

        res.status(201).json({ success: true, comment });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
};

// Contrôleur pour obtenir tous les commentaires d'un produit spécifique
exports.getAllComments = async (req, res) => {
    try {
        const productId = req.params.productId;
        const comments = await Comment.find({ productId });
        res.status(200).json({ success: true, comments });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
};