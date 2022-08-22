Feature:  Service client Post
  As QA Automation
  I want to create a client
  To validate the status code and response

  Background: consume service
    * url url

  Scenario: check the service POST method

    * def requestCreate = {"name": '#(name)',"job": "#(job)","id": "#(id)","createdAt": "#(createdAt)"}


    Given path 'users'
    And request requestCreate
    When method post
    Then  status 201
    And assert response.name == "morpheus"
    And assert response.job == "leader"
    And assert response.id == id

  Scenario Outline: Create a user with invalid name
    * def requestCreate = {"name": '#(name)',"job": "#(job)","id": "#(id)","createdAt": "#(createdAt)"}
    Given path 'users'
    And request requestCreate
    And name, <name>
    When method post
    Then  status 201 #Es un bug

    Examples:
      | name    |
      | "$#%&/" |
      | 12345   |
      | ""      |





