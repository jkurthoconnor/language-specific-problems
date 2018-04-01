var bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

function processBands(data) {
  return data.map(function (band) {
    var name = band['name'].replace(/(\.)/, '').split(' ').map(function (word) {
      return word[0].toUpperCase() + word.slice(1);
    }).join(' ');
    var country = 'Canada';
    var active = band['active'];

    return { name, country, active }; // destructuring magic!
  });
}

console.log(processBands(bands));

// should return:
[
  { name: 'Sunset Rubdown', country: 'Canada', active: false },
  { name: 'Women', country: 'Canada', active: false },
  { name: 'A Silver Mt Zion', country: 'Canada', active: true },
]

console.log(bands);

