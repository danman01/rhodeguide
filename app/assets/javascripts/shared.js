$(function(){
  if ($("#load_backstretch").length != 0){
    // load backstretch
     $.backstretch([
      "http://photos1.usa-pictures.com/pictures/USA/CA/USA-California-San%20Francisco-2--98161248-.jpg",
      "http://photos1.usa-pictures.com/pictures/USA/NY/USA-New-york-Corning-36318638-IMG.jpg",
      "http://photos1.usa-pictures.com/pictures/USA/NY/USA-New-york-New%20York-2651247-071.jpg",
      "http://photos1.usa-pictures.com/pictures/USA/NY/USA-New-york-New%20York-0--43823362-.jpg"
      ], {
          fade: 3000,
          duration: 5000
      });
   }
})

