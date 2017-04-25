'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _stringify = require('babel-runtime/core-js/json/stringify');

var _stringify2 = _interopRequireDefault(_stringify);

exports.consoleReplay = consoleReplay;
exports.default = buildConsoleReplay;

var _RenderUtils = require('./RenderUtils');

var _RenderUtils2 = _interopRequireDefault(_RenderUtils);

var _scriptSanitizedVal = require('./scriptSanitizedVal');

var _scriptSanitizedVal2 = _interopRequireDefault(_scriptSanitizedVal);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function consoleReplay() {
  // console.history is a global polyfill used in server rendering.
  if (!(console.history instanceof Array)) {
    return '';
  }

  var lines = console.history.map(function (msg) {
    var stringifiedList = msg.arguments.map(function (arg) {
      var val = void 0;
      try {
        val = typeof arg === 'string' || arg instanceof String ? arg : (0, _stringify2.default)(arg);
      } catch (e) {
        val = e.message + ': ' + arg;
      }

      return (0, _scriptSanitizedVal2.default)(val);
    });

    return 'console.' + msg.level + '.apply(console, ' + (0, _stringify2.default)(stringifiedList) + ');';
  });

  return lines.join('\n');
}

function buildConsoleReplay() {
  return _RenderUtils2.default.wrapInScriptTags('consoleReplayLog', consoleReplay());
}