
export default ngModule => {

  ngModule.controller("JobAppController", function JobAppController() {

    const $ctrl = this;

    $ctrl.init = function init() {
      console.log("here");
    };
    
    $ctrl.init();

  });
};
