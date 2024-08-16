@IMPRESS-14448

Feature: EFA Audit Multilangue

              As an Impress user
              I want to run an annual account workflow
              So that I can generate an annual account


        @IMPRESS-14452
        Scenario Outline: EFA Audit Multilangue

           Given I am logged in with <user> and <password>
             When I search for criteria <criteria> and <values>
             And I access to details of the first result
             And I relaunch the workflow from Initialisation
             And I click on step <StepActionName>
             #And <StepActionName> switchs to <StepStatus> status Before 1000000
             And I verifiy that added languages <AddedLanguages> are displayed
            Then The reports should be displayed in the box form
    

        Examples:
                  | user            | password       | criteria                                            | values                                            | StepActionName   | StepStatus | AddedLanguages |
                  | imen.messaoudi  | NeoxamMess@2424| Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2022-12;PRIIPS-PAST-PERF-COMPUTATION;fr;lu;001915 | Audit            | finished   | fr - de - it   |
                  | imen.messaoudi  |NeoxamMess@2424 | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2022-12;PRIIPS-EMT-4-1-REPORT;en;lu;001915        | Audit            | finished   | nl             |
     