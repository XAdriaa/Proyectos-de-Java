/** 
* Activitat 801
* Calss File
* Crea un projecte en Processing IDE que obriga un fitxer de prova qualsevol, per exemple: prova.txt. 
* Revisa els mètodes de la classe File i comprova el funcionament d'alguns d'ells per exemple: getName();
* Mostra per pantalla una fitxa en la que es mostre la següent informació:
*
* Nom del fitxer
* Ruta absoluta del fitxer
* Data de l'última vegada que s'ha modificat
* @author Adrià Navarro Savall
* @version 1.0
* @since XX/XX/2025
*/
// -------------------------------------------------------
//IMPORTS
// -------------------------------------------------------
import java.io.*;
//-------------------------------------------------------
//--------------------------------------------------------
// CONSTANTS
// -------------------------------------------------------


//--------------------------------------------------------
// -------------------------------------------------------
// Variables globals
// -------------------------------------------------------
Archius         file;
Interactuar     botons;
// -------------------------------------------------------

/**
 * Mètode setup: Mètode que executa l'app només una vegada.
 * @return void
*/
void setup(){
  size(640,480);
  textAlign(CENTER);
  fill(0);
  background(255);
  file   = new Archius("./archius/prova.odt");
  botons = new Interactuar();
}


/**
 * Mètode draw: Mètode que executa l'app en bucle. També conegut com bucle de joc.
 * @return void
*/
void draw(){

  botons.mostrarBotons();
}

void mouseClicked(){
  botons.posicioClick(mouseX, mouseY);
}
