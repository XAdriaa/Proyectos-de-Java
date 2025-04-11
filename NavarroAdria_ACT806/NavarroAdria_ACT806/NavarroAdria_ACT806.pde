/** 
* Activitat 806
* Utilitzant les classes anteriors, obre un fitxer que continga text, llig tot el seu
* contingut i enregistra'l a un fitxer d'eixida amb la condició que has de canviar 
* majúscules per minúscules i a l'inrevés des del fitxer d'origen.
* Has de tindre en compte que Processing IDE incorpora les seues pròpies classes 
* BufferedReader i PrintWriter que podràs utilitzar en combinació amb 
* FileWriter i FileReader per poder fer aquesta activitat.
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
void setup(){
  size(640,480);
  
  try {
      String strPath = sketchPath() + File.separator;
      BufferedReader leer        = new BufferedReader(new FileReader(strPath + "./data/text.txt"));
      PrintWriter    escribir    = new PrintWriter(new FileWriter(strPath + "./data/resultat.txt"));
      
      StringBuilder sb = new StringBuilder();
      int byteLlegit;

      while ((byteLlegit = leer.read()) != -1) {
         char letras = (char) byteLlegit;
         /*Invertim l'ordre de les mayuscules y minuscules*/
         if(Character.isUpperCase(letras)){
           letras = Character.toLowerCase(letras);
         }else if(Character.isLowerCase(letras)){
           letras = Character.toUpperCase(letras);
         }
         sb.append(letras);
      }
      
      /**Invertim la cadena de Strings per a que els noms estigen be**/
      String resultat = sb.reverse().toString();

      /**Escribim el resultat al archiu**/
      escribir.write(resultat);
      /**Tanquem el archiu**/
      leer.close();
      escribir.close();
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
void draw(){
  background(255);

}
