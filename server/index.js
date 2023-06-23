const express = require('express');
const app = express();
app.use(express.static('./methods-public'))
const blogs = require('./routes/blog-routes')
app.use(express.urlencoded({ extended: false }))
app.use(express.json())
app.use('/blogs', blogs)


app.listen(5000, () => {
    console.log('Server is listening on port 5000....');
})