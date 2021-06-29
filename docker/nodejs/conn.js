var mysql = require('mysql');

var con = mysql.createConnection({
  host: "172.17.0.2",
  user: "root",
  password: "123456789",
  database: "nodejs_api"
});

con.connect(function (err){mysql
    if(err) throw err;
});

module.exports = con;
