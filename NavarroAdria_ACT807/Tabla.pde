public class Tabla implements Serializable {
  //ATRIBUST
  private ArrayList<Alumne> alAlumnes;        /**Aquest ArrayList sencarregara de emmagatzemar els datos per a la nostra taula de alumnes**/
  private int ample;
  private int alt;

  //CONSTRUCTOR


  /**
   *Constructor parametrizat de la clase Tabla
   */
  public Tabla(ArrayList<Alumne> alArgument) {
    this.alAlumnes = alArgument;
    if(this.alAlumnes.isEmpty()) { // Solo si está vacía
        this.alAlumnes.add(new Alumne("785202549L", "Ana", "Boweles", "ana@gmail.com", "652362548"));
        this.alAlumnes.add(new Alumne("109343276P", "Rosa", "Melpie", "rosita@gmail.com", "654821574"));
        this.alAlumnes.add(new Alumne("653452030N", "Paco", "Mermela", "paquete@gmail.com", "541259630"));
    }
}


  //METODES
  /**
   *
   */
  public void mostrar() {
    dibuixarTaula();
    dibuixarArguments();
  }

  /**
   *
   */
  public void actualitzar() {
  }

  /**
   *Metode per a dibuixar una tabla de forma dinamica tenit en compte els parametros del ArrayList
   */
  private void dibuixarTaula() {
    /** Ample
     * 70   DNI
     * 100  Nom
     * 112 Cognom
     * 166 Emali
     * 112 Telefon
     */
    fill(255);
    int x =  150;
    int y =  50;
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < alAlumnes.size(); j++) {
        switch(i) {
        case 0:
          ample = 70 ;
          alt   = 40 ;
          rect(x, y + (40*j), ample, alt);
          break;
        case 1:
          ample = 100 ;
          alt   = 40 ;
          rect(x + 70, y + (40*j), ample, alt);
          break;
        case 2:
          ample = 112 ;
          alt   = 40 ;
          rect(x + 170, y + (40*j), ample, alt);
          break;
        case 3:
          ample = 166 ;
          alt   = 40 ;
          rect(x + 282, y + (40*j), ample, alt);
          break;
        case 4:
          ample = 70 ;
          alt   = 40 ;
          rect(x + 448, y + (40*j), ample, alt);
          break;
        }
      }
    }
  }

  private void dibuixarArguments() {
    fill(0);  //Cambia el color a negre per aixi poder mostrar de forma comoda per pantalla

    int x = 155;
    int y = 80;

    for (int i = 0; i < alAlumnes.size(); i++) {
      Alumne alumneActual = alAlumnes.get(i);

      text(alumneActual.getDni(), x, y + i * 40);                    /**Obtenim els DNI dels alumnes**/
      text(alumneActual.getNom(), x + 70, y + i * 40);               /**Obtenim els nom dels alumnes**/
      text(alumneActual.getCognom(), x + 170, y + i * 40);           /**Obtenim els cognom dels alumnes**/
      text(alumneActual.getEmail(), x + 282, y + i * 40);            /**Obtenim els email dels alumnes**/
      text(alumneActual.getTelefon(), x + 448, y + i * 40);          /**Obtenim els telefon dels alumnes**/
    }
  }
  
  /**
  *Ordenarem els alumnes per el seu cognom
  */
  public void ordenarPerCognom() {
  Collections.sort(alAlumnes, new Comparator<Alumne>() {
    @Override
    public int compare(Alumne a1, Alumne a2) {
      return a1.getCognom().compareToIgnoreCase(a2.getCognom());
    }
  });
}
}
