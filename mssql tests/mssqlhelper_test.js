var db = require('mssqlhelper');

db.config({
    host: '192.168.10.1'
    ,port: 1433
    ,userName: 'deividy'
    ,password: '123456'
    ,database:'TesteNode'
});

db.query(
    'select * FROM users',{ },
     function(res){
        if(res.err)throw new Error('database error:'+res.err.msg);
        var rows = res.tables[0].rows;
        for (var i = 0; i < rows.length; i++) {
            console.log(rows[i].getValue(0)+' - '+rows[i].getValue(1)+' - '+rows[i].getValue(2));
        }
    }
);

console.log("Hello world!");
