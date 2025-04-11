/**
 * Activitat 802
 * Intercambiar ordre
 * @author Adrià Navarro Savall
 * @version 1.0
 * @since XX/XX/2025
 */
// -------------------------------------------------------
// -------------------------------------------------------
// CONSTANTS
// -------------------------------------------------------



// -------------------------------------------------------
// Variables globals
// -------------------------------------------------------
import java.io.*;
// -------------------------------------------------------

/**
 * Mètode setup: Mètode que executa l'app només una vegada.
 * @return void
 */
void setup () {
   try {
      String strPath = sketchPath() + File.separator;
      FileInputStream fen = new FileInputStream(strPath + "./data/prova.txt");
      FileOutputStream fout = new FileOutputStream(strPath + "./data/resultat.txt");
      
      StringBuilder sb = new StringBuilder();
      int byteLlegit;

      while ((byteLlegit = fen.read()) != -1) {
         sb.append((char) byteLlegit);
      }
      
      /**Invertim la cadena de Strings per a que els noms estigen be**/
      String resultat = sb.reverse().toString();

      /**Escribim el resultat al archiu**/
      fout.write(resultat.getBytes());
      /**Tanquem el archiu**/
      fen.close();
      fout.close();
   }
   catch (FileNotFoundException f ) {
      println("Fitxer no trobat");
   }
   catch (IOException e) {
      println("Error d'entrada eixida");
   }
}


/**
 * Mètode draw: Mètode que executa l'app en bucle. També conegut com bucle de joc.
 * @return void
 */
void draw() {
  background(255);
}
