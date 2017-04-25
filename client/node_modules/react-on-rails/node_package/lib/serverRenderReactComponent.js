'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _stringify = require('babel-runtime/core-js/json/stringify');

var _stringify2 = _interopRequireDefault(_stringify);

exports.default = serverRenderReactComponent;

var _server = require('react-dom/server');

var _server2 = _interopRequireDefault(_server);

var _ComponentRegistry = require('./ComponentRegistry');

var _ComponentRegistry2 = _interopRequireDefault(_ComponentRegistry);

var _createReactElement = require('./createReactElement');

var _createReactElement2 = _interopRequireDefault(_createReactElement);

var _isCreateReactElementResultNonReactComponent = require('./isCreateReactElementResultNonReactComponent');

var _isCreateReactElementResultNonReactComponent2 = _interopRequireDefault(_isCreateReactElementResultNonReactComponent);

var _buildConsoleReplay = require('./buildConsoleReplay');

var _buildConsoleReplay2 = _interopRequireDefault(_buildConsoleReplay);

var _handleError = require('./handleError');

var _handleError2 = _interopRequireDefault(_handleError);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function serverRenderReactComponent(options) {
  var name = options.name,
      domNodeId = options.domNodeId,
      trace = options.trace,
      props = options.props,
      railsContext = options.railsContext;


  var htmlResult = '';
  var hasErrors = false;

  try {
    var componentObj = _ComponentRegistry2.default.get(name);
    if (componentObj.isRenderer) {
      throw new Error('Detected a renderer while server rendering component \'' + name + '\'. See https://github.com/shakacode/react_on_rails#renderer-functions');
    }

    var reactElementOrRouterResult = (0, _createReactElement2.default)({
      componentObj: componentObj,
      domNodeId: domNodeId,
      trace: trace,
      props: props,
      railsContext: railsContext
    });

    if ((0, _isCreateReactElementResultNonReactComponent2.default)(reactElementOrRouterResult)) {
      // We let the client side handle any redirect
      // Set hasErrors in case we want to throw a Rails exception
      hasErrors = !!reactElementOrRouterResult.routeError;

      if (hasErrors) {
        console.error('React Router ERROR: ' + (0, _stringify2.default)(reactElementOrRouterResult.routeError));
      }

      if (reactElementOrRouterResult.redirectLocation) {
        if (trace) {
          var redirectLocation = reactElementOrRouterResult.redirectLocation;
          var redirectPath = redirectLocation.pathname + redirectLocation.search;
          console.log('ROUTER REDIRECT: ' + name + ' to dom node with id: ' + domNodeId + ', redirect to ' + redirectPath);
        }
        // For redirects on server rendering, we can't stop Rails from returning the same result.
        // Possibly, someday, we could have the rails server redirect.
      } else {
        htmlResult = reactElementOrRouterResult.renderedHtml;
      }
    } else {
      htmlResult = _server2.default.renderToString(reactElementOrRouterResult);
    }
  } catch (e) {
    hasErrors = true;
    htmlResult = (0, _handleError2.default)({
      e: e,
      name: name,
      serverSide: true
    });
  }

  var consoleReplayScript = (0, _buildConsoleReplay2.default)();

  return (0, _stringify2.default)({
    html: htmlResult,
    consoleReplayScript: consoleReplayScript,
    hasErrors: hasErrors
  });
}