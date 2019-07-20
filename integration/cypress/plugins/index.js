const cypressTypeScriptPreprocessor = require("./cy-ts-preprocessor.js");

module.exports = on => {
  on("file:preprocessor", cypressTypeScriptPreprocessor);
};
