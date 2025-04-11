/**
 * Activitat 804
 * 
 * Guarda tot allò que es teclege en un fitxer de text juntament amb l'hora a la qual s'ha escrit.
 * 
 * @author Adrià Navarro Savall
 * @version 1.0
 * @since XX/XX/2025
 */

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

String textEscrit = "";  /**Guardaem el text en aquesta varuiable**/
String nomFitxer = "./data./text.txt";  // Nom del fitxer on es guardarà el text

void setup() {
  size(500, 200);
  background(255);
  fill(0);
  textSize(16);
}

void draw() {
  background(255);
  text("Escri amb el teclat i desa amb el click:", 20, 50);
  text(textEscrit, 20, 100);
}

void keyPressed() {
  if (key == ENTER) {
    mouseClicked();  // Quan es prem ENTER, es desa automàticament
  } else if (key == BACKSPACE && textEscrit.length() > 0) {
    textEscrit = textEscrit.substring(0, textEscrit.length() - 1);
  } else if (key != CODED) {
    textEscrit += key;
  }
}

void mouseClicked() {
  if (textEscrit.length() > 0) {
    try {
      PrintStream ps = new PrintStream(new FileOutputStream(sketchPath(nomFitxer), true));
      
      /**obtenim l'hora dle moment del text **/
      String hora = new SimpleDateFormat("HH:mm:ss").format(new Date());
      
      /**Escriure la línia al fitxer en la consola per verificar**/ 
      ps.println("[" + hora + "] - " + textEscrit);
      ps.close();
      
      println("Guardat: [" + hora + "] - " + textEscrit);
      
      /** Netejm el text despres de guardar lo escrit per si es vol fer un atre text **/ 
      textEscrit = "";
    } catch (IOException e) {
      println("Error en escriure al fitxer.");
    }
  }
}
