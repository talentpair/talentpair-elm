
const jobApp = angular.module("jobApp", ["ui.router"]);

require("./job-app.routes")(jobApp);
require("./job-app.controller")(jobApp);
module.exports = jobApp;
