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
             And <StepActionName> switchs to <StepStatus> status Before <timeOut>
             And I verifiy that added languages <AddedLanguages> are displayed
            Then The reports should be displayed in the box form
    

        Examples:
                  | user             | password | criteria                                            | values                                        | StepActionName         | StepStatus | AddedLanguages |
                  | christophe.blay  |          | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2021-12;PRIIPS-EPT-RISK-PERF;en;lu;001915     | Audit (Risque et Perf) | finished   | fr - de - it   |
                  | christophe.blay  |          | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2021-12;PRIIPS-EMT-FUNDS-COMPUTE;en;lu;001915 | Audit (EMT)            | finished   | nl             |
     