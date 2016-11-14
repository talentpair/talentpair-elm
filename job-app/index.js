
const jobApp = angular.module("jobApp", ["ui.router"]);

require("./job-app.routes")(jobApp);
module.exports = jobApp;
