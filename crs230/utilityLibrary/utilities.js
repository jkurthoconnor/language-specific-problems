(function() {
  var _ = function(arg) {
    var u = {
      first: function() {
        return arg[0];
      },

      last: function() {
        return arg[arg.length - 1];
      },

      without: function(toRemove) {
        var removeList = Array.prototype.slice.call(arguments);

        return arg.filter(function(ele) {
          return !removeList.includes(ele);
        });
      },

      lastIndexOf: function(value) {
        var idx;

        for (idx = arg.length - 1; idx >= 0; idx -= 1) {
          if (arg[idx] === value) {
            return idx;
          }
        }
      },

      sample: function(n) {
        var idx;
        var samples = [];
        var copy = arg.slice();
        
        while (samples.length < (n || 1)) {
          idx = Math.floor(Math.random() * copy.length);
          samples.push(arg.splice(idx, 1)[0]);
        }

        return n ? samples : samples[0];
      },

      findWhere: function(obj) {
        var idx;
        var targetKey = 0;
        var keys = Object.keys(obj);

        for (idx = 0; idx < arg.length; idx += 1) {

          for (targetKey = 0; targetKey < keys.length; targetKey += 1) {
            if (arg[idx][keys[targetKey]] !== obj[keys[targetKey]]) {
              break;
            }
          }

          if (targetKey === keys.length) { // placed here (not at top
            return arg[idx];              // of `idx` loop b/c it must
          }                               // be checked before the last
       }                                 // b/f `idx` loop ends to
                                         // catch match on last obj
        return undefined;
      },
    };

    return u;
  };

  _.range = function(n1, n2) {
    var result = [];
    var start = 0;
    var stop = n1;

    if (n2) {
      start = n1;
      stop = n2;
    }
    
    while (start < stop) {
      result.push(start);
      start += 1;
    }

    return result;
  };

  window._ = _;
})();


console.log(_([1, 2, 3]).first());
console.log(_.range(1, 5));


var dict = [{ foo: "bar", quux: "q", idx: 0 }, { foo: "baz", quux: "z", idx: 1 }, { foo: "bar", quux: "z", idx: 2 }];

console.log(_(dict).findWhere({foo: 'bar', quux: 'z'}));
