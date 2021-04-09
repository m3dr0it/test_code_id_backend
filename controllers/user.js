const getAllUser = async (req,res,next) => {
    try {
        const {db_conn} = req.context
    await db_conn.query('select * from user',(err,result,field) => {  
        res.send(result)
    })
    } catch (error) {
      res.send(error)  
    }
}

const createUser = async (req,res,next) => {
    try {
        const {db_conn} = req.context
    const {id_user,username,password,fullname,address,gender,bird_date} = req.body
    let query = `insert into user values (${id_user},${username},${password},${fullname},${address},${gender},${bird_date})`;
    console.log(query);
    await db_conn.query(query,(err,result) => {
        if(err) res.send(err)
        else{
            res.send(result);
        }
    })
    } catch (error) {
      res.send(error)  
    }
}

const updateUser = async (req,res,next) => {
  try {
    const {db_conn} = req.context
    const {id_user,username,password,fullname,address,gender,bird_date} = req.body
    let query = `update user set username=${username},`+
    `password=${password},fullname=${fullname},address=${address},`+
    `gender=${gender},bird_date=${bird_date} where id_user=${id_user}`;
    console.log(query);
    await db_conn.query(query,(err,result) => {
      if(err){
          res.send(err)
      }else{
          res.send(result)
      }
    })
  } catch (error) {
      res.send(error)
  }
}

const deleteUser = async (req,res,next) => {
    try {
        const {db_conn} = req.context
    const {id_user} = req.body

    let query = `delete from user where id_user=${id_user}`
    await db_conn.query(query,(err,result) => {
      if(err){
          res.send(err)
      }else{
          res.send(result)
      }
    })
    } catch (error) {
      res.send(error)  
    }
}

module.exports = {getAllUser,createUser,updateUser,deleteUser}