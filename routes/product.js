const express = require('express');
const router = express.Router()
const {getAllProduct,createProduct,updateProduct,deleteProduct} = require('../controllers/product')

router.get('/',getAllProduct)
router.post('/',createProduct)
router.put('/',updateProduct)
router.delete('/',deleteProduct)

module.exports = router