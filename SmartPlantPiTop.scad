
//
// Main Plante for PiSmartPlant
// 011217-01
//
// main base 190 x 86
MaxX = 175;
MaxY = 90;

module fitbox(x, y)

{
    
    difference()
    {
        cube([x+2,y+2,7]);
        
        translate([1,1,3])
        cube([x,y,6]);
        
    }
    
    
}


module PlaceFitBox(x,y,xloc,yloc)
{
    translate([xloc,yloc])
fitbox(x, y);
    
}

$fn =400;

module PlaceGroveHole(xloc, yloc)
{
    translate([xloc,yloc,-20])
    cube([12.25,6.5,50]);

}

module VPlaceGroveHole(xloc, yloc)
{
    translate([xloc,yloc,-20])
    cube([7.5,12.25,50]);

}

difference()
{

union()
{
// start of base
cube ([MaxX,MaxY,3]);


// Place blocks for testing

// OLED
PlaceFitBox(29,34,10,MaxY-42);

// TH
PlaceFitBox(29.5,28.7,78,MaxY-42+6.5);
   

// Sun
PlaceFitBox(24,20.5,78+40+10+5,MaxY-42+10);

// Dial

PlaceFitBox(36.5,16.75,3,10);

// But
PlaceFitBox(24,20,10+34,10);


// I2C Mux  
PlaceFitBox(44,25.5 ,10+34+24+10,10);


// Air Quality Sensor
 PlaceFitBox(24.25-0.25,42-0.25,10+34+24+10+44+10,10);

/*
// leg boxes
translate([1,1,0])
cube([8,8,12]);


translate([MaxX-9,1,0])
cube([8,8,12]);

translate([1,MaxY-9,0])
cube([8,8,12]);

translate([MaxX-9,MaxY-9,0])
cube([8,8,12]);
*/
}


// Grove Holes

// OLED

PlaceGroveHole(10+29/2-4.5, MaxY-10-5);
// TH

VPlaceGroveHole(68, MaxY-42+16);
// Sun
PlaceGroveHole(78+40+10+12+0.5, MaxY-10);

// Dial
VPlaceGroveHole(10+22.5, 10+2.5);
VPlaceGroveHole(4, 10+2.5);
// But
PlaceGroveHole(10+12+11+24-4.5-1, 10+14);
// I2C Mux (3)
PlaceGroveHole(10+12+10+24+30-4.5+1, 10+20-4.5+6+6+2);
PlaceGroveHole(10+12+10+24+55-4.5+1, 4-1);
PlaceGroveHole(10+12+10+24+30-4.5+1, 4-1);

// Air Q
PlaceGroveHole(10+12+10+24+72+16-5.5, 4-1);
// leg holes


HoleSize = 6.125;

translate([2,2,-1])
cube([HoleSize,HoleSize,20]);

translate([MaxX-8,2,-1])
cube([HoleSize,HoleSize,20]);

translate([2,MaxY-8,-1])
cube([HoleSize,HoleSize,20]);

translate([MaxX-8,MaxY-8,-1])
cube([HoleSize,HoleSize,20]);
/*
// for test cubing

// block 1

#translate([-135,40,-10])
cube([200,60,100]);

#translate([115,40,-10])
cube([200,60,100]);
// block 2

#translate([0,-10,-10])
cube([200,60,100]);
*/
}
