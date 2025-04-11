/**
 * Class Archius:
 * Esta clase es la que vamos a utilizar para navegar por los archivos de nuestro ordenador y realizar algunas pruebas.
 */
import java.io.*;
public class Archius {
  //ATRIBUTS
  private String rutaArchiu;

  //CONSTRUCTOR
  public Archius(String rutaArchiu) {
    this.rutaArchiu = sketchPath(rutaArchiu); //<>//
  }
  /**
   * Este metode es per a saber el nom del fitxer, tambe aquest metode ens comprobara si
   * el nostre programa ens a trobat o no el archiu que busquem i volem fer us.
   */
  private void nomFitxer() {
    File archivo = new File(rutaArchiu);

    if (archivo.exists()) {
      textSize(16);
      background(255);
      text("El nom del fitxer es: " + archivo.getName(),270,80);  /** Ens dira el nom del archiu en el cas de existir                     **/
    } else {
      println("No el trobe");                                  /** Ens mostrara un missage per terminal en el cas de no trobar el archiu  **/
    }
  }

  /**
   * Ens mostrara la ruta completa del nostre archiu.
   */
  private void rutaAbsoluta() {
    textSize(12);
    background(255);
    text("La ruta del archiu: " + rutaArchiu,300,400);
  }
  /**
  *Ens mostra el temps de la ultima modificacio del nostre alchiu
  */
  private void ultimaMod() {
    File archivo = new File(rutaArchiu);
    background(255);
    if (archivo.exists()) {
      text("La ultima modificacio va ser: " + (archivo.lastModified()/1000) + "segons",280,250);
    }
  }
}
