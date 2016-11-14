
import {DapperWigget} from "elm-src/Components/DapperWigget.elm";

export default ngModule => {

  ngModule.config(($stateProvider) => {

    $stateProvider
      .state("app", {
        url: "*path",
        controller: function JobAppController($scope) {
          $scope.widgetComponent = DapperWigget;
          $scope.widgetFlags = { phrase: "Here's my phrase" };
        },
        template: `<elm-component src="widgetComponent" flags="widgetFlags"></elm-component>`
      });
  });

};
