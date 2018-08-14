var inventory;

(function() {
  var index = 0;

  inventory = {

    collection: [],

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
      newItem.id = index++;
      this.collection.push(newItem);
    },

    updateCollection: function(data) {
      var item = this.collection[data.idx];
      var category = data.category;
      var value = data.value;

      category = category.match(/^s/) ? 'stockNumber' : category;

      if (category === 'quantity') {
        value = Number(value);
      }

      if (value !== undefined) {
        item[category] = value;
      }
    },

    alterRowID: function(rowTemplate) {
      return rowTemplate.replace(/ID/g, index);
    },

    setListeners: function() {
        var $inventoryTable = $('#inventory');

        $('#add_item').on('click', function(e) {
          $inventoryTable.append(inventory.alterRowID(inventory.template));
          inventory.addToCollection();
        });

        $inventoryTable.on('click', 'td > a.delete', function(e) {
          e.preventDefault();

          var $row = $(this).closest('tr').remove();
          var itemIdx = Number($row.find('input[type="hidden"]').val());

          inventory.collection.splice(itemIdx, 1);
        });

        $inventoryTable.on('blur', 'input', function(e) {
          var input = $(this).attr('name').split(/_/g);
          var itemIdx = Number(input.slice(-1)[0]);
          var itemCategory = input.slice(1, 2)[0];
          var itemValue = $(this).val().trim();

          inventory.updateCollection({idx: itemIdx, category: itemCategory, value: itemValue});
        });
      },

    init: function() {
      this.setDate();
      this.setTemplate();
      this.setListeners();
    },
  };
})();

$(inventory.init.bind(inventory));

