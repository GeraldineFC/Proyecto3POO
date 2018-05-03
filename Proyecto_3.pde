class Jugadores {
    
  String nombre;
  int ataque;
  int defensa;
  int vida;    
  int rep;
  
  Jugadores(String nombre_, int ataque_, int defensa_, int vida_, int rep_){
    nombre = nombre_;
    ataque = ataque_;
    defensa = defensa_;
    vida = vida_;
    rep = rep_;
  }
}
int rep;
void display()
{
  class dis extends Jugadores{
    
  switch (rep){
    case 0:
      dibujaP0();
    break;
    case 1:
      dibujaP1();
    break;
    case 2:
      dibujaP2();
    break;
    case 3:
      dibujaP3();
    break;
    case 4:
      dibujaP4();
    break;
  }
}

PImage dexter;
PImage brain;
PImage jimmy;
PImage sheldon;
PImage allien;
PImage lab;

void dibujaP0(){
  dexter = loadImage("dexter.png");
  }
  void dibujaP1(){
  brain = loadImage("brain.png");
  }
  
  void dibujaP2(){
  jimmy = loadImage("jimmy.png");
  }
  
  void dibujaP3(){
  sheldon = loadImage("sheldon.png");
  }
  void dibujaP4(){
    allien = loadImage("allien.jpg");
  }
Jugadores Modelo1;
Jugadores Modelo2;
Jugadores Modelo3;
Jugadores Modelo4;
Jugadores Modelo5;

Jugadores J1;
Jugadores J2;

void setup()
{
  size(900,600);
  Modelo1 = new Jugadores ("dexter", 9,7,14,3);
  Modelo2 = new Jugadores ("brain", 10,8,11,7);
  Modelo3 = new Jugadores ("jimmy", 12,10,15,9);
  Modelo4 = new Jugadores ("sheldon",7,9,13,5);
  Modelo5 = new Jugadores ("allien",11,7,14,10);
}

int pantalla = 0;

void draw (){

  switch(pantalla){
    case 0:
      inicio ();
    break;
    case 1:
      seleccion();
    break;
    case 2:
      pelea();
    break;
    case 3:
      fin();
    break;
  } 
}
int seleccion=0;
void inicio()
{
  lab = loadImage("lab.jpg");
      seleccion();
}

void seleccion(){
  Modelo1.display();
  Modelo2.display();
  Modelo3.display();
  Modelo4.display();
  Modelo5.display();
  
}

void pelea(){
  J1.display();
  J2.display();
  if (J1.vida <=0 || J2.vida <=0){
    pantalla = 3;
  }
}

void fin()
{
  if(J1.vida <=0)
  {
    J2.display();
  }
}

int turnoSeleccion = 1;
int sj1;
int sj2;
int turno = 1;


void keyPressed()
{
  switch (pantalla)
  {
    case 0:
    if(key ='a' || key == 'A'){
      pantalla = 1;
  }
  break;
    case 1:
    //seleccion
    if(turnoSeleccion == 1)
    {
      if (key == 'q')
      {
        sj1 =1;
        turnoSeleccion = 2;
      }
      if (key == 'w')
      {
        sj1 =2;
        turnoSeleccion = 2;
      }
    }
    if(turnoSeleccion ==2)
    {
      if(key == 'q')
      {
        sj2 =1;
      }
    if (key == 'w')
    {
      sj2 =2;
    }
    
    /*if(turnoSeleccion ==3){
      if(key == 'q'){
        sj1 =1;
        turnosSeleccion = 2;
      
    }
      if (key == 'w'){
        sj1 =2;
        turnoSeleccion = 2;
      }
    }
    if turnoSeleccion ==4){
      if(key == 'q') {
        sj2 = 1;
      }
      if (key == 'w'){
        sj2 = 2;
    } 
    }
    */
    switch(sj1)
    {
      case 1:
        J1 = new Jugadores(9,7,14);
        break;
      case 2:
        J1 = new Jugadores (10,8,11);
        break;
    }
    switch (sj2)
    {
      case 1:
      J2 = new Jugadores (9,7,14);
      break;
      J2 = new Jugadores (10,8,11);
      break;
    }
    pantalla =2;
    }
    break; 
    //pelea
    case 2:
      
      if (turno == 1)
      {
        if(key =='z')
        {
          J2.vida -= J1.ataque;
          turno = 2;
        }
      }
      if (turno == 2)
      {
        if(key == 'm')
        {
          J1.vida -= J2.ataque;
          turno = 1;
        }
      }
      break;
      //fin
      case 3:
      if (key == 'a')
      {
        pantalla =0;
        turno = 1;
        turnoSeleccion = 1;
        sj1 = 0;
        sj2 = 0;
      }
      break;              
  }
}