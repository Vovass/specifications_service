const { environment } = require('@rails/webpacker')
const webpack = require("webpack")

// environment.plugins.append("Provide", new webpack.ProvidePlugin({
//     $: 'jquery',
//     jQuery: 'jquery',
//     Poper: ['poper.js','default']
// }))

module.exports = environment
