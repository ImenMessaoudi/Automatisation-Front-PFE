@IMPRESS-9625

Feature: French annual account workflow

              As an Impress user
              I want to run an annual account workflow
              So that I can generate an annual account


        @IMPRESS-9640
        Scenario Outline: Relaunching workflow

            Given I am logged in with <user> and <password>
             When I search for criteria <criteria> and <values>
              And I access to details of the first result
              And I relaunch the workflow from Initialisation
              And I click on step <StepActionName>
             Then <StepActionName> switchs to <StepStatus> status before <timeOut>
              And I verifiy that <steps> status is <OtherStepStatus> before <timeOut>
              And I logout
             Then I should be logged out
    

        Examples:
                  | user           | password        | criteria                                | values                                         | StepActionName | StepStatus | steps         | timeOut | OtherStepStatus                         |
                  | imen.messaoudi | NeoxamMess@2424 | Mois d'arrêté;Document;Langue;Code Ptf. | 2022-12;PRIIPS-NARRATIVE-COMPUTATION;en;001915 | Initialisation | success    | Compute;Audit | 10000   | waiting;waiting;waiting;waiting;waiting |
                  | imen.messaoudi | NeoxamMess@2424 | Mois d'arrêté;Document;Langue;Code Ptf. | 2022-12;PRIIPS-COSTS-RIY-COMPUTATION;en;001915 | Initialisation | success    | Compute;Audit | 10000   | waiting;waiting;waiting;waiting;waiting |
                  | imen.messaoudi | NeoxamMess@2424 | Mois d'arrêté;Document;Langue;Code Ptf. | 2022-12;PRIIPS-PAST-PERF-COMPUTATION;en;001915 | Initialisation | success    | Compute;Audit | 10000   | waiting;waiting;waiting;waiting;waiting |
                  | imen.messaoudi | NeoxamMess@2424 | Mois d'arrêté;Document;Langue;Code Ptf. | 2022-09;PRIIPS-COSTS-RIY-COMPUTATION;en;001915 | Initialisation | success    | Compute;Audit | 10000   | waiting;waiting;waiting;waiting;waiting |
                  | imen.messaoudi | NeoxamMess@2424 | Mois d'arrêté;Document;Langue;Code Ptf. | 2022-11;PRIIPS-COSTS-RIY-COMPUTATION;en;001915 | Initialisation | success    | Compute;Audit | 10000   | waiting;waiting;waiting;waiting;waiting |
                  | imen.messaoudi | NeoxamMess@2424 | Mois d'arrêté;Document;Langue;Code Ptf. | 2023-02;PRIIPS-COSTS-RIY-COMPUTATION;en;001915 | Initialisation | success    | Compute;Audit | 10000   | waiting;waiting;waiting;waiting;waiting |
                  | imen.messaoudi | NeoxamMess@2424 | Mois d'arrêté;Document;Langue;Code Ptf. | 2022-01;PRIIPS-COSTS-RIY-COMPUTATION;en;001915 | Initialisation | success    | Compute;Audit | 10000   | waiting;waiting;waiting;waiting;waiting |
                  | imen.messaoudi | NeoxamMess@2424 | Mois d'arrêté;Document;Langue;Code Ptf. | 2022-12;PRIIPS-COSTS-RIY-COMPUTATION;en;001915 | Initialisation | success    | Compute;Audit | 10000   | waiting;waiting;waiting;waiting;waiting |
  
        @IMPRESS-9643
        Scenario Outline: Validate edition step
  
            Given I am logged in with <user> and <password>
             When I search for criteria <criteria> and <values>
              And I access to details of the first result
              And I relaunch the workflow from Initialisation
              And I click on step <StepActionName>
              And <StepActionName> switchs to wait validation status before <timeOut>
             When I click on button <buttonName>
             Then <StepActionName> switchs to <StepStatus> status before <timeOut>
              And I verifiy that <steps> status is <OtherStepStatus> before <timeOut>
              #And Auditeur switchs to <StepActionStatus> status before <timeOut>
              And I logout
             Then I should be logged out
  
        Examples:
                  | user           | password | criteria                                                   | values                                     | StepActionName | StepActionStatus | buttonName | StepStatus  | timeOut  | steps                                                  | OtherStepStatus         |
                  | imen.messaoudi | NeoxamMess@2424 | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2022-12;PRIIPS-EMT-4-1-REPORT;CH;fr;001915 | Validation     | wait validation  | Accepter   | finished    | 1000000  | Attente des calculs EMT;Génération CSV;XLSX generation | success;success;success |
                  | imen.messaoudi | NeoxamMess@2424 | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2022-12;PRIIPS-EMT-4-1-REPORT;CH;fr;001915 | Validation     | wait validation  | Accepter   | finished    | 1000000  | Attente des calculs EMT;Génération CSV;XLSX generation | success;success;success | 


        @IMPRESS-96431

        Scenario Outline: Validate edition step
  
            Given I am logged in with <user> and <password>
             When I search for criteria <criteria> and <values>
              And I access to details of the first result
              And I relaunch the workflow from Initialisation
              And I click on step <StepActionName>
              And <StepActionName> switchs to wait validation status before <timeOut>
             When I click on button <buttonName>
             Then <StepActionName> switchs to <StepStatus> status before <timeOut>
              And I verifiy that <steps> status is <OtherStepStatus> before <timeOut>
              #And Auditeur switchs to <StepActionStatus> status before <timeOut>
              And I logout
             Then I should be logged out
   
  
        Examples:
                  | user           | password | criteria                                                   | values                                     | StepActionName | StepActionStatus | buttonName | StepStatus | timeOut | steps        | OtherStepStatus         |
                  | imen.messaoudi | NeoxamMess@2424 | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2022-12;EPT_V2.1;LU;fr;001915 | Validation     | wait validation  | Accepter   | finished    | 1000000  | Attente des calculs EMT;Génération CSV;XLSX generation | success;success;success |
                  | imen.messaoudi | NeoxamMess@2424 | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2022-12;EPT_V2.1;LU;fr;001915 | Validation     | wait validation  | Accepter   | finished    | 1000000  | Attente des calculs EMT;Génération CSV;XLSX generation | success;success;success | 

        
        @IMPRESS-9841
        Scenario Outline: Go to linked report-account

            Given I am logged in with <user> and <password>
             When I search for criteria <criteria> and <values>
              And I access to details of the first result
              And I click on Go to annual report
             Then <report_screen_name> screen is displayed with right <data> and <dataValues>
  
        Examples:
                  | user           | password        | criteria                                            | values                                     | data                                      | report_screen_name                                             | dataValues      |
                  | imen.messaoudi | NeoxamMess@2424 | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2022-12;PRIIPS-EMT-4-1-REPORT;CH;fr;001915 | Code Ptf.:,Document:,Langue:,Juridiction: | Workflow allégé de rapport annuel OPCFM FR (Dissémination pdf) | 050666,AR,fr,fr |
                  | imen.messaoudi |NeoxamMess@2424  | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. |2022-12;PRIIPS-EMT-4-1-REPORT;CH;fr;001915  | Code Ptf.:,Document:,Langue:,Juridiction: | Workflow allégé de comptes annuels OPCVM FR                    | 050666,AA,fr,fr |



        @IMPRESS-10043

        Scenario Outline: Validate rejected step

            Given I am logged in with <user> and <password>
             When I search for criteria <criteria> and <values>
              And I access to details of the first result
              And I relaunch the workflow from Initialisation
              And I click on step <StepActionName>
              And <StepActionName> switchs to wait validation status before <timeOut>
              And I click on button Rejeter
              And <StepActionName> switchs to error status before <timeOut>
              And I click on step <StepActionName>
              And I click on button Relancer
              And <StepActionName> switchs to wait validation status before <timeOut>                                                                                                                                          <timeOut>
              And I click on step <StepActionName>
              And I click on button Accepter
              And <StepActionName> switchs to success status before <timeOut>
              And I verifiy that <steps> status is <OtherStepStatus> before <timeOut>
  
        Examples:
                  | user           | password | criteria                                            | values                           | StepActionName | timeOut | steps        | OtherStepStatus         |
                  | IMP_AUTOMATION | Neoxam23 | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2021-12;AA-FR-UCITS;fr;fr;008002 | Edition        | 900000  | Docx;Doc;Pdf | running;waiting;waiting |


        @IMPRESS-9642
        Scenario Outline: French annual account workflow: Retrieving validated step
            Given I am logged in with <user> and <password>
             When I search for criteria <criteria> and <values>
              And I access to details of the first result
              And I relaunch the workflow from Initialisation
             Then Edition switchs to <StepStatus> status before <timeOut>
              And I verifiy that <steps> status is <OtherStepStatus> before <timeOut>
       
        Examples:

                  | user           | password | criteria                                            | values                           | StepStatus      | OtherStepStatus                         | timeOut | steps                                           |
                  | IMP_AUTOMATION | Neoxam23 | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2021-12;AA-FR-UCITS;fr;fr;001067 | wait validation | success;success;success;success;success | 900000  | Initialisation;Compute;Contrib;Génération;Audit |
                
                 
        @IMPRESS-9651
        Scenario Outline: Validate validation step

            Given I am logged in with <user> and <password>
              And I search for criteria <criteria> and <values>
              And I access to details of the first result
              And I relaunch the workflow from Initialisation
              And I click on step Edition
              And Edition switchs to <StepStatus> status before <timeOut>
              And I click on button Accepter
              And <StepActionName> switchs to <StepStatus> status before <timeOut>
              And I click on step Auditeur
             When I click on button <buttonName>
             Then <StepActionName> switchs to <StepActionStatus> status before <timeOut>
              And I verifiy that <steps> status is <OtherStepStatus> before <timeOut>
        Examples:

                  | user           | password | criteria                                            | values                           | StepStatus      | StepActionName | buttonName | StepActionStatus   | timeOut | steps       | OtherStepStatus  |
                  | IMP_AUTOMATION | Neoxam23 | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2021-12;AA-UMBRELLA;fr;fr;PEGMDE | wait validation | Auditeur       | Accepter   | success            | 900000  | Rapport;BDF | success;finished |
                  | IMP_AUTOMATION | Neoxam23 | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2021-12;AA-UMBRELLA;fr;fr;PEGMDE | wait validation | Auditeur       | Rejeter    | validation_refused | 900000  | Rapport;BDF | waiting;waiting  |
                  
            
        @IMPRESS-10046
        Scenario Outline: Skip a workflow step
  
            Given I am logged in with <user> and <password>
              And I search for criteria <criteria> and <values>
              And I access to details of the first result
              And I relaunch the workflow from Initialisation
              And <StepActionName> switchs to <StepActionStatus> status before <timeOut>
              And I click on step <StepActionName>
             When I click on button <buttonName>
             Then <StepActionName> switchs to skipped status before <timeOut>
     
        Examples:
                  | user           | password | criteria                                            | values                           | StepActionName | buttonName | StepActionStatus | timeOut |
                  | IMP_AUTOMATION | Neoxam23 | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2020-12;AA-FR-UCITS;fr;fr;050666 | Compute        | Skip       | running          | 900000  |
                  | IMP_AUTOMATION | Neoxam23  | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2021-02;AA-FR-UCITS;fr;fr;000AAQ | Compute        | Skip       | error            | 900000  |




