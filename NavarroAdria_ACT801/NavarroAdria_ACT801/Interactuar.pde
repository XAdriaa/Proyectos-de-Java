/**
* Clase Interactura.
* Aquesta clase es fara us d'ella per a fer botons per a aixi mostrar de forma mes amigable la informacio de la nostra aplicacio.
*/
public class Interactuar{
 //ATRIBUTS
 private int x;                  /**Ens serveix per a marcar la cordena x**/
 private int y;                  /**Ens serveix per a marcar la cordena y**/
 private int ample;              /**Fem us del atribut per a fer l'ample del rectangles**/
 private int llarc;              /**Fem us del atribut per a fer la llargaria del rectangles**/
 private String noms[];          /**Es un array de Strings per as els noms**/
 private Archius data;           /**Fem una instancian de la clase Archius**/
 
 /**
 * Constructor per defecte.
 */
 public Interactuar(){
   this.x     = 0;
   this.y     = 0;
   this.ample = 50;
   this.llarc = 80;
   this.noms  = new String [3];
   this.data  = new Archius("./archius/prova.odt");
 }
 
 
 /**
 *Constructor parametriazt.
 */
 public Interactuar(int x, int y, int ample, int llarc, String noms[], Archius data){
   this.x       = x;
   this.y       = y;
   this.ample   = ample;
   this.llarc   = llarc;
   this.noms    = noms;
   this.data    = data;
 }
 
 //METODES
 
 public void mostrarBotons(){
   crearBotons();
 }
 
 private void crearBotons(){
   
   x     = 50;
   y     = 50;
   llarc = 100;
   ample = 50;
   /**Emplenm el array de String per a els noms**/
   noms = new String[]{
     "Nom"         ,
     "Ruta"        ,
     "Modificació" ,
   };
   /**Fer un bucle for per a aixi escriure els noms**/
   for(int i = 0; i < 3; i++){
   fill(246,163,163);
   rect(x,y,llarc,ample);
   fill(0);
   text(noms[i],x + 50,y + 30);
   y += 80;
   }
   
 }
 /**
 *Amb aquesta funcio fem un sistema de botons per aixi fer un poc mes interactiva la aplicacio
 */
 public void posicioClick(int x, int y){
   println(x,y);
   if((x > 49 && y < 100) && (x < 150 && y > 49)) {        
     data.nomFitxer();
   } else if ((x > 49 && y < 181) && (x < 150 && y > 129)){
     data.rutaAbsoluta();
   }else if ((x > 49 && y < 261) && (x < 150 && y > 209)){
     data.ultimaMod();
   }
 }
}
