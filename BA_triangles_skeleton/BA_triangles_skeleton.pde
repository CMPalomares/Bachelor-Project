import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;

Kinect kinect;
ArrayList <SkeletonData> bodies;

//Array of vectors
ArrayList<dot> dots = new ArrayList<dot>();
//Amount of vectors that later is translated into triangles
int num=80;

void setup() {
  background(255);
  size(800, 800);
  kinect = new Kinect(this);
  smooth();
  bodies = new ArrayList<SkeletonData>();
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
  
  for (int i=0; i<bodies.size (); i++){
    drawVisuals(bodies.get(i));
    drawSkeleton(bodies.get(i));
  }
  
}

void drawPosition(SkeletonData _s) 
{
  noStroke();
  fill(0, 100, 255);
  String s1 = str(_s.dwTrackingID);
  text(s1, _s.position.x*width/2, _s.position.y*height/2);
}

void drawVisuals(SkeletonData _s) 
{
  
  DrawBoneVisuals(_s, 
  Kinect.NUI_SKELETON_POSITION_WRIST_LEFT, 
  Kinect.NUI_SKELETON_POSITION_HAND_LEFT, 
  Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_HAND_RIGHT);
  
}

void drawSkeleton(SkeletonData _s) 
{
  // Body
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HEAD, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
  Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 
  Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SPINE, 
  Kinect.NUI_SKELETON_POSITION_HIP_CENTER);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_CENTER, 
  Kinect.NUI_SKELETON_POSITION_HIP_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_CENTER, 
  Kinect.NUI_SKELETON_POSITION_HIP_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_LEFT, 
  Kinect.NUI_SKELETON_POSITION_HIP_RIGHT);

  // Left Arm
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT, 
  Kinect.NUI_SKELETON_POSITION_WRIST_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_WRIST_LEFT, 
  Kinect.NUI_SKELETON_POSITION_HAND_LEFT);

  // Right Arm
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_HAND_RIGHT);

  // Left Leg
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_LEFT, 
  Kinect.NUI_SKELETON_POSITION_KNEE_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_KNEE_LEFT, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT, 
  Kinect.NUI_SKELETON_POSITION_FOOT_LEFT);

  // Right Leg
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_FOOT_RIGHT);
}


void DrawBone(SkeletonData _s, int _j1, int _j2) 
{
  noFill();
  stroke(255, 255, 0);
  if (_s.skeletonPositionTrackingState[_j1] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED &&
    _s.skeletonPositionTrackingState[_j2] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED) {
    line(_s.skeletonPositions[_j1].x*width, 
    _s.skeletonPositions[_j1].y*height, 
    _s.skeletonPositions[_j2].x*width, 
    _s.skeletonPositions[_j2].y*height);
    ellipse(_s.skeletonPositions[_j1].x*width, 
    _s.skeletonPositions[_j1].y*height, 20,20);
    fill(255);
    ellipse(_s.skeletonPositions[_j2].x*width, 
    _s.skeletonPositions[_j2].y*height, 20, 20);
    fill(255);
  } 
}

void DrawBoneVisuals(SkeletonData _s, int _C1, int _C2, int _C3, int _C4) {
  if (_s.skeletonPositionTrackingState[_C1] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED &&
    _s.skeletonPositionTrackingState[_C2] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED &&
    _s.skeletonPositionTrackingState[_C3] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED &&
    _s.skeletonPositionTrackingState[_C4] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED ) {
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
            vertex(_s.skeletonPositions[_C1].x*width, _s.skeletonPositions[_C1].y*height); 
            vertex(d3.x, d3.y);
            endShape();
            beginShape(TRIANGLES);
            vertex(d1.x + 20, d1.y + 20); 
            vertex(_s.skeletonPositions[_C3].x*width, _s.skeletonPositions[_C3].y*height); 
            vertex(d3.x + 20, d3.y + 20);
            endShape();
           }
          }
         }
        }
      }
   }
}


void appearEvent(SkeletonData _s) 
{
  if (_s.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    bodies.add(_s);
  }
}

void disappearEvent(SkeletonData _s) 
{
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_s.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.remove(i);
      }
    }
  }
}

void moveEvent(SkeletonData _b, SkeletonData _a) 
{
  if (_a.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_b.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.get(i).copy(_a);
        break;
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
    x+=vx*xdir;
    y+=vy*ydir;


    if (x<0 || x>width) {
      xdir*=(-2);
    }

    if (y<0 || y>height) {
      ydir*=(-2);
    }
  }
}