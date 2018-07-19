var madlib = function(verb, adjective, noun) {
  return 'We shall ' + verb.toUpperCase() + ' the ' + adjective.toUpperCase() + ' ' + noun.toUpperCase();
}

function isSubstring(searchString, substring) {
  return searchString.includes(substring)
}

function fizzbuzz(array) {
  result = [];
  for(var i = 0; i < array.length; i++) {
    if (array[i] % 3 == 0 && array[i] % 5 == 0) {
      continue;
    }
    else if (array[i] % 3 == 0 || array[i] % 5 == 0) {
      result.push(array[i]);
    }
  }
  return result;
}

var isPrime = (num) => {
  if (num == 2) return true;
  for (var i = 2; i < num; i++) {
    if (num % i == 0) return false;
  }

  return true
}

var sumOfNPrimes = (n) => {
  sum = 0;
  if (n == 0) return sum;

  var count = 0;
  for (var i = 2; count < n; i++) {
    if (isPrime(i)) {
      sum += i;
      count++;
    }
  }

  return sum;
}
