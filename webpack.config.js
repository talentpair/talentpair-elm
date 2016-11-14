var webpack = require("webpack");
var WebpackMd5Hash = require("webpack-md5-hash");
var JasmineWebpackPlugin = require("jasmine-webpack-plugin");
var path = require("path");
var _ = require("underscore");

var config = {
  context: __dirname,
  entry: {
    app: "./index.js"
  },
  output: {
    path: __dirname + "/dist",
    filename: "[name].entry.js"
  },

  plugins: [
    new webpack.IgnorePlugin(/^\.\/locale$/, [/moment$/]),
    new JasmineWebpackPlugin()
  ],

  module: {
    preLoaders: [
      { test: /\.json$/, loader: "json"}
    ],
    postLoaders: [],
    loaders: [
      {test: /\.css$/, loader: "style!css"},
      {test: /\.less$/, loader: "style!css!less", exclude: /node_modules/},
      {test: /\.(png|gif|jpg)$/, loader: "url-loader?limit=100000"},
      {test: /\.(ttf|eot|svg|woff(2)?)(\?[a-z0-9]+)?$/, loader: "file-loader"},
      {test: /\.html$/, loader: "ng-cache"},
      {
        test:    /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader:  'elm-webpack'
      },
      {
        test: /\.js$/,
        loader: "babel",
        query: {
          presets: ['es2015'],
          plugins: ['add-module-exports']
        },
        exclude: /node_modules/
      }
    ],
    
    noParse: /\.elm$/
  }

};

// DEV CONFIG
if (process.env.NODE_ENV === "dev") {
  // config.entry.spec = "./index-specrunner.js"; // Allows for Jasmine live reload during dev
  config.devtool = "source-map";

  config.resolve = {
    root: path.resolve(__dirname),
    alias: {
      "@talentpair/kyoto": process.env.HOME + "/dev/kyoto/index.js"
    }
  };
}

// TEST CONFIG (KARMA)
if (process.env.NODE_ENV === "test") {
  var directoriesForCoverage = [
    path.resolve("job-app/")
  ];
  config.module.postLoaders.push({
    test: /(js)$/,
    include: directoriesForCoverage,
    loader: "istanbul-instrumenter"
  });
}

// PROD CONFIG
if (process.env.NODE_ENV === "production") {

  config.output.filename = "bundle.[chunkhash].js";
  config.plugins.push(new webpack.optimize.UglifyJsPlugin());
  config.plugins.push(new webpack.optimize.OccurrenceOrderPlugin());
  config.plugins.push(new WebpackMd5Hash());

  config.devtool = "source-map";
  config.module.loaders.splice(5, 0, {
    test: /\.js$/,
    loader: "ng-annotate"
  });
}

module.exports = config;
