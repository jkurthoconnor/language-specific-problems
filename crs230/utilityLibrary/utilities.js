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
