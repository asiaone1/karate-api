package petApiTest;

import com.intuit.karate.Runner;

public class PetTest {
    public static void main(String[] args) {
        Runner.path("src/test/java/petApiTest") // Ruta de la carpeta específica
                .outputCucumberJson(true) // Habilitar reporte Cucumber JSON
                .parallel(1); // Ejecutar de forma secuencial
    }
}
