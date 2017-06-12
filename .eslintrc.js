module.exports = {
  "env": {
    "browser": true,
    "node": true,
    "commonjs": true,
    "shared-node-browser": true,
    "es6": true,
    "worker": true,
    "amd": true,
    "mocha": true,
    "jasmine": true,
    "jest": true,
    "phantomjs": true,
    "protractor": true,
    "qunit": true,
    "jquery": true,
    "prototypejs": true,
    "shelljs": true,
    "meteor": true,
    "mongo": true,
    "applescript": true,
    "nashorn": true,
    "serviceworker": true,
    "atomtest": true,
    "embertest": true,
    "webextensions": true,
    "greasemonkey": true
  },
  "extends": [
    "eslint:recommended",
    "plugin:react/recommended",
    "plugin:jsx-a11y/recommended",
    "plugin:lodash-fp/recommended",
    "plugin:jsx-control-statements/recommended"
  ],
  "installedESLint": true,
  "parser": "babel-eslint",
  "parserOptions": {
    "ecmaVersion": 6,
    "ecmaFeatures": {
      "experimentalObjectRestSpread": true,
      "jsx": true
    },
    "sourceType": "module"
  },
  "plugins": [
    "react",
    "html",
    "mocha",
    "jsx-a11y",
    "babel",
    "flow-vars",
    "promise",
    "smells",
    "require-path-exists",
    "node",
    "react-native",
    "json",
    "lodash-fp",
    "requirejs",
    "jsx-control-statements",
    "should-promised",
    "jquery",
    "dependencies"
  ],
  "rules": {
    "strict": 0, // babel-eslint says to do this
    "accessor-pairs": "error",
    "array-callback-return": "off",
    "block-scoped-var": "error",
    "complexity": "error",
    "consistent-return": "error",
    "curly": ["error", "multi-line"],
    "default-case": "error",
    "dot-location": ["error", "property"],
    "dot-notation": "error",
    "eqeqeq": "error",
    "guard-for-in": "error",
    "no-alert": "error",
    "no-caller": "error",
    "no-console": "warn",
    "no-div-regex": "error",
    "no-else-return": "error",
    "no-empty-function": "error",
    "no-eq-null": "error",
    "no-eval": "error",
    "no-extend-native": "error",
    "no-extra-bind": "error",
    "no-extra-label": "error",
    "no-floating-decimal": "error",
    "no-implicit-coercion": "warn",
    "no-implicit-globals": "error",
    "no-implied-eval": "error",
    "no-invalid-this": "error",
    "no-iterator": "error",
    "no-labels": "error",
    "no-lone-blocks": "error",
    "no-loop-func": "error",
    "no-magic-numbers": "warn",
    "no-multi-spaces": "warn",
    "no-multi-str": "error",
    "no-native-reassign": "error",
    "no-new": "error",
    "no-new-func": "error",
    "no-new-wrappers": "error",
    "no-octal-escape": "error",
    "no-param-reassign": "error",
    "no-proto": "error",
    "no-return-assign": ["warn", "except-parens"],
    "no-script-url": "error",
    "no-self-compare": "error",
    "no-sequences": "off",
    "no-throw-literal": "error",
    "no-unmodified-loop-condition": "error",
    "no-unused-expressions": ["error", { "allowShortCircuit": true, "allowTernary": true, "allowTaggedTemplates": true } ],
    "no-useless-call": "error",
    "no-unused-vars": ["error", { "vars": "local", "args": "after-used", "ignoreRestSiblings": false }],
    "no-useless-concat": "error",
    "no-useless-escape": "error",
    "no-void": "error",
    "no-warning-comments": "warn",
    "no-with": "error",
    "radix": "error",
    "vars-on-top": "error",
    "wrap-iife": "error",
    "yoda": "error",
    "init-declarations": "error",
    "no-catch-shadow": "error",
    "no-label-var": "error",
    "no-restricted-globals": "error",
    "no-shadow": "off",
    "no-shadow-restricted-names": "error",
    "no-undef-init": "error",
    "no-undefined": "error",
    "no-use-before-define": ["error", "nofunc"],
    "callback-return": "error",
    "global-require": "error",
    "handle-callback-err": "error",
    "no-mixed-requires": "error",
    "no-new-require": "error",
    "no-path-concat": "error",
    "no-process-env": "error",
    "no-process-exit": "error",
    "no-restricted-modules": "error",
    "no-sync": "warn",
    "array-bracket-spacing": ["off", "never", {"singleValue": true, "objectsInArrays": true, "arraysInArrays": true}],
    "block-spacing": "error",
    "brace-style": "error",
    "camelcase": "error",
    "comma-spacing": "error",
    "comma-style": "off",
    "computed-property-spacing": "error",
    "consistent-this": "error",
    "eol-last": "error",
    "func-names": "warn",
    "func-style": ["error", "declaration", {"allowArrowFunctions": true}],
    "id-blacklist": "error",
    "id-length": "warn",
    "id-match": "error",
    "indent": ["warn", 2],
    "jsx-quotes": "error",
    "key-spacing": ["warn", { "mode": "minimum" }],
    "keyword-spacing": "error",
    "linebreak-style": ["error", "unix"],
    "lines-around-comment": "off",
    "new-cap": "error",
    "new-parens": "error",
    "newline-after-var": "off",
    "newline-before-return": "warn",
    "newline-per-chained-call": "error",
    "no-array-constructor": "error",
    "no-bitwise": "error",
    "no-continue": "error",
    "no-inline-comments": "warn",
    "no-lonely-if": "error",
    "no-multiple-empty-lines": "error",
    "no-negated-condition": "warn",
    "no-nested-ternary": "warn",
    "no-new-object": "error",
    "no-plusplus": "warn",
    "no-restricted-syntax": "error",
    "no-spaced-func": "error",
    "no-ternary": "off",
    "no-trailing-spaces": "warn",
    "no-underscore-dangle": "error",
    "no-unneeded-ternary": "error",
    "no-whitespace-before-property": "error",
    "object-curly-spacing": "off",
    "object-property-newline": ["error", { "allowMultiplePropertiesPerLine": true } ],
    "one-var": "off",
    "one-var-declaration-per-line": ["off", "initializations"],
    "operator-assignment": "error",
    "operator-linebreak":[ "error", "before", { "overrides": { "?": "ignore", ":": "ignore" } }],
    "padded-blocks": ["off", "never"],
    "quote-props": ["error", "as-needed"],
    "quotes": ["warn", "double"],
    "require-jsdoc": "warn",
    "semi": ["error", "never"],
    "semi-spacing": "error",
    "sort-vars": "off",
    "space-before-blocks": "error",
    "no-mixed-spaces-and-tabs": "error",
    "space-before-function-paren": ["error", "never"],
    "space-in-parens": ["warn", "never", { "exceptions": ["{}", "[]", "()", "empty"] }],
    "space-infix-ops": ["off", {"int32Hint": true}],
    "space-unary-ops": "error",
    "spaced-comment": "off",
    "wrap-regex": "off",
    "arrow-body-style": "error",
    "arrow-parens": "off",
    "arrow-spacing": "error",
    "generator-star-spacing": "error",
    "no-confusing-arrow": ["warn", {"allowParens": false}],
    "no-useless-computed-key": "error",
    "no-useless-constructor": "error",
    "no-var": "error",
    "object-shorthand": "error",
    "prefer-arrow-callback": "error",
    "prefer-const": "error",
    "prefer-reflect": "error",
    "prefer-rest-params": "error",
    "prefer-spread": "error",
    "prefer-template": "error",
    "require-yield": "error",
    "sort-imports": "error",
    "template-curly-spacing": "error",
    "yield-star-spacing": "error",
    "mocha/no-exclusive-tests": "error",
    "mocha/no-skipped-tests": "error",
    "mocha/no-pending-tests": "error",
    "mocha/handle-done-callback": "error",
    "mocha/no-synchronous-tests": "error",
    "mocha/no-global-tests": "error",
    "jsx-a11y/accessible-emoji": "error",
    "jsx-a11y/alt-text": "error",
    "jsx-a11y/anchor-has-content": "error",
    "jsx-a11y/aria-activedescendant-has-tabindex": "error",
    "jsx-a11y/aria-props": "error",
    "jsx-a11y/aria-proptypes": "error",
    "jsx-a11y/aria-role": "error",
    "jsx-a11y/aria-unsupported-elements": "error",
    "jsx-a11y/click-events-have-key-events": "error",
    "jsx-a11y/heading-has-content": "error",
    "jsx-a11y/href-no-hash": "error",
    "jsx-a11y/html-has-lang": "error",
    "jsx-a11y/iframe-has-title": "error",
    "jsx-a11y/img-redundant-alt": "error",
    "jsx-a11y/interactive-supports-focus": "error",
    "jsx-a11y/label-has-for": "error",
    "jsx-a11y/lang": "error",
    "jsx-a11y/media-has-caption": "error",
    "jsx-a11y/mouse-events-have-key-events": "error",
    "jsx-a11y/no-access-key": "error",
    "jsx-a11y/no-autofocus": "error",
    "jsx-a11y/no-distracting-elements": "error",
    "jsx-a11y/no-interactive-element-to-noninteractive-role": "error",
    "jsx-a11y/no-noninteractive-element-interactions": "error",
    "jsx-a11y/no-noninteractive-element-to-interactive-role": "error",
    "jsx-a11y/no-noninteractive-tabindex": "error",
    "jsx-a11y/no-onchange": "error",
    "jsx-a11y/no-redundant-roles": "error",
    "jsx-a11y/no-static-element-interactions": "error",
    "jsx-a11y/role-has-required-aria-props": "error",
    "jsx-a11y/role-supports-aria-props": "error",
    "jsx-a11y/scope": "error",
    "jsx-a11y/tabindex-no-positive": "error",
    "babel/generator-star-spacing": "error",
    "babel/new-cap": "error",
    "babel/array-bracket-spacing": "off",
    "babel/object-curly-spacing": "off",
    "babel/object-shorthand": "error",
    "babel/arrow-parens": "error",
    "babel/no-await-in-loop": "error",
    "babel/flow-object-type": "error",
    "flow-vars/define-flow-type": "error",
    "flow-vars/use-flow-type": "error",
    "promise/param-names": "error",
    "promise/always-return": "error",
    "promise/catch-or-return": "error",
    "smells/no-switch": "error",
    "smells/no-complex-switch-case": "error",
    "smells/no-setinterval": "error",
    "smells/no-this-assign": "error",
    "smells/no-complex-string-concat": "error",
    "smells/no-complex-chaining": "warn",
    "require-path-exists/notEmpty": "error",
    "require-path-exists/tooManyArguments": "error",
    "require-path-exists/exists": "error",
    "node/no-missing-import": "error",
    "node/no-missing-require": "error",
    "node/no-unpublished-import": "error",
    "node/no-unpublished-require": "error",
    "node/no-unsupported-features": ["error", {"version": 6}],
    "node/process-exit-as-throw": "error",
    "node/shebang": "error",
    "react-native/no-unused-styles": "error",
    "react-native/split-platform-components": "error",
    "react-native/no-inline-styles": "error",
    "react-native/no-color-literals": "error",
    "requirejs/no-invalid-define": "error",
    "requirejs/no-multiple-define": "error",
    "requirejs/no-named-define": "error",
    "requirejs/no-commonjs-wrapper": "error",
    "should-promised/return-promise": "error",
    "jquery/no-ajax": "error",
    "jquery/no-attr": "error",
    "jquery/no-bind": "error",
    "jquery/no-class": "error",
    "jquery/no-clone": "error",
    "jquery/no-closest": "error",
    "jquery/no-css": "error",
    "jquery/no-data": "error",
    "jquery/no-deferred": "error",
    "jquery/no-delegate": "error",
    "jquery/no-each": "error",
    "jquery/no-filter": "error",
    "jquery/no-find": "error",
    "jquery/no-global-eval": "error",
    "jquery/no-has": "error",
    "jquery/no-html": "error",
    "jquery/no-in-array": "error",
    "jquery/no-is": "error",
    "jquery/no-map": "error",
    "jquery/no-merge": "error",
    "jquery/no-param": "error",
    "jquery/no-parent": "error",
    "jquery/no-parents": "error",
    "jquery/no-prop": "error",
    "jquery/no-proxy": "error",
    "jquery/no-serialize": "error",
    "jquery/no-sizzle": "error",
    "jquery/no-text": "error",
    "jquery/no-trigger": "error",
    "jquery/no-trim": "error",
    "jquery/no-val": "error",
    "jquery/no-wrap": "error",
    "dependencies/case-sensitive": "error",
    "dependencies/no-cycles": "error",
    "dependencies/no-unresolved": "error",
    "dependencies/require-json-ext": "error"
  }
};
