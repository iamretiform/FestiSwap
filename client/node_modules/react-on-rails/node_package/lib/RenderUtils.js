'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = {
  wrapInScriptTags: function wrapInScriptTags(scriptId, scriptBody) {
    if (!scriptBody) {
      return '';
    }

    return '\n<script id="' + scriptId + '">\n' + scriptBody + '\n</script>';
  }
};