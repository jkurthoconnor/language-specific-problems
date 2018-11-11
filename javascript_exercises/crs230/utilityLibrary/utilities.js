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
        var key;
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

      where: function(obj) {
        var holder = [];
        var key = Object.keys(obj); 

        arg.forEach(function(callerObj) {
          if (obj[key] === callerObj[key]) {
            holder.push(callerObj);
          }
        });

        return holder;
      },

      pluck: function(key) {
        var holder = [];

        arg.forEach(function(obj) {
          if (obj.hasOwnProperty(key)) {
            holder.push(obj[key]);
          }
        });

        return holder;
      },

      keys: function() {
        return Object.getOwnPropertyNames(arg);
      },

      values: function() {
        var holder = [];
        var keys = Object.getOwnPropertyNames(arg);

        keys.forEach(function(key) {
          holder.push(arg[key]);
        });

        return holder;
      },

      pick: function(properties) {
        var properties = Array.prototype.slice.call(arguments);
        var newObj = {};

        properties.forEach(function(property) {
          if (arg.hasOwnProperty(property)) {
            newObj[property] = arg[property];
          }
        });

        return newObj;
      },

      omit: function() {
        var toOmit = Array.prototype.slice.call(arguments);
        var newObj = {};
        var originalProperties = Object.getOwnPropertyNames(arg);

        originalProperties.forEach(function(property) {
          if (!toOmit.includes(property)) {
            newObj[property] = arg[property];
          }
        });

        return newObj;
      },

      has: function(property) {
        return property in arg;
      },

      isElement: function() {
        return _.isElement(arg);
      },

      isArray: function() {
        return _.isArray(arg);
      },

      isObject: function() {
        return _.isObject(arg);
      },

      isFunction: function() {
//        return _.isFunction(arg);
        _.isFunction.call(this, arg);
      },

      isString: function() {
        return _.isString(arg);
      },

      isNumber: function() {
        return _.isNumber(arg);
      },

      isBoolean: function() {
        return _.isBoolean(arg);
      },
    };

    return u;
  };

  _.isArray = function(value) {
    return Array.isArray(value);
  };

  _.isElement = function(value) {
      return value && value.nodeType === 1;
  };

  _.isObject = function(value) {
    return ['object', 'function'].includes(typeof value);
  };

  _.isFunction = function(value) {
    return (typeof value === 'function');
  };

  _.isString = function(value) {
    return (typeof value === 'string' || value instanceof String);
  };

  _.isNumber = function(value) {
    return (typeof value === 'number' || value instanceof Number);
  };

  _.isBoolean = function(value) {
    return (typeof value === 'boolean' || value instanceof Boolean);
  };

  _.extend = function() {
    function combineProperties(recipient, source) {
      var properties = Object.getOwnPropertyNames(source);

      properties.forEach(function(prop) {
        recipient[prop] = source[prop];
      });
    }

    var objects = Array.prototype.slice.call(arguments);
    var idx;

    for (idx = objects.length - 2; idx >= 0; idx -= 1) {
      combineProperties(objects[idx], objects[idx + 1]);
    }

    return objects[0];
  },

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

