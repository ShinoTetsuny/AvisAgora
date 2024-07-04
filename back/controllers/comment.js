const Comment = require('../models/comment');
const Product = require('../models/product');

// Contrôleur pour créer un commentaire
exports.createComment = async (req, res) => {
    try {
        // Créez le commentaire
        const comment = await Comment.create(req.body);

        // Mettez à jour le rating du produit
        const productId = comment.productId;
        const comments = await Comment.findAll({ where: { productId } });
        const ratings = comments.map(comment => comment.rating);
        const averageRating = ratings.reduce((total, rating) => total + rating, 0) / ratings.length;
        const roundedRating = Math.round(averageRating * 10) / 10; // Arrondir la note moyenne à une décimale

        await Product.update({ rating: roundedRating }, { where: { id: productId } });

        res.status(201).json({ success: true, comment });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
};

// Contrôleur pour obtenir tous les commentaires d'un produit spécifique
exports.getAllComments = async (req, res) => {
    try {
        const productId = req.params.productId;
        const comments = await Comment.findAll({ where: { productId } });
        res.status(200).json({ success: true, comments });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
};
