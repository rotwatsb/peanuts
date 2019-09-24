const path = require('path');

module.exports = {
    entry: path.resolve(__dirname, 'peanuts/src/entry.js'),
    output: {
        path: path.resolve(__dirname, 'peanuts/static'),
        filename: 'webpack.bundle.js'
    },
    module: {
        rules: [
            {
                test: /\.(js|jsx)$/,
                include: [
                    path.resolve(__dirname, "peanuts/src")
                ],
                use: {
                    loader: "babel-loader"
                }
            }
        ]
    }
};
