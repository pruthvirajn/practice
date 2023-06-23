const mongoose = require('mongoose');

mongoose.connect("mongodb://localhost:27017/TravelBlogs")
    .then(() => {
        console.log("mongodb connection successful")
    }).catch(() => {
        console.log("not successful")
    })

const blogSchema = new mongoose.Schema({
    title: {
        type: String,
        required: true
    },
    description: {
        type: String,
        required: true
    },

})

const connection = new mongoose.model("table", blogSchema)

module.exports = connection;