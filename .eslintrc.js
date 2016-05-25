module.exports = {
    "env": {
        "browser": true,
        "commonjs": true,
        "es6": true,
        "node": true,
        "shared-node-browser": true,
        "mocha": true,
        "jquery": true
    },
    "extends": "eslint:recommended",
    "installedESLint": true,
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
				"filenames",
				"mocha",
				"jsx-a11y",
				"babel",
				"promise",
				"smells",
				"require-path-exists",
				"node",
				"lodash",
				"react-native",
				"jsdoc",
				"json",
				"lodash-fp",
				"requirejs",
				"jsx-control-statements",
			  "should-promised",
			  "jquery",
			  "dependencies"	
    ],
    "rules": {
        "indent": [
            "error",
            4
        ],
        "linebreak-style": [
            "error",
            "unix"
        ],
        "quotes": [
            "error",
            "double"
        ],
        "semi": [
            "error",
            "always"
        ]
    }
};
