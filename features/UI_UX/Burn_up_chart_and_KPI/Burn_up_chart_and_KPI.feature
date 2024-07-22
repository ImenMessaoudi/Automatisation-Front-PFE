@IMPRESS-10659

Feature: Burn up chart and KPI

              As an Impress user
              I want to
   So that I can 

        @IMPRESS-10660

        Scenario Outline: Dashboard screen is displayed

            Given I am logged in with <user> and <password>
             When I navigate to the screen <screen>
             Then I am in the dashboard screen
              And The sections <sections> are displayed
     
        Examples:
                  | user           | password        | screen          | sections     |
                  | imen.messaoudi | NeoxamMess@2424 | Tableau de bord | Overview;SLA |

        @IMPRESS-10661

        Scenario Outline: Display KPI

            Given I am logged in with <user> and <password>
             When I navigate to the screen <screen>
             Then The KPIs <KPI> are displayed
    
        Examples:
                  | user           | password        | screen          | KPIs                                                                 |
                  | imen.messaoudi | NeoxamMess@2424 | Tableau de bord | Succès;En cours;Erreur;Attente validation;Validation refusée;Terminé |


        @IMPRESS-10673

        Scenario Outline: Selection - Step burnup

            Given I am logged in with <user> and <password>
             When I navigate to the screen <screen>
              And I select the step <step>
             Then The finished runs and the expected runs charts are displayed
              And The legend is displayed

       
        Examples:

                  | user           | password        | screen          | step                |
                  | imen.messaoudi | NeoxamMess@2424 | Tableau de bord | Calc./Gener.        |
                  | imen.messaoudi | NeoxamMess@2424 | Tableau de bord | Validation auditeur |
                  | imen.messaoudi | NeoxamMess@2424 | Tableau de bord | Diffusion           |