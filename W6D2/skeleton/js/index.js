console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
  method: "GET",
  url: "http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b",
  success(data) {
    console.log(data);
  },
  error() {
    console.log("Error");
  }
})

// Add another console log here, outside your AJAX request
console.log("2nd console log");

/*
  Request sent at $.ajax call.
  2nd console log was called and then the console received data from the ajax call as this is
  asynchronous.
  Current temperature is 297.98 degrees
  The page did not refresh

*/
