const express = require('express');
const app = express()
const db_conn = require('./config');
const user = require('./routes/user')
const product = require('./routes/product')
const transaction = require('./routes/transaction')
var bodyParser = require('body-parser');
const login = require('./routes/login')
const cors = require('cors')
// parse application/x-www-form-urlencoded

app.use(bodyParser.urlencoded({ extended: false }))
 
// parse application/json
app.use(bodyParser.json())

app.use(cors())

app.use((req,res,next) => {
    req.context = {db_conn}
    next()  
})

app.use('/login',login)
app.use('/user',user)
app.use('/product',product)
app.use('/transaction',transaction)

app.listen(process.env.PORT || 4000,(err) => {
  if(process.env.PORT)console.log("running on"+process.env.PORT);
  console.log("running on 4000");
})