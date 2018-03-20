int cols=7; 
int fils=7; 
int tam=100;

int celda, start;
int a, b, c;

int est;

Cell[][] matr= new Cell[cols][fils]; 
int[][] conex= new int[cols][fils]; 
int[][] seg= new int[cols][fils]; 

void setup() { 
  size(700, 700); 
  smooth(); 
  for (int i=0; i<cols; i++) { 
    for (int j=0; j<fils; j++) { 
      if (i==3&&j==2) {
        matr[i][j]= new Cell(i*tam, j*tam, tam, tam/2);
      } else if (i==3&&j==4) {
        matr[i][j]= new Cell(i*tam, j*tam+50, tam, tam/2);
      } else { 
        matr[i][j]= new Cell(i*tam, j*tam, tam, tam);
      }
    }
  }
  background(255);
  //lineas basicas (horizontales y verticales)

  conex [1][2]=1;
  conex [1][4]=1;
  conex [5][2]=1;
  conex [5][4]=1;
  conex [3][3]=1;

  conex [2][1]=2;
  conex [4][1]=2;
  conex [2][5]=2;
  conex [4][5]=2;

  //lineas especiales (medias y diagonales)
  conex [3][2]=3;  
  conex [3][4]=4;

  conex [2][2]=5;  //diag sup izq
  conex [2][4]=6;  //diag sup der
  conex [4][2]=7;  //diag inf izq
  conex [4][4]=8;  //diag inf der

  //puntos

  conex [1][1]=9;
  conex [1][3]=9;
  conex [1][5]=9;
  conex [5][1]=9;
  conex [5][3]=9;
  conex [5][5]=9;
  conex [3][1]=9;
  conex [3][5]=9;
  conex [2][3]=9;
  conex [4][3]=9;

  for (int i=0; i<cols; i++) { 
    for (int j=0; j<fils; j++) { 
      if (conex[i][j]!=0&&conex[i][j]!=9) {
        seg[i][j]=a+1; 
        a=seg[i][j];
      }
    }
  }
}

void draw() { 
 stroke(200);
  strokeWeight(1);
  line(150, 150, 150, 550);
  line(350, 150, 350, 550);
  line(550, 150, 550, 550);
  line(150, 150, 550, 150);
  line(150, 550, 550, 550);
  line(250, 350, 350, 250);
  line(250, 350, 350, 450);
  line(450, 350, 350, 250);
  line(450, 350, 350, 450);

  for (int i=0; i<cols; i++) { 
    for (int j=0; j<fils; j++) { 
      if (conex[i][j]!=0) {
        matr[i][j].display(); 
        matr[i][j].checkCell();
      }
    }
  }
 
} 


