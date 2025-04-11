/**
 * Aquesta clase sera encarregada de fe tot lo relacionat
 * amb els archius:Lectura de archius tambe la escriptura.
 */
public class Arxiu {
  //ATRIBUST
  String ruta;


  //CONSTRUCTORS

  /**
   * Constructor parametritzat
   */
  public Arxiu(String ruta) {
    this.ruta = sketchPath(ruta);
    new File(sketchPath("data")).mkdirs();
  }

  //METODES

  /**
   *Metode per a lligir els alumnes del document .dat
   */
  public ArrayList<Alumne> llegirAlumnes() {
    ArrayList<Alumne> alumnes = new ArrayList<>();
    try {
      File file = new File(ruta);
      if (file.exists()) {
        ObjectInputStream ois = new ObjectInputStream(new FileInputStream(ruta));
        alumnes = (ArrayList<Alumne>) ois.readObject();
        ois.close();
      }
    }
    catch (Exception e) {
      println("Error llegint l'arxiu: " + e.getMessage());
    }
    return alumnes;
  }


  /**
   *Metode per a guardar els alumnes en el arxiu
   */
  public void guardarAlumnes(ArrayList<Alumne> alumnes) {
    try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(ruta))) {
      oos.writeObject(alumnes); // Solo guarda la lista de alumnos
    }
    catch (IOException e) {
      e.printStackTrace();
    }
  }
}
