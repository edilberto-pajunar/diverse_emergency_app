const express = require("express");
const app = express();
const PORT = process.env.PORT || 5000;
const userRoute = require("./routes/User");

require("dotenv").config();

app.use("/v1/user", userRoute);



app.listen(PORT, () => {
    console.log(`Server is running on PORT: ${PORT}`);
});