const express = require("express");
const { transporter } = require("../sendMail");
const router = express.Router();

router.get("/", (req, res) => {
    res.send({
        data:" User Created",
    });
});

const mailOptions = {
    from: {
        name: "Web Wizard",
        address: process.env.USER,
    },
    to: "pajunar0@gmail.com",
    subject: "Hello",
    text: "Hello world?",
    html: "<b>Hello world?</b>",
    // attachments: [
    //     {
    //         filename: "test.pdf",
    //         path: path.join(__dirname, "test.pdf"),
    //         contentType: "application/pdf",
    //     }
    // ],


   
};

const sendMail = async (transporter, mailOptions) => {
    try {
        await transporter.sendMail(mailOptions);
        console.log("Email has been sent.");
    } catch (e) {
        console.error(e);
    }
};

router.get("/send-email", async (req, res) => {
    try {
        await sendMail(transporter, mailOptions);
        res.send("Email has been sent");
    } catch (e) {
        res.send(e);
    }
   
});


module.exports = router;