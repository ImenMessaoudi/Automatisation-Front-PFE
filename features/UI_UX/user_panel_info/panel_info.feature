@IMPRESS-9743
Feature: Follow-up Screen : User Panel Info

              As a impress user
              I want to test the user panel info

        @IMPRESS-9744
        Scenario Outline: Access user panel info

            Given I am logged in with <user> and <password>
             When I select the preference menu in the left menu
             Then All the menus <Allmenus> are displayed
     
        Examples:
                  | user           | password | Allmenus                      |
                  | IMP_AUTOMATION | Neoxam23 | link-logout;link-powered;lang |


        @IMPRESS-9745
        Scenario Outline: Test Abor

            Given I am logged in with <user> and <password>
             When  I select the preference menu in the left menu
              And I click in the Abor menu
             Then JNLP file is Downloaded

        Examples:
                  | user           | password |
                  | IMP_AUTOMATION | Neoxam23 |


        @IMPRESS-9747
        Scenario Outline: Test language

            Given I am logged in with <user> and <password>
             When I select the preference menu in the left menu
              And  I click on the language button <languageButton>
             Then  The language of the menus <menus> is changed
 
        Examples:
                  | user           | password | languageButton | menus                 |
                  | IMP_AUTOMATION | Neoxam23 | FR             | Suivi;Tableau de bord |
                  | IMP_AUTOMATION | Neoxam23 | EN             | Follow-up;Dashboard   |
    



        @IMPRESS-9748
        Scenario Outline: Test Logout
		
            Given I am logged in with <user> and <password>
             When I select the preference menu in the left menu
              And I logout
             Then I should be logged out

        Examples:
                  | user           | password |
                  | IMP_AUTOMATION | Neoxam23 |
    