class Cell { 
  float x; 
  float y; 
  float w; 
  float h; 
  int state; 
  Cell (float _x, float _y, float _w, float _h) { 
    x= _x; 
    y= _y; 
    w= _w; 
    h= _h; 
    state=0;
  } 
  void display() { 
    stroke(0);
    println(c, " ", b, " ");
    switch(state) {     
    case 0: 
      fill(255); 
      strokeWeight(1);


      break;
    case 1:
      strokeWeight(3);
      if (b==1&&(c==3||c==2)) {
        line(x+(tam/2), y-(tam/2), x+(tam/2), y+(tam/2+tam));
        est=0;
      }
      if (b==2&&(c==1||c==6)) {
        line(x+(tam/2), y-(tam/2), x+(tam/2), y+(tam/2+tam));
        est=0;
      }
      if (b==14&&(c==10||c==15)) {
        line(x+(tam/2), y-(tam/2), x+(tam/2), y+(tam/2+tam));
        est=0;
      }
      if (b==15&&(c==13||c==14)) {
        line(x+(tam/2), y-(tam/2), x+(tam/2), y+(tam/2+tam));
        est=0;
      }
      if (b==8&&(c==11||c==12||c==4||c==5||c==7||c==9)) {
        line(x+(tam/2), y-(tam/2), x+(tam/2), y+(tam/2+tam));
        est=0;
      }
      break;


    case 2: 
      strokeWeight(3);

      if (b==3&&(c==1||c==10||c==7)) {
        line(x-(tam/2), y+(tam/2), x+(tam/2+tam), y+(tam/2));
        est=0;
      }
      if ((b==10)&&(c==3||c==14||c==7)) {
        line(x-(tam/2), y+(tam/2), x+(tam/2+tam), y+(tam/2));
        est=0;
      }
      if (b==6&&(c==2||c==13||c==9)) {
        line(x-(tam/2), y+(tam/2), x+(tam/2+tam), y+(tam/2));
        est=0;
      }
      if (b==13&&(c==6||c==15||c==9)) {
        line(x-(tam/2), y+(tam/2), x+(tam/2+tam), y+(tam/2));
        est=0;
      }

      break;
    case 3: 
      if (b==7&&(c==3||c==10||c==8||c==4||c==11)) {
        strokeWeight(3);
        line(x+(tam/2), y-(tam/2), x+(tam/2), y+(tam/2));
        est=0;
      }

      break;
    case 4:
      if (b==9&&(c==6||c==13||c==5||c==12)) {
        strokeWeight(3);
        line(x+(tam/2), y, x+(tam/2), y+(tam));   
        est=0;
      }

      break;
    case 5: 
      strokeWeight(4);
      if (b==4&&(c==8||c==7||c==5)) {
        strokeWeight(4);
        line(x+(tam/2+tam), y+(tam/2), x+(tam/2), y+(tam/2+tam));       
        est=0;
      }


      break;
    case 6: 
      strokeWeight(4);
      if (b==5&&(c==4||c==9||c==8)) {
        strokeWeight(4);
        line(x+(tam/2), y-(tam/2), x+(tam/2+tam), y+(tam/2));        
        est=0;
      }
      break;
    case 7: 
      strokeWeight(4);
      if (b==11&&(c==4||c==8||c==12||c==7)) {
        strokeWeight(4);
        line(x-(tam/2), y+(tam/2), x+(tam/2), y+(tam/2+tam));            
        est=0;
      }
      break;
    case 8: 
      if (b==12&&(c==8||c==11||c==9)) {
        strokeWeight(4);
        line(x+(tam/2), y-(tam/2), x-(tam/2), y+(tam/2));           
        est=0;
      }

      break;
    }
    if (conex[(int(x)/tam)][(int(y)/tam)]==9||conex[(int(x)/tam)][(int(y)/tam)]==3) {
      strokeWeight(8);
      point(x+(tam/2), y+(tam/2));
    }
    if (conex[(int(x)/tam)][(int(y)/tam)]==4)
    {
      strokeWeight(8);
      point(x+(tam/2), y);
    }
  }

  void checkCell() { 
    if (mousePressed) {   
      start=1;
    }

    if ( mouseX > x && mouseX < x+w 
      && mouseY > y && mouseY < y+h && start==1) {

      if (seg[(int(x)/tam)][(int(y)/tam)]!=0)
      {
        b=seg[(int(x)/tam)][(int(y)/tam)];
      }
      if (seg[(int(x)/tam)][(int(y)/tam)]!=0&&est==0)
      {
        c=seg[(int(x)/tam)][(int(y)/tam)];
        est=1;
      }

      switch(conex[(int(x)/tam)][(int(y)/tam)]) {
      case 1: 

        state=1;

        break;
      case 2: 
        state=2;  
        break;
      case 3: 
        state=3;    
        break;
      case 4: 
        state=4;   
        break;
      case 5: 
        state=5;   
        break;
      case 6: 
        state=6;   
        break;
      case 7: 
        state=7;   
        break;
      case 8: 
        state=8;   
        break;
      }
    }
  }
}
