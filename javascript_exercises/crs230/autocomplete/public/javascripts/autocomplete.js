function Autocomplete(inputEle, url) {
  this.input = inputEle;
  this.url = url;

  this.matches = [];
  this.overlay = null;
  this.listUI = null;
  this.visible = false;
  this.selectedIndex = null;
  this.previousValue = null;

  this.valueChanged = debounce(this.valueChanged.bind(this), 300);
  this.wrapInput();
  this.createUI();
  this.bindEvents();
  this.reset();
};

Autocomplete.prototype.wrapInput = function() {
  var wrapper = document.createElement('div');
  wrapper.classList.add('autocomplete-wrapper');
  this.input.parentNode.appendChild(wrapper);
  wrapper.appendChild(this.input);
};

Autocomplete.prototype.createUI = function() {
  var listUI = document.createElement('ul');
  listUI.classList.add('autocomplete-ui');
  this.input.parentNode.appendChild(listUI);
  this.listUI = listUI;

  var overlay = document.createElement('div');
  overlay.classList.add('autocomplete-overlay');
  overlay.style.width = this.input.clientWidth + 'px';

  this.input.parentNode.appendChild(overlay);
  this.overlay = overlay;
};

Autocomplete.prototype.bindEvents = function() {
  this.input.addEventListener('input', this.valueChanged.bind(this));
  this.input.addEventListener('keydown', this.handleKeydown.bind(this));
  document.querySelector('.autocomplete-ui').addEventListener('mousedown', this.handleMouseSelect.bind(this));
};

 Autocomplete.prototype.handleMouseSelect = function(e) {
  this.input.value = e.target.textContent;
  this.reset();
};

Autocomplete.prototype.handleKeydown = function(e) {
  switch(e.key) {
    case 'ArrowDown':
      e.preventDefault();
      if (this.selectedIndex === null || this.selectedIndex === this.matches.length - 1) {
        this.selectedIndex = 0;
      } else {
        this.selectedIndex += 1;
      }
      this.bestMatchIndex = null;
      this.draw();
      break;

    case 'ArrowUp':
      e.preventDefault();
      if (this.selectedIndex === null || this.selectedIndex === 0) {
        this.selectedIndex = this.matches.length - 1;
      } else {
        this.selectedIndex -= 1;
      }
      this.bestMatchIndex = null;
      this.draw();
      break;

    case 'Tab':
      if (this.bestMatchIndex !== null) {
        this.input.value = this.matches[this.bestMatchIndex].name;
        e.preventDefault();
      }
      this.reset();
      break;

    case 'Enter':
      this.reset();
      break;

    case 'Escape':
      this.input.value = this.previousValue;
      this.reset();
      break;
  }
};

Autocomplete.prototype.valueChanged = function() {
  var value = this.input.value;
  this.previousValue = value;

  if (value.length > 0) {
    this.fetchMatches(value, function(matches) {
      this.visible = true;
      this.matches = matches;
      this.bestMatchIndex = 0;
      this.selectedIndex = null;
      this.draw();
    }.bind(this));
  } else {
    this.reset();
  }
};

Autocomplete.prototype.fetchMatches = function(query, callback) {
  var request = new XMLHttpRequest();

  request.addEventListener('load', function() {
    callback(request.response);
  }.bind(this));

  request.open('GET', this.url + encodeURIComponent(query));
  request.responseType = 'json';
  request.send();
};

Autocomplete.prototype.draw = function() {
  var child;
  while (child = this.listUI.lastChild) {
    this.listUI.removeChild(child);
  }

  if (!this.visible) {
    this.overlay.textContent = '';
    return;
  }

  if (this.bestMatchIndex !== null) {
    var selected = this.matches[this.bestMatchIndex];
    this.overlay.textContent = selected.name;
  } else {
    this.overlay.textContent = '';
  }

  this.matches.forEach(function(match, idx) {
    var li = document.createElement('li');

    if (idx === this.selectedIndex) {
      li.classList.add('selected');
      this.input.value = match.name;
    }

    li.classList.add('autocomplete-ui-choice');
    li.textContent = match.name;

    this.listUI.appendChild(li);
  }.bind(this));
};

Autocomplete.prototype.reset = function(query, callback) {
  this.visible = false;
  this.bestMatchIndex = null;
  this.matches = [];

  this.draw();
};
