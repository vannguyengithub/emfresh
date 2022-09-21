$(function(){
    init();
    // Click handlers
    $(document).on("click", ".btn[data-action]", function() {
  
      var $this = $(this);
      var sidebar_id = $this.attr('data-id');
      var action = $this.attr("data-action");
      var side = $this.attr("data-side");
  
      $(`#${sidebar_id} > .` + side).trigger("sidebar:" + action);
      return false;
    });
  
    function init() {
  
      let sidebars = $("[data-toggle=sidebar]");
  
      // Initialize sidebars
      for (var i = 0; i < sidebars.length; ++i) {
        var sidebar = sidebars[i];
        let sidebar_id = $(sidebar).data('id');
        let cSide = $(sidebar).data('side');
        $("#" + sidebar_id + ' .' + cSide).sidebar({ side: cSide });
      }
    }
})