Feature:  Service client Post
  As QA automation
  I want to start session
  To validate the status code and response

  Background: consume service
    * url url

  Scenario: check the service POST method

    * def requestLogin = {"email": "eve.holt@reqres.in","password": "cityslicka"}


    Given path 'login'
    And request requestLogin
    When method POST
    Then  status 200


  Scenario Outline: start session with invalid email values
    * def email = '<emailLog>'
    * def AddPetErrorLOG = read('classpath:Karate/request/responsesLoginERROR.json')

    Given path 'login'
    And request
    """
      {
          "email": '<emailLog>',
          "password": "cityslicka"
      }
    """
    When method POST
    Then status 400
    And match response == AddPetErrorLOG

    Examples:
      | emailLog |
      | 657826   |
      |  "****"  |
      |  "hole"  |