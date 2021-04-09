const express = require('express');
const router = express.Router()
const {login,authed} = require('../controllers/login_controller')

router.post('/',login,authed)

module.exports = router