const express = require('express');
const router = express.Router()
const {getAllUser,createUser,updateUser,deleteUser} = require('../controllers/user')

router.get('/',getAllUser)
router.post('/',createUser)
router.put('/',updateUser)
router.delete('/',deleteUser)

module.exports = router