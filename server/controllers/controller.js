const db = require('../model/db');

const getBlogs = async (req, res) => {
    var blogList;
    blogList = await db.find({});

    if (!blogList) {

        res.status(400).json({ success: false, message: "Blogs doesnot exist" })
    }
    else {
        res.status(200).json({ success: true, data: blogList });
    }
}

const createBlog = async (req, res) => {
    const blog = { title, description } = req.body
    if (!blog) {
        return res
            .status(400)
            .json({ success: false, msg: 'please provide blog' })
    }
    await db.insertMany([blog]);
    res.status(201).send({ success: true, blog: blog })
}



const updateBlog = async (req, res) => {



    var blog = await db.findByIdAndUpdate(req.params.id, req.body);
    if (!blog) {
        return res
            .status(404)
            .json({ success: false, msg: `no task with id ${id}` })
    }



    res.status(200).json({ success: true, data: blog });
}

const deleteBlog = async (req, res) => {

    var blog = await db.findByIdAndRemove(req.params.id);
    if (!blog) {
        return res
            .status(404)
            .json({ success: false, msg: `no blog with id ${req.params.id}` })
    }

    return res.status(200).json({ success: true, data: blog })
}

module.exports = {
    getBlogs,
    createBlog,
    updateBlog,
    deleteBlog,
}