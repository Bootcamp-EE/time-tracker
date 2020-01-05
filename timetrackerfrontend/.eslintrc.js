module.exports = {
    parser: "@typescript-eslint/parser",
    parserOptions: {
        project: './tsconfig.json'
    },
    env: {
        browser: true,
        jest: true
    },
    extends: [
        "airbnb",
        "plugin:react/recommended",
        "plugin:@typescript-eslint/recommended",
        "plugin:prettier/recommended",
        "prettier/@typescript-eslint",
        "plugin:jest/recommended",
        "plugin:testing-library/react",
    ],
    parserOptions: {
        ecmaVersion: 2015,
        sourceType: "module"
    },
    rules: {
        "react/jsx-filename-extension": [1, { "extensions": [".tsx", ".jsx"] }],
        "import/extensions": ["error", "ignorePackages", {
            "js": "never",
            "jsx": "never",
            "ts": "never",
            "tsx": "never",
            "mjs": "never"
        }],
        '@typescript-eslint/explicit-function-return-type': [
            'error',
            {
                allowExpressions: true
            }
        ],
        "@typescript-eslint/no-unused-vars": "error",
        "no-useless-constructor": "off",
        "@typescript-eslint/no-useless-constructor": "error",
        "testing-library/await-async-query": "error",
        "testing-library/no-await-sync-query": "error",
        "testing-library/no-debug": "warn",
    },
    settings: {
        "import/extensions": [".js", ".jsx", ".ts", ".tsx"],
        "import/parsers": {
            "@typescript-eslint/parser": [".ts", ".tsx"]
        },
        "import/resolver": {
            "node": {
                "extensions": [".js", ".jsx", ".ts", ".tsx"]
            }
        },
        "react": {
            "version": "detect"
        }
    }
}