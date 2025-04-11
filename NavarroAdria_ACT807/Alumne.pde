/**
* Clase Alumne
* Aquesta clase servira per a guardar les dades dels alumnes i tambe escriure les dades de nous alumnes
*/
import java.io.*;

public class Alumne implements Serializable {
 //ATRIBUTS
 private String dni;
 private String nom;
 private String cognom;
 private String email;
 private String telefon;
 
 //CONTRUCTORS
 
 /**
 *Constructor per defecte de la clase per a posar parametres predefinit.
 */
 public Alumne(){
   this.dni     = "00000000A";
   this.nom     = "No guardat";
   this.cognom  = "No guardat";
   this.email   = "desconegut@gmail.com";
   this.telefon = "000000000";
 }
 
 /**
 * Constructor parametrizats
 * Aquest constructor reb paramtres
 */
 
 public Alumne(String dni, String nom, String cognom, String email, String telefon){
   this.dni     = dni;
   this.nom     = nom;
   this.cognom  = cognom;
   this.email   = email;
   this.telefon = telefon;
 }
 
 //MÈTODES
 
 
 
 
 //----------------------------------------------------------------------------------
 //------------------------GETTERS I SETTER------------------------------------------
 //----------------------------------------------------------------------------------
 
 //Getter i setter DNI--
 public String getDni(){
   return this.dni;
 }
 
 public void setDni(String dni){
   this.dni = dni;
 }
 
 //Getter i setter Nom--
 public String getNom(){
   return this.nom;
 }
 
 public void setNom(String nom){
   this.nom = nom;
 }
 
 //Getter i setter Cognom--
 public String getCognom(){
   return this.cognom;
 }
 
 public void setCognom(String cognom){
   this.cognom = cognom;
 }
 
  //Getter i setter Email--
 public String getEmail(){
   return this.email;
 }
 
 public void setEmail(String email){
   this.email = email;
 }
 
 //Getter i setter Telefon--
 public String getTelefon(){
   return this.telefon;
 }
 
 public void setTelefon(String telefon){
   this.telefon = telefon;
 }
}
