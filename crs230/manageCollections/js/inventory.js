var inventory;

(function() {
  inventory = {

    collection: [],

    setDate: function() {
      var date = new Date();
      $('#order_date').text(date.toDateString());

    },

    template: '',

    setTemplate: function() {
      var $template = $('#inventory_item');
      this.template = $template.text().trim();
      $template.remove();
    },

    init: function() {
      this.setDate();
      this.setTemplate();
    },
  };
})();


$(inventory.init.bind(inventory));
