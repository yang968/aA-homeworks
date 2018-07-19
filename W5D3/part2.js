function printCallback(names) {
  names.forEach(name => console.log(name));
}

function titleize(names, callback) {
  update = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);

  callback(update)
}

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = () => {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!`);
}

Elephant.prototype.grow = function() {
  this.height += 12;
}

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
}

Elephant.prototype.play = () => {
  trick = Math.floor(Math.random(this.tricks.length + 1));
  console.log(`${this.name} is ${this.tricks[trick]}`);
}
