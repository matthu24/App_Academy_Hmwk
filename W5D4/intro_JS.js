function madlib(arg1,arg2,arg3){
  return `We shall ${arg1.toUpperCase()} the ${arg2.toUpperCase()} ${arg3.toUpperCase()}`
}

function isSubstring(phrase,subphrase) {
  return phrase.includes(subphrase);
}

function fizzBuzz(array) {
  const result = [];
  array.forEach(el => {
    if ((el%3===0) ^ (el % 5 ===0)){
      result.push(el);
    }
  });
  return result;
}

function isPrime(n) {
  if (n < 2){return false;}
  for(let i = 2; i < n ;i++){
    if(n % i === 0) {
      return false;
    }
  }
  return true;

}




function titleize(names, callback) {
  let titleized = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  callback(titleized);
};

// invoking the function
titleize(["Mary", "Brian", "Leo"], (names) => {
  names.forEach(name => console.log(name));
});

// Phase II - Constructors, Prototypes, and `this`

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function () {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
};

Elephant.prototype.grow = function () {
  this.height = this.height + 12;
};

Elephant.prototype.addTrick = function (trick) {
  this.tricks.push(trick);
};

Elephant.prototype.play = function () {
  trickIndex = Math.floor(Math.random() * this.tricks.length);
  console.log(`${this.name} is ${this.tricks[trickIndex]}!`);
};


function sumOfPrimes(n) {
  let sum = 0;
  let count = 0;
  let i = 0;
  while(count < n){
    if(isPrime(i)){
      sum+=i;
      count++;
    }
    i++;
  }
  return sum;
}
