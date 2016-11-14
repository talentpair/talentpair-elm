
// import {DapperWigget} from "elm-src/Components/DapperWigget.elm";

export default ngModule => {

  ngModule.config(($stateProvider) => {

    $stateProvider
      .state("app", {
        url: "/",
        template: `Hello!`
      });
  });

};
