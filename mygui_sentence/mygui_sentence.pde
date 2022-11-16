import processing.serial.*;
import controlP5.*;

ControlP5 cp;
Textarea myTextarea;
Textarea myText2;
Textarea myText3;
Textarea myText4;
Textarea myText5;
Textarea myText6;
Textarea myText7;
Textarea myText8;
Textarea myText9;
Textarea myText10;
Textarea myText11;
Textarea myText12;
Textarea myText13;



Serial myPort;  
String val;     

void setup()
{

  print("start setup");
  String portName = Serial.list()[1]; 
  myPort = new Serial(this, portName, 9600);
  surface.setTitle("Voice Recognition Results");
  PImage img;
  PFont font;
  font = loadFont("Asana-Math-48.vlw");
  img = loadImage("/home/rida/gui.jpg");
  image(img,0,0,1400,1000);
  size(1400,1000);
  textFont(font, 40);
  //textSize(40);
  text("The detected sentence", 550, 40);
  fill(0, 408, 612, 204);
  text("Additional Results", 570,500);
  fill(0, 408, 612);
  textSize(32);
  text("Sentence :", 560,130);
  fill(0, 408, 612);
  text("Inferencing Delay :", 440,230);
  fill(0, 408, 612);
  text("Transmission Delay :", 410,330);
  fill(0, 408, 612);
  textSize(30);
  text("milliseconds", 930, 230);
  fill(0,408,612);
  text("milliseconds", 930, 330);
  fill(0,408,612);
  
  cp = new ControlP5(this);
     myText13 = cp.addTextarea("txt13")
                 .setPosition(720,300)
                 .setSize(200,50)
                 .setFont(createFont(PFont.list()[1],20))
                 .setLineHeight(14)
                 .setColor(color(128))
                 .setColorBackground(color(255,100))
                 .setColorForeground(color(255,50));
     
     myText12 = cp.addTextarea("txt12")
                 .setPosition(720,200)
                 .setSize(200,50)
                 .setFont(createFont(PFont.list()[1],20))
                 .setLineHeight(14)
                 .setColor(color(128))
                 .setColorBackground(color(255,100))
                 .setColorForeground(color(255,50));
    
    myText11 = cp.addTextarea("txt11")
                 .setPosition(720,100)
                 .setSize(200,50)
                 .setFont(createFont(PFont.list()[1],20))
                 .setLineHeight(14)
                 .setColor(color(128))
                 .setColorBackground(color(255,100))
                 .setColorForeground(color(255,50));
  
   
   myText2 = cp.addTextarea("txt2")
                 .setPosition(250,750)
                 .setSize(400,50)
                 .setFont(createFont(PFont.list()[0],18))
                 .setLineHeight(14)
                 .setColor(color(128))
                 .setColorBackground(color(255,100))
                 .setColorForeground(color(255,50));  
     
     myText3 = cp.addTextarea("txt3")
                 .setPosition(750,750)
                 .setSize(400,50)
                 .setFont(createFont(PFont.list()[0],18))
                 .setLineHeight(14)
                 .setColor(color(128))
                 .setColorBackground(color(255,100))
                 .setColorForeground(color(255,50));  
     
      myText4 = cp.addTextarea("txt4")
                 .setPosition(750,650)
                 .setSize(400,50)
                 .setFont(createFont(PFont.list()[0],18))
                 .setLineHeight(14)
                 .setColor(color(128))
                 .setColorBackground(color(255,100))
                 .setColorForeground(color(255,50));    

     
           myText7 = cp.addTextarea("txt7")
                 .setPosition(250,650)
                 .setSize(400,50)
                 .setFont(createFont("Arial bold",18))
                 .setLineHeight(14)
                 .setColor(color(128))
                 .setColorBackground(color(255,100))
                 .setColorForeground(color(255,50));

   
      myText5 = cp.addTextarea("txt5")
                 .setPosition(750,550)
                 .setSize(400,50)
                 .setFont(createFont(PFont.list()[0],18))
                 .setLineHeight(14)
                 .setColor(color(128))
                 .setColorBackground(color(255,100))
                 .setColorForeground(color(255,50));
                 
      myText6 = cp.addTextarea("txt6")
                 .setPosition(250,550)
                 .setSize(400,50)
                 .setFont(createFont("Arial bold",18))
                 .setLineHeight(14)
                 .setColor(color(128))
                 .setColorBackground(color(255,100))
                 .setColorForeground(color(255,50));

                 

                
     ;
}

void draw()
{

if ( myPort.available() > 0 )
  {  // If data is available,
// read it and store it in val

    try {
      
    val = myPort.readStringUntil('\n');
     if (val.startsWith("Please"))
    {
      myText2.setText(val);
    }
    else if (val.startsWith("N"))
    {
      myText3.setText(val);
    }
     else if (val.startsWith("The"))
    {
      myText4.setText(val);
    }
     else if (val.startsWith("Can you"))
    {
      myText5.setText(val);
    }
     else if (val.startsWith("I"))
    {
      myText6.setText(val);
    }
     else if (val.startsWith("How"))
    {
      myText7.setText(val);
    }
     else if (val.startsWith("KW")){
      String[] data = val.split(":");
      String a = data[1];
      myText11.setText(a);
    }
    else if (val.startsWith("dl")){
      String[] data = val.split(":");
      String a = data[1];
      myText12.setText(a);
    }
    else if (val.startsWith("Ti")){
      String[] data = val.split(":");
      String a = data[1];
      myText13.setText(a);
    }
    else {
      println("not matching");
    }
    }
    
    catch (Exception e){
     ; 
    }

}
;
}
