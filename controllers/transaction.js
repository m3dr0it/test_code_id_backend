const getAllTransaction = async (req,res,next) => {
    try {
        const {username} = req.params
        const {db_conn} = req.context
    await db_conn.query(`select * from transaction tr join product pr on tr.id_product = pr.id_product where created_by='${username}'`,(err,result,field) => {
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

const createTransaction = async (req,res,next) => {
    try {
        const {db_conn} = req.context
        const {
            transaction_no,
            transaction_date,
            id_product,
            price,
            qty,
            subtotal,
            created_by,
            created_date
        } = req.body
    
        let query = `insert into transaction (transaction_date,id_product,price,qty,subtotal,created_by,created_date) values(`+
        `now(),`+
        `${id_product},`+
        `${price},`+
        `${qty},`+
        `${subtotal},`+
        `'${created_by}',`+
        `now())`
        
        await db_conn.query(query,(err,result) => {
          if(err){
              res.send(err)
          }else{
              db_conn.query(`update product set stock=stock-${qty} where id_product=${id_product}`,(err,result) => {
                if(err) res.send(err)
                res.send(result)
              })
          }
        })
    } catch (error) {
        res.send(error)
    }
}

const updateTransaction = async (req,res,next) => {
    try {
        const {db_conn} = req.context
        const {transaction_no,
            transaction_date,
            id_product,
            price,
            qty,
            subtotal,
            created_by,
            created_date
        } = req.body
        let query = `update transaction set`+
        `transaction_date=${transaction_date},`+
        `id_product=${id_product},`+
        `price=${price},`+
        `qty=${qty},`+
        `subtotal=${subtotal},`+
        `created_by=${created_by},`+
        `created_date=${created_date} where transaction_no=${transaction_no}`
        
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

const deleteTransaction = async (req,res,next) => {
    try {
        const {db_conn} = req.context
    const {transaction_no} = req.body
    let query=`delete from transaction where transaction_no=${transaction_no}`
    db_conn.query(query,(err,result) => {
      if(err) res.send(err)
      res.send(result)
    })
    } catch (error) {
      res.send(error)  
    }
}

module.exports = {getAllTransaction,createTransaction,updateTransaction,deleteTransaction}