@IMPRESS-11503
 
Feature: PRIIPS_Workflows
 
       As an Impress user
       I want to run 
       So that I can 

   @IMPRESS-13940

      Scenario Outline: PRIIPS Risk & Performance

      Given I am logged in with <user> and <password>
      When I search for criteria <criteria> and <values>
      And I access to details of the first result
      And I relaunch the workflow from Initialisation
      And I click on step <StepActionName>
      And <StepActionName> switchs to <StepStatus> status before <timeOut>
      And I download <document>
      And <document> is downloaded
      And I logout
      Then I should be logged out

 
    Examples:
      | user            | password           | criteria                                            | values                                             | StepActionName | StepStatus  | timeOut | document                                       |                                                        
      | imen.messaoudi  | NeoxamMess@2424    | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. |2022-12;PRIIPS-PAST-PERF-COMPUTATION;lu;en;001915   | Audit          | finished    | 1000000 | 001915_2022-12-31_PRIIPS-PAST-PERF-COMPUTATION |
      | imen.messaoudi  | NeoxamMess@2424    | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. |2022-09;PRIIPS-PAST-PERF-COMPUTATION;lu;en;001915   | Audit          | finished    | 1000000 | 001915_2022-09-30_PRIIPS-PAST-PERF-COMPUTATION |
      | imen.messaoudi  | NeoxamMess@2424    | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. |2022-10;PRIIPS-PAST-PERF-COMPUTATION;lu;en;001915   | Audit          | finished    | 1000000 | 001915_2022-10-31_PRIIPS-PAST-PERF-COMPUTATION |
      | imen.messaoudi  | NeoxamMess@2424    | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. |2023-01;PRIIPS-PAST-PERF-COMPUTATION;lu;en;001915   | Audit          | finished    | 1000000 | 001915_2023-01-31_PRIIPS-PAST-PERF-COMPUTATION |
      | imen.messaoudi  | NeoxamMess@2424    | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. |2022-12;PRIIPS-PAST-PERF-COMPUTATION;lu;en;001915   | Audit          | finished    | 1000000 | 001915_2022-12-31_PRIIPS-PAST-PERF-COMPUTATION |
      | imen.messaoudi  | NeoxamMess@2424    | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. |2022-09;PRIIPS-PAST-PERF-COMPUTATION;lu;en;001915   | Audit          | finished    | 1000000 | 001915_2022-09-30_PRIIPS-PAST-PERF-COMPUTATION |
      | imen.messaoudi  | NeoxamMess@2424    | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. |2022-10;PRIIPS-PAST-PERF-COMPUTATION;lu;en;001915   | Audit          | finished    | 1000000 | 001915_2022-10-31_PRIIPS-PAST-PERF-COMPUTATION |
      | imen.messaoudi  | NeoxamMess@2424    | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. |2023-01;PRIIPS-PAST-PERF-COMPUTATION;lu;en;001915   | Audit          | finished    | 1000000 | 001915_2023-01-31_PRIIPS-PAST-PERF-COMPUTATION |



   @IMPRESS-139401

      Scenario Outline:  Narrative Computation

      Given I am logged in with <user> and <password>
      When I search for criteria <criteria> and <values>
      And I access to details of the first result
      And I relaunch the workflow from Initialisation
      And I click on step <StepActionName>
      And <StepActionName> switchs to <StepStatus> status before <timeOut>
      And I download <document>
      And <document> is downloaded
      And I logout
      Then I should be logged out

 
    Examples:
      | user            | password           | criteria                                            | values                                             | StepActionName | StepStatus  | timeOut | document                                       |                                                        
      | imen.messaoudi  | NeoxamMess@2424    | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2022-12;PRIIPS-NARRATIVE-COMPUTATION;lu;en;001915  | Audit          | finished    | 1000000 | 001915_2022-12-31_PRIIPS-NARRATIVE-COMPUTATION |
      | imen.messaoudi  | NeoxamMess@2424    | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2023-02;PRIIPS-NARRATIVE-COMPUTATION;lu;en;001915  | Audit          | finished    | 1000000 | 001915_2023-02-28_PRIIPS-NARRATIVE-COMPUTATION |
      | imen.messaoudi | NeoxamMess@2424    | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2022-03;PRIIPS-NARRATIVE-COMPUTATION;lu;en;001915  | Audit          | finished    | 1000000 | 001915_2022-03-31_PRIIPS-NARRATIVE-COMPUTATION |
      
      
      @IMPRESS-139402
        Scenario Outline:  Past Performance Computation

      Given I am logged in with <user> and <password>
      When I search for criteria <criteria> and <values>
      And I access to details of the first result
      And I relaunch the workflow from Initialisation
      And I click on step <StepActionName>
      And <StepActionName> switchs to <StepStatus> status before <timeOut>
      And I download <document>
      And <document> is downloaded
      And I logout
      Then I should be logged out
 
    Examples:
      | user            | password           | criteria                                            | values                                              | StepActionName | StepStatus  | timeOut | document                                       |                                                        
      | imen.messaoudi  | NeoxamMess@2424    | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2022-06;PRIIPS-PAST-PERF-COMPUTATION;lu;en;001915  | Audit          | finished    | 1000000 | 001915_2022-06-30_PRIIPS-PAST-PERF-COMPUTATION |
      | imen.messaoudi  | NeoxamMess@2424    | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2022-08;PRIIPS-PAST-PERF-COMPUTATION;lu;en;001915  | Audit          | finished    | 1000000 | 001915_2022-08-31_PRIIPS-PAST-PERF-COMPUTATION |
      | imen.messaoudi  | NeoxamMess@2424    | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2023-01;PRIIPS-PAST-PERF-COMPUTATION;lu;en;001915  | Audit          | finished    | 1000000 | 001915_2023-01-31_PRIIPS-PAST-PERF-COMPUTATION |

   
   @IMPRESS-13945
 
      Scenario Outline: PRIIPS Costs & Germany Computation (PERF-WEB-COMP)

      Given I am logged in with <user> and <password>
      When I search for criteria <criteria> and <values>
      And I access to details of the first result
      #And I relaunch the workflow from Initialisation
      And I click on step <StepActionName>
      #And <StepActionName> switchs to <StepStatus> status before <timeOut>
      And I download <document>
      And <document> is downloaded
      And I logout
      Then I should be logged out
      

 
    Examples:
      
      | user            | password          | criteria                                            | values                                             |StepActionName | StepStatus  | timeOut | document                                       |                                                        
      | imen.messaoudi  | NeoxamMess@2424   | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2022-12;PRIIPS-COSTS-RIY-COMPUTATION;lu;en;001915  |Audit          | finished    | 2000000 | 001915_2022-12-31_PRIIPS-COSTS-RIY-COMPUTATION |
      | imen.messaoudi  | NeoxamMess@2424   | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2022-11;PRIIPS-COSTS-RIY-COMPUTATION;lu;en;001915  |Audit          | finished    | 2000000 | 001915_2022-11-30_PRIIPS-COSTS-RIY-COMPUTATION |
      | imen.messaoudi  | NeoxamMess@2424   | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2023-01;PRIIPS-GERMANY-COMPUTATION;lu;en;001915    |Audit          | finished    | 3000000 | 001915_2023-01-31_PRIIPS-GERMANY-COMPUTATION   |
      | imen.messaoudi  | NeoxamMess@2424   | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2022-12;PRIIPS-COSTS-RIY-COMPUTATION;lu;en;001915  |Audit          | finished    | 2000000 | 001915_2022-12-31_PRIIPS-COSTS-RIY-COMPUTATION |
      | imen.messaoudi  | NeoxamMess@2424   | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2022-11;PRIIPS-COSTS-RIY-COMPUTATION;lu;en;001915  |Audit          | finished    | 2000000 | 001915_2022-11-30_PRIIPS-COSTS-RIY-COMPUTATION |
      | imen.messaoudi  | NeoxamMess@2424   | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2023-01;PRIIPS-GERMANY-COMPUTATION;lu;en;001915    |Audit          | finished    | 3000000 | 001915_2023-01-31_PRIIPS-GERMANY-COMPUTATION   |
   
   
   @IMPRESS-139451
 
      Scenario Outline: PRIIPS Costs & Germany Computation (PERF-WEB-COMP)

       Given I am logged in with <user> and <password>
      When I search for criteria <criteria> and <values>
      And I access to details of the first result
      #And I relaunch the workflow from Initialisation
      And I click on step <StepActionName>
      #And <StepActionName> switchs to <StepStatus> status before <timeOut>
      And I download <document>
      And <document> is downloaded
      And I logout
      Then I should be logged out

 
    Examples:
      
      | user            | password          | criteria                                            | values                                             |StepActionName | StepStatus  | timeOut | document                                       |                                                        
      | imen.messaoudi  | NeoxamMess@2424   | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2022-12;PRIIPS-GERMANY-COMPUTATION;lu;en;001915    |Audit          | finished    | 3000000 | 001915_2022-12-31_PRIIPS-GERMANY-COMPUTATION   |
      | imen.messaoudi  | NeoxamMess@2424   | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2023-01;PRIIPS-GERMANY-COMPUTATION;lu;en;001915    |Audit          | finished    | 3000000 | 001915_2023-01-31_PRIIPS-GERMANY-COMPUTATION   |
      | imen.messaoudi  | NeoxamMess@2424   | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2022-03;PRIIPS-GERMANY-COMPUTATION;lu;en;001915    |Audit          | finished    | 3000000 | 001915_2022-03-31_PRIIPS-GERMANY-COMPUTATION   |
  
  
   
  
   @IMPRESS-13946
 
      Scenario Outline:PRIIPS Worflows Report( EPT-EMT)

       Given I am logged in with <user> and <password>
       When I search for criteria <criteria> and <values>
       And I access to details of the first result
       And I relaunch the workflow from Initialisation
       And I click on step <StepActionName>
       And <StepActionName> switchs to <StepStatus> status before <timeOut>
       And I click on step <StepActionName>
       And <StepActionName> switchs to <StepStatus> status before <timeOut>
       #And I download <document>
       #And <document> is downloaded
       And I logout
       Then I should be logged out
 
    Examples:
 
      | user            | password           | criteria                                            | values                                             | StepActionName      | StepStatus  | timeOut |StepActionName  | StepStatus  | timeOut | document                                                |                                                         
      | imen.messaoudi  |  NeoxamMess@2424   | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2022-12;PRIIPS-EMT-4-1-COMPUTATION;lu;en;001915    | Attente des calculs | success     | 1000000 |Audit           | finished     | 1000000 |001915_2022-12-31_PRIIPS-EMT-4-1-COMPUTATION |
      | imen.messaoudi  |  NeoxamMess@2424   | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2022-12;PRIIPS-EMT-4-1-COMPUTATION;lu;en;001915    | Attente des calculs | success     | 1000000 |Audit           | finished     | 1000000 |001915_2022-12-31_PRIIPS-EMT-4-1-COMPUTATION |
      | imen.messaoudi  |  NeoxamMess@2424   | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2022-12;PRIIPS-EMT-4-1-COMPUTATION;lu;en;001915    | Attente des calculs | success     | 1000000 |Audit           | finished     | 1000000 |001915_2022-12-31_PRIIPS-EMT-4-1-COMPUTATION |
      
  
   @IMPRESS-13953
 
      Scenario Outline: PRIIPS KID Report

            Given I am logged in with <user> and <password>
            When I search for criteria <criteria> and <values>
            And I access to details of the first result
            And I relaunch the workflow from Initialisation
            And I click on step <StepActionName>
            And <StepActionName> switchs to wait validation status before <timeOut>
            When I click on button <buttonName>
            Then <StepActionName> switchs to <StepStatus> status before <timeOut>
            And I verifiy that <steps> status is <OtherStepStatus> before <timeOut>
            #And I click on step PDF
            #And I download <document>
            #And <document> is downloaded
            #And Auditeur switchs to <StepActionStatus> status before <timeOut>
            And I logout
            Then I should be logged out
   
  
        Examples:
                  | user           | password | criteria                                                   | values                                 | StepActionName | StepActionStatus | buttonName | StepStatus | timeOut  | steps    | OtherStepStatus |
                  | imen.messaoudi | NeoxamMess@2424 | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2022-12;PRIIPS-KID-REPORT;LU;fr;001915 | Edition        | wait validation  | Accepter   | success    | 1000000 | Pdf;Docx     | success;success |
                  | imen.messaoudi | NeoxamMess@2424 | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2022-12;PRIIPS-KID-REPORT;LU;fr;001915 | Edition        | wait validation  | Accepter   | success    | 1000000 | Pdf;Docx     | success ;success| 

  @IMPRESS-13959
 
      Scenario Outline: PRIIPS PERF WEB REPORT
       Given I am logged in with <user> and <password>
       When I search for criteria <criteria> and <values>
       And I access to details of the first result
       And I relaunch the workflow from Initialisation
       And I click on step <StepActionName>
       And <StepActionName> switchs to <StepStatus> status before <timeOut>
       #And I choose to download the <document>
       #Then The <document> should be downloaded
 
 
    Examples:
 
      | user            | password         | criteria                                            | values                                       | StepActionName    | StepStatus  | timeOut | document                                                  |                                                         
      | imen.messaoudi  | NeoxamMess@2424  | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2022-12;PRIIPS-PERF-WEB-REPORT;lu;en;001915  | Génération HTML   | success     | 1000000 | PART_001915_C1_2021-12-31_PRIIPS-PERF-WEB-REPORT_lu_final   |
 
  @IMPRESS-13956
 
      Scenario Outline:PRIIPS workflow Agregation(EPT-EMT-PerfWeb)
       Given I am logged in with <user> and <password>
       When I search for criteria <criteria> and <values>
       And I access to details of the first result
       And I relaunch the workflow from Initialisation
       And I click on step <StepActionName>
       And <StepActionName> switchs to <StepStatus> status before <timeOut>
       And I choose to download the <document>
       Then The <document> should be downloaded
 
 
    Examples:
 
      | user           | password           | criteria                                            | values                                           | StepActionName | StepStatus  | timeOut | document                                               |                                                         
      | imen.messaoudi | NeoxamMess@2424    | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2021-12;PRIIPS-EMT-4-0-COMPUTATION;lu;en;001915  | Audit          | finished    | 1000000 | 001915_2021-12-31_PRIIPS-EMT-4-0-COMPUTATION_lu_audit  |
 
   @IMPRESS-13949
 
      Scenario Outline: PRIIPS EPT 2-1 Report
       Given I am logged in with <user> and <password>
       When I search for criteria <criteria> and <values>
       And I access to details of the first result
       And I relaunch the workflow from Initialisation
       And I click on step <StepActionName>
       And <StepActionName> switchs to <StepStatus> status before <timeOut>
       And I choose to download the <document>
       And The <document> should be downloaded
       And I click on step Validation
       And Validation switchs to wait validation status before <timeOut>
       And I click on button Accept
       Then Validation switchs to finished status before <timeOut>
 
 
    Examples:
 
      | user          | password      | criteria                                            | values                                      | StepActionName   | StepStatus  | timeOut | document                                                 |                                                         
      | IMP_STANDARD  | Neoxam123*    | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2021-12;PRIIPS-EPT-2-1-REPORT;lu;en;001915  | Génération XLSX  | success     | 1000000 | PART_001915_C1_2021-12-31_PRIIPS-EPT-2-1-REPORT_lu_final |
 
 
   @IMPRESS-13957
 
      Scenario Outline: PRIIPS KID Report
       Given I am logged in with <user> and <password>
       When I search for criteria <criteria> and <values>
       And I access to details of the first result
       And I relaunch the workflow from Initialisation
       And I click on step Edition
       And Edition switchs to wait validation status before <timeOut>
       And I click on button Reject
       And Edition switchs to error status before <timeOut>
       And I click on button Relancer
       And Edition switchs to wait validation status before <timeOut>
       And I click on button Accept
       And Edition switchs to success status before <timeOut>
       And I click on step <StepActionName>
       And <StepActionName> switchs to <StepStatus> status before <timeOut>
       And I choose to download the <document>
       And The <document> should be downloaded
       And I click on step Pdf
       Then I  download the Pdf document <PdfDocument> in the specified directory
 
 
    Examples:
 
      | user          | password      | criteria                                            | values                                  | StepActionName   | StepStatus  | timeOut | document                                                 | PdfDocument                                           |             
      | IMP_STANDARD  | Neoxam123*    | Mois d'arrêté;Document;Juridiction;Langue;Code Ptf. | 2021-12;PRIIPS-KID-REPORT;lu;fr;001915  | Docx             | success     | 1000000 | PART_001915_D1_2021-12-31_PRIIPS-KID-REPORT_lu_final     | PART_001915_D1_2021-12-31_PRIIPS-KID-REPORT_lu_final  |
 
 
  