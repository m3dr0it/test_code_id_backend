const jsonwebtoken = require('jsonwebtoken');

const login = (req,res,next) => {
  const {username,password} = req.body
  const {db_conn} = req.context
  let query = `select * from user where username='${username}'`;

  db_conn.query(query,(err,result) => {
    if(err) res.send(err)
    console.log(result[0].password)
    let authed = password === result[0].password
    req.body.user =  JSON.parse(JSON.stringify(result))[0]
    if(authed){
        next()
    }else{
        res.send(false)
    }
  })
}

const authed = (req,res,next) => {
  let jwt = jsonwebtoken.sign(req.body.user,'secret',{ expiresIn:'1h' })
  console.log(jwt)
  res.send(jwt)
}

module.exports = {login,authed}