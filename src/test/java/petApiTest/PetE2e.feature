Feature: Realizar un feature end to end (POST, GET, PUT)

  Background:
    * url 'https://petstore.swagger.io/v2'
    * configure headers = { Accept: 'application/json', ContentType: 'application/json' }

  Scenario: Flujo end to end

    #1. Mostrar pets disponibles
    Given path '/pet/findByStatus'
    And param status = 'available'
    When method get
    Then status 200
    * print 'Pets obtenidos:', response

    #2. Crear Pet
    Given path '/pet'
    And request
      """
      {
        "id" : "54321",
        "category" : {
          "id": 1,
          "name": "Perro Grande"
        },
        "name" : "Luis",
        "photoUrls": ["URL de la imagen"],
        "status" : "available"
      }
      """
    When method post
    Then status 200
    * def petId = response.id
    * print 'Pet creado con id:', petId

    #3 Editar Pet

    Given path '/pet'
    And request
      """
      {
        "id": "#(petId)",
        "category": { "id": 1, "name": "Perro Grande" },
        "name": "Maxter ",
        "photoUrls": ["URL actualizada"],
        "status": "available"
      }
      """
    When method put
    Then status 200
    * print 'Pet actualizado:', response

    #4 Eliminar Pet

    Given path '/pet' , petId
    When method delete
    Then status 200
    * print 'Pet eliminado con id:', petId

