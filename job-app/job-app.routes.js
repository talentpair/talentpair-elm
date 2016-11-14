
// import {DapperWigget} from "elm-src/Components/DapperWigget.elm";

export default ngModule => {

  ngModule.config(($stateProvider) => {

    $stateProvider
      .state("app", {
        url: "*path",
        controller: "jobAppController",
        controllerAs: "$ctrl",
        template: `Hello!`
      });
  });

};
