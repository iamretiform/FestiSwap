"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = isResultNonReactComponent;
function isResultNonReactComponent(reactElementOrRouterResult) {
  return !!(reactElementOrRouterResult.renderedHtml || reactElementOrRouterResult.redirectLocation || reactElementOrRouterResult.error);
}