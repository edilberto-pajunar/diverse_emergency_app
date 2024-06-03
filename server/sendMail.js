const nodemailer = require("nodemailer");
require("dotenv").config();
const  path = require("path");

let transporter = nodemailer.createTransport({
    service: "gmail",
    host: "pajunar0@gmail.com",
    port: 587,
    secure: false,
    auth: {
        user: process.env.USER,
        pass: process.env.APP_PASSWORD,
    },

})

module.exports = transporter;