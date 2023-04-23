const jwt = require("jsonwebtoken");
module.exports = {
    checkToken: (req, res, next) => {
        let token = req.get("authorization");
        if (token) {
            // Remove Bearer from string
            token = token.slice(7);
            jwt.verify(token, process.env.JWT_KEY, (err, decoded) => {
                if (err) {
                    return res.json({
                        success: 0,
                        message: "Invalid Token..."
                    });
                } else {
                    req.decoded = decoded;
                    next();
                }
            });
        } else {
            return res.json({
                success: 0,
                message: "Access Denied! Unauthorized User"
            });
        }
    }
};
// const jwt = require('jsonwebtoken');
// const {decode} = require("jsonwebtoken");
//
// //Check user token
//  function checkToken(header) {
//      let token = header.get("authorization");
//      if (token) {
//          //Remove Bearer from String
//          token.slice(7);
//          jwt.verify(token, process.env.JWT_KEY, (err, decoded) => {
//             if (err) {
//                 return "invalid token";
//             }else {
//                 header.decoded = decoded;
//             }
//          });
//      }else {
//          return "Acess Denied! Unauthorized User";
//      }
//  }
//
//
//
// module.exports = checkToken;