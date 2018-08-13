var inventory;

(function() {

  var id = 0;

  inventory = {

    collection: [],

    lastId: 0,

    setDate: function() {
      var date = new Date();
      $('#order_date').text(date.toDateString());

    },

    template: '',

    setTemplate: function() {
      var $template = $('#inventory_item').remove();
      this.template = $template.html();
    },

    item: {
      id: 0,
      name: '',
      stockNumber: '',
      quantity: 1,
    },

    addToCollection: function() {
      var newItem = Object.create(this.item);
      newItem.id = id++;
      this.lastId = id;
      this.collection.push(newItem);
    },

    alterRowID: function(rowTemplate) {
      return rowTemplate.replace(/ID/g, this.lastId);
    },

    init: function() {
      this.setDate();
      this.setTemplate();
    },
  };
})();


$(inventory.init.bind(inventory));

$(function(e) {
  var $inventoryTable = $('#inventory');

  $('#add_item').on('click', function(e) {
    $inventoryTable.append(inventory.alterRowID(inventory.template));
    inventory.addToCollection();
  });

  $inventoryTable.on('click', 'td > a.delete', function(e) {
    e.preventDefault();

    var $row = $(this).closest('tr').remove();
    var collectionIdx = $row.find('input[type="hidden"]').val();

    inventory.collection.splice(collectionIdx, 1);
  });

});

