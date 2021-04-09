const express = require('express');
const router = express.Router()
const {getAllTransaction,createTransaction,updateTransaction,deleteTransaction} = require('../controllers/transaction')

router.get('/:username',getAllTransaction)
router.post('/',createTransaction)
router.put('/',updateTransaction)
router.delete('/',deleteTransaction)

module.exports = router