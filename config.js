const mysql = require('mysql');

const db_conn = mysql.createConnection(
    {
        host:'localhost',
        user:'test_code_geo',
        password:'code',
        database:'db_test'
    }
)

db_conn.connect((err) => {
    if(err)console.log(err);
})

module.exports = db_conn;