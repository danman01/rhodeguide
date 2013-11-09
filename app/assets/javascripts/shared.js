$(function(){
  if ($("#load_backstretch").length != 0){
    // load backstretch
     $.backstretch([
      "http://upload.wikimedia.org/wikipedia/commons/d/d3/Harvard_yard_winter_2009j.JPG",
      "http://2.bp.blogspot.com/-5e_io9MHosY/UnA47SLpMbI/AAAAAAAAAEQ/WsWs0IabZWg/s1600/Breakers_drive_view.jpg",
      "http://photos1.usa-pictures.com/pictures/USA/NY/USA-New-york-New%20York-2651247-071.jpg",
      "http://upload.wikimedia.org/wikipedia/commons/4/4e/Bierley_Newport_Road_snow_and_sunset.JPG",
      "http://photos1.usa-pictures.com/pictures/USA/NY/USA-New-york-New%20York-0--43823362-.jpg"
      ], {
          fade: 3000,
          duration: 5000
      });
   }
})

