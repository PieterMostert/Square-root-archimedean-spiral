float A = 2/3.;    //starting value of parameter A
float max_n = 1000;    //number of points
float sqrtn;
float d = 5;           //minimum diameter of points
float diam;            //diameter of point
float r;               //scaling factor for distance of point from origin
float rad;             //distance of point from origin
float theta;           //angle of point
int L;                 //width of screen (we assume the screen is square)

FloatList sqrtlist;

void setup()
{
   size(600,600);
   smooth();
   frameRate(25);
   noStroke();
   sqrtlist = new FloatList();
   for (int n = 0; n < max_n; n++) {
     sqrtlist.append(2*PI*sqrt(n));
   L = width;
   r = L/2/sqrt(2*max_n)/PI;
   }
}

void draw()
{
   background(0);
   fill(255);
   for (int n = 0; n < max_n; n++) { 
     diam = d*(1+n/max_n);
     sqrtn = sqrtlist.get(n);
     theta = sqrt(A)*sqrtn;
     rad = r*sqrtn;
     ellipse(L/2+rad*cos(theta), L/2+rad*sin(theta), diam, diam);
  }
   A += 0.0002;
  // saveFrame("output/frame-#####.png");
}
