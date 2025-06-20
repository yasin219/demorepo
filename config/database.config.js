

// module.exports = {
//     url: 'mongodb://172.31.2.39:27017/crud-node-express'

// }
require('dotenv').config();

module.exports = {
    url: process.env.DB_URL
};
