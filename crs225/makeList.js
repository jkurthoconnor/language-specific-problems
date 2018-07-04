function makeList() {
  var items = [];            // items will be 'private' to the returned object

  return {                   // returning an object with multiple methods
    add: function(newItem) { // provides a clean api
      items.push(newItem);
      console.log(newItem + ' added!');
    },

    list: function() {
      items.forEach(function (item) {
        console.log(item);
      });
    },

    remove: function(rmItem) {
      var idx = items.indexOf(rmItem);
      items.splice(idx, 1);
      console.log(rmItem + ' removed!');
    },
  };
}

var list = makeList();

list.add('peas');
// peas added!
list.list();
// peas
list.add('corn');
// corn added!
list.list();
//peas
//corn
list.remove('peas');;
// peas removed!
list.list();
// corn
console.log(list.items);
// undefined
