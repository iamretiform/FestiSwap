'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _react = require('react');

var _react2 = _interopRequireDefault(_react);

var _server = require('react-dom/server');

var _server2 = _interopRequireDefault(_server);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function handleGeneratorFunctionIssue(options) {
  var e = options.e,
      name = options.name;


  var msg = '';

  if (name) {
    var lastLine = 'A generator function takes a single arg of props (and the location for react-router) ' + 'and returns a ReactElement.';

    var shouldBeGeneratorError = 'ERROR: ReactOnRails is incorrectly detecting generator function to be false. The React\ncomponent \'' + name + '\' seems to be a generator function.\n' + lastLine;
    var reMatchShouldBeGeneratorError = /Can't add property context, object is not extensible/;
    if (reMatchShouldBeGeneratorError.test(e.message)) {
      msg += shouldBeGeneratorError + '\n\n';
      console.error(shouldBeGeneratorError);
    }

    shouldBeGeneratorError = 'ERROR: ReactOnRails is incorrectly detecting generatorFunction to be true, but the React\ncomponent \'' + name + '\' is not a generator function.\n' + lastLine;

    var reMatchShouldNotBeGeneratorError = /Cannot call a class as a function/;

    if (reMatchShouldNotBeGeneratorError.test(e.message)) {
      msg += shouldBeGeneratorError + '\n\n';
      console.error(shouldBeGeneratorError);
    }
  }

  return msg;
}

var handleError = function handleError(options) {
  var e = options.e,
      jsCode = options.jsCode,
      serverSide = options.serverSide;


  console.error('Exception in rendering!');

  var msg = handleGeneratorFunctionIssue(options);

  if (jsCode) {
    console.error('JS code was: ' + jsCode);
  }

  if (e.fileName) {
    console.error('location: ' + e.fileName + ':' + e.lineNumber);
  }

  console.error('message: ' + e.message);
  console.error('stack: ' + e.stack);

  if (serverSide) {
    msg += 'Exception in rendering!\n' + (e.fileName ? '\nlocation: ' + e.fileName + ':' + e.lineNumber : '') + '\nMessage: ' + e.message + '\n\n' + e.stack;

    var reactElement = _react2.default.createElement('pre', null, msg);
    return _server2.default.renderToString(reactElement);
  }

  return undefined;
};

exports.default = handleError;