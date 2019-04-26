//Array of vectors
ArrayList<dot> dots = new ArrayList<dot>();
//Amount of vectors that later is translated into triangles
int num=100;

void setup() {
  background(255);
  size(800, 800);

  for (int i=0; i<num; i++) {
    // . dot() is the escalar product of two vectors
    dot d=new dot();
    //Adds d to the vector dots, which is an array
    dots.add(d);
  }
}

void draw() {
  noStroke();
  fill(255);
  rect(0, 0, width, height);


  for (int i=0; i<dots.size(); i++) { //.size() gets the length of the array
    dot d1 = dots.get(i); //returns the color of the vector from the array list
    d1.update();
    d1.display();
    for (int j=i+1; j<dots.size(); j++) {
      dot d2=dots.get(j);
      if (dist(d1.x, d1.y, d2.x, d2.y)<100) {
        for (int k=j+1; k<dots.size(); k++) {
          dot d3=dots.get(k);
          if (dist(d2.x, d2.y, d3.x, d3.y)<100) {
            fill(0,10);            
            beginShape(TRIANGLES);
            vertex(d1.x,d1.y); 
            vertex(mouseX, mouseY); 
            vertex(d3.x,d3.y);
            endShape();
          }
        }
      }
    }
  }
}

class dot {


  float   x=random(0, width);
  float   y=random(0, height);
  float   r=random(0, 505);
  float   vx=random(0.5, 1);
  float   vy=random(0.5, 1);
  float   xdir=int(random(2))*2-1;
  float   ydir=int(random(2))*2-1;

  dot() {
  }

  void display() {
    
    fill(0,0);
    ellipse(x, y, r, r); 
    
  }

  void update() {
    //x+=vx*xdir;
    x+= mouseX/100*xdir; 
    //y+=vy*ydir;
    y+=mouseY/100*ydir; 

    if (x<0 || x>width) {
      xdir*=(-1);
    }

    if (y<0 || y>height) {
      ydir*=(-1);
    }
  }
}
