var mysql = require('mysql');
var db = require('./db_connection.js');

/* DATABASE CONFIGURATION */
var connection = mysql.createConnection(db.config);

exports.getAll = function(callback) {
    var query = 'CALL books_to_read_getall();';

    connection.query(query, function(err, result) {
        callback(err, result);
    });
};

exports.insert = function(params, callback) {
    var query = 'CALL books_to_read_add(?, ?);';

    var queryData = [params.user_id, params.book_id];

    connection.query(query, queryData, function(err, result) {
        callback(err, result);
    });
};