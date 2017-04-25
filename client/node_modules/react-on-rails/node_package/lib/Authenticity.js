'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _assign = require('babel-runtime/core-js/object/assign');

var _assign2 = _interopRequireDefault(_assign);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

exports.default = {
  authenticityToken: function authenticityToken() {
    var token = document.querySelector('meta[name="csrf-token"]');
    if (token && token instanceof window.HTMLMetaElement) {
      return token.content;
    }
    return null;
  },
  authenticityHeaders: function authenticityHeaders() {
    var otherHeaders = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};

    return (0, _assign2.default)(otherHeaders, {
      'X-CSRF-Token': this.authenticityToken(),
      'X-Requested-With': 'XMLHttpRequest'
    });
  }
};