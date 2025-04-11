/**
 * Activitat 807
 * Dissenya una aplicació amb Processing IDE on es podrà per un costat introduir informació d'alumnes que es guardaran en un fitxer que s'anomene: 'alumnes.dat'.
 *
 * Al principi l'aplicació llegirà de l'arxiu 'alumnes.dat' tots els alumnes inscrits al curs i els mostrar per pantalla, ordenats alfabèticament pel cognom.
 *
 * Una vegada haja mostrat tots els alumnes, l'aplicació esperarà que s'introduisca algun alumne nou per consola, una vegada introduits totes les dades de l'alumne,
 * aquesta es guardarà en un objecte primer i després al fitxer 'alumnes.dat' a continuació dels que ja havien estat enregistrats.
 *
 * Finalment tornarà a mostrar els alumnes ordenats alfabèticament i torna a començar.
 *
 * @author Adrià Navarro Savall
 * @version 1.0
 * @since XX/XX/2025
 */
// -------------------------------------------------------
import java.io.*;
import java.util.*;
// -------------------------------------------------------
// CONSTANTS
// -------------------------------------------------------
final static int TABLA = 0, NOUALUMNE = 1, ELIMINARALUMNE = 2, EIXIR = 9;    //Creem unes constants per a poder marcar uns valor per a crear una interaccio amb l'usuari

// -------------------------------------------------------
// Variables globals
// -------------------------------------------------------
Tabla  taula;                                                                //Fem una instancia per a la clase Tabla
Arxiu file;                                                                  //Fem una instancia per a la clase Tabla
int opcio = 0;                                                               //Creem una variable per a trasmitir el valor i aixi poder fer us dells
boolean inDades = false;                                                     //Boolean per marcar si se estan introduint dades
ArrayList<String> dadesAlumne = new ArrayList<String>();                     //ArrayList temporal per guadar les dades
int campActual = 0;                                                          // 0 DNI, 1 Nom, 2 Cognom, 3 Email, 4 Telèfon
StringBuilder entradaActual = new StringBuilder();
boolean enter = false;
// -------------------------------------------------------

/**
 * Mètode setup: Mètode que executa l'app només una vegada.
 * @return void
 */
void setup() {
    size(700, 800);
    file = new Arxiu("data/alumnes.dat"); // Nombre consistente
    
    ArrayList<Alumne> existents = file.llegirAlumnes();
    taula = new Tabla(existents.isEmpty() ? new ArrayList<>() : existents);
    
    println("Alumnes carregats: " + taula.alAlumnes.size()); // Debug
}


/**
 * Mètode draw: Mètode que executa l'app en bucle. També conegut com bucle de joc.
 * @return void
 */
void draw() {
  background(255);
  

  switch(opcio) {
  case TABLA:
   taula.mostrar();
    break;
  case NOUALUMNE:
     taula.mostrar();

    if (!inDades) {
      println("Introdueix les dades de l'alumne:");
      println("DNI:");
      inDades = true;
      dadesAlumne.clear();
      campActual = 0;
    }
    break;
  case ELIMINARALUMNE:

    break;
  case EIXIR:
    exit();
    break;
  }
}

/**
 * Metode KeyPress
 * Mètode per a detectar les tecles apretades per l'usuari.
 */
void keyPressed() {
  switch(key) {
  case'1':
    opcio = TABLA;
    break;
  case'2':
    opcio = NOUALUMNE;
    break;
  case'3':
    opcio = ELIMINARALUMNE;
    break;
  case'9':
    opcio = EIXIR;
    break;
  }
}

/**
*Metode per a almacenar carracter i poder mostra-ho per pantalla
*/
void keyTyped() {  
  if (opcio == NOUALUMNE && inDades) {
    if (key != ENTER && key != RETURN) {
      entradaActual.append(key); 
    } else {
      dadesAlumne.add(entradaActual.toString());                    // Guardar dades
      entradaActual.setLength(0);
      campActual++;
      // Pedir siguiente dato:
      if (campActual == 1) println("Nom:");
      else if (campActual == 2) println("Cognom:");
      else if (campActual == 3) println("Email:");
      else if (campActual == 4) println("Telèfon:");
      else if (campActual == 5) {
        // Guardar alumno y resetear estado
        Alumne nouAlumne = new Alumne(
          dadesAlumne.get(0), dadesAlumne.get(1), dadesAlumne.get(2),
          dadesAlumne.get(3), dadesAlumne.get(4)
          );
        taula.alAlumnes.add(nouAlumne);
        file.guardarAlumnes(taula.alAlumnes);
        taula.ordenarPerCognom();
        inDades = false;
        opcio = TABLA;
        println("Alumne afegit correctament.");
      }
    }
  }
}
