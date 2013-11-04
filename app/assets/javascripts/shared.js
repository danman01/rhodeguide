$(function(){
  if ($("#load_backstretch").length != 0){
    // load backstretch
     $.backstretch([
      "http://upload.wikimedia.org/wikipedia/commons/d/d3/Harvard_yard_winter_2009j.JPG",
      "http://upload.wikimedia.org/wikipedia/commons/4/43/Bar-P1030319.jpg",
      "http://photos1.usa-pictures.com/pictures/USA/NY/USA-New-york-New%20York-2651247-071.jpg",
      "http://photos1.usa-pictures.com/pictures/USA/NY/USA-New-york-New%20York-0--43823362-.jpg"
      ], {
          fade: 3000,
          duration: 5000
      });
   }
})

