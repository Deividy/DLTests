var tds = require('tds');

var conn = new tds.Connection({
    host: '192.168.10.1',
    port: 1433,
    userName: 'deividy',
    password: '123456',
    database: 'TesteNode'
});

conn.connect(function(error) {
  if (error) {
    console.error('Received error', error);
  } else {
    console.log('Now connected, can start using');

    var stmt = conn.createStatement('SELECT users_id, login, pass FROM users');

    // Callback;
    stmt.on('row', function(row) {
      console.log("Login; "+row.getValue('login')+ " - Pass; "+row.getValue('pass'));
    });

    // Metadata;
    stmt.on('metadata', function(metadata) {
      for (column in metadata.columns) {
        console.log('Name: %s, Index: %d', 
              metadata.columns[column].name, 
              metadata.columns[column].index
        );
      }
    });

    // Execute;    
    stmt.execute();

/*  With paramets and without, it isnt working, 
    I really dont know why.. yet!

    // We can prepare the statement that way;
    stmt.prepare(function(err) {
      if (err) console.log('Received error', error);
      else { 
        console.log('Statement ready!');
        stmt.execute();
      }
    });
*/
    
  }

});
