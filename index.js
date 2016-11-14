// GLOBALS
import "moment";
import "expose?$!expose?jQuery!jquery";
import "expose?angular!angular";
import "expose?_!underscore";
import "expose?moment!moment-timezone";

import "angular-cookies";


// angular material dep chain
import "angular-animate";
import "angular-aria";
import "angular-messages";
import "angular-material";

import "angular-sanitize";
import "angular-ui-router";
import "angular-moment";

// TALENTPAIR APPS
import "./job-app";
import "angular-elm-components"
import "./elm-src";


// MAIN APP DEFINITION
const tpElmApp = angular.module("tpElmApp", [

  // Core Modules
  "ngCookies",
  "ngAnimate",
  "ngSanitize",
  "ngAria",

  // Talentpair Apps
  "jobApp",

  // Third-Party Modules
  "ui.router",
  "angularMoment",
  "angularElmComponents",
  "ngMaterial"

]);
