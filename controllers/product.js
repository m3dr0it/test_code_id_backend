const getAllProduct =  async(req,res,next) => {
    try {
        const {db_conn} = req.context
        await db_conn.query('select * from product',(err,result,field) => {
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

const createProduct = async (req,res,next) => {
    try {
        const {db_conn} = req.context
        const {
            id_product,
            product_name,
            price,
            stock
        } = req.body
        await db_conn.query(`insert into product values(`+
        `${id_product},`+
        `${product_name},`+
        `${price},`+
        `${stock})`,(err,result) => {
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

const updateProduct = async (req,res,next) => {
    try {
        const {db_conn} = req.context
        const {
            id_product,
            product_name,
            price,
            stock
        } = req.body
        await db_conn.query(`update product set(`+
        `product_name=${product_name},`+
        `price=${price}`+
        `stock=${stock}) where id_product=${id_product}`,(err,result) => {
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

const deleteProduct = async (req,res,next) => {
  try {
    const {db_conn} = req.context
    const {
        id_product
    } = req.body
    let query = `delete from product where id_product=${id_product}`
    db_conn.query(query,(err,result) => {
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

module.exports = {getAllProduct,createProduct,updateProduct,deleteProduct}