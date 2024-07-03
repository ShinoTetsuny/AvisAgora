const express = require("express")
const app = express()
let cors = require("cors")

//Models
const sequelize = require('./database/database');
const Category = require('./models/category')
const Product = require('./models/product')
const Comment = require('./models/comment')


app.use(cors())
app.use(express.json())

//Routes
const CategoryRoutes = require('./routes/category')
const ProductRoutes = require('./routes/product')
const CommentRoutes = require('./routes/comment');

app.use('/categorys', CategoryRoutes)
app.use('/products', ProductRoutes)
app.use('/comments', CommentRoutes)


/*let maj = async(req,res)=>{
    await sequelize.sync({force: true});
    console.log('maj effectuée');
}
maj();*/

app.listen(3000, () => {
    console.log("serverStart")
})