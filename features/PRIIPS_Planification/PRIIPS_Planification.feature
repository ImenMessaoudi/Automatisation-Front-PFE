@IMPRESS-15435

 Feature: Planification PRIIPS

       As an Impress user
       I want to run an annual report workflow
       So that I can generate an annual report

      @IMPRESS-15442

        Scenario Outline: Schedule Search

            Given I am logged in with <user> and <password>
             When I navigate to the screen <screen>
             Then I search for criteria <criteria> and <values>
             And The spreadsheet must be displayed

     
        Examples:
                  | user            | password         | screen        | criteria                   | values                          | 
                  | imen.messaoudi  |NeoxamMess@2424   | Planification | Début;Fin;Langue;Fréquence | 2022-02-07;2024-12-26;en;MONTHLY|  


      @IMPRESS-15443
         
        Scenario Outline: Display The Schedule FORM POPUP

            Given I am logged in with <user> and <password>
             When I navigate to the screen <screen>
             And I click on the create button
             Then The schedule form popup should be displayed

     
        Examples:
                  | user            | password         | screen        | 
                  | imen.messaoudi  | NeoxamMess@2424  | Planification |


      @IMPRESS-15444
         
        Scenario Outline: Create a Schedule

            Given I am logged in with <user> and <password>
             When I navigate to the screen <screen>
             And I click on the create button
             And I Select the report <Report>  
             And I Choose the umbrella <Umbrella>
             And I pick The Fund <Fund>
             And I select The Fund share <FundShare>
             And I Pick the jurisdiction <Jurisdiction> 
             And I pick a language <Languages> from the displayed languages
             And I select toggle switch action <SwitchAction>
             And I select a frequency <Frequency> 
             And I choose production start <ProductionStart> 
             And I select the production end <ProductionEnd>
             And I click on the save button
             Then The workflow had to be saved 
             And The workflow should be added to the spreadsheet
     
        Examples:
                  | user            | password          | screen        | Report      | Umbrella       | Fund    | FundShare     | Jurisdiction | Languages | SwitchAction | Frequency | ProductionStart | ProductionEnd | 
                  | imen.messaoudi  | NeoxamMess@2424   | Planification | EPT 2.1(En) | Rivertree Fd.  | 001915  | 001915C2      | Croatia      | EN        | ON           | Mensuel   | 06/01/2021      | 30/10/2024    |   

        
      @IMPRESS-15445
         
        Scenario Outline: Clear a Schedule

            Given I am logged in with <user> and <password>
             When I navigate to the screen <screen>
             And I click on the create button
             And I Select the report <Report>  
             And I Choose the umbrella <Umbrella>
             And I pick The Fund <Fund>
             And I select The Fund share <FundShare>
             And I Pick the jurisdiction <Jurisdiction> 
             And I pick a language <Languages> from the displayed languages
             And I select toggle switch action <SwitchAction>
             And I click on clear button 
             Then The selected fields from the schedule popup should be empty
     
        Examples:
                  | user            | password         | screen        | Report      | Umbrella      | Fund    | Fund Share | Jurisdiction | Languages | SwitchAction | 
                  | imen.messaoudi  | NeoxamMess@2424  | Planification | EPT 2.1(En) | Rivertree Fd. | 001915  | 001915C2   | Austria      | EN        | OFF          |  


      @IMPRESS-15446

        Scenario Outline: Display Row Actions

            Given I am logged in with <user> and <password>
             When I navigate to the screen <screen>
             And I search for criteria <criteria> and <values>
             Then Additional select actions appears after selecting the displayed workflow

     
        Examples:
                  | user            | password        | screen        | criteria                   | values                           | 
                  | imen.messaoudi  | NeoxamMess@2424 | Planification | Début;Fin;Langue;Fréquence | 2023-08-22;2024-08-22;EN;MONTHLY |  


      @IMPRESS-15447

        Scenario Outline: Run a workflow

            Given I am logged in with <user> and <password>
             When I navigate to the screen <screen>
             And I search for criteria <criteria> and <values>
             And I select the displayed workflow 
             And I click on the run button
             Then The workflow should be executed

     
        Examples:
                  | user            | password        | screen        | criteria                   | values                           | 
                  | imen.messaoudi  | NeoxamMess@2424 | Planification | Début;Fin;Langue;Fréquence | 2023-08-22;2024-08-22;EN;MONTHLY |   

      @IMPRESS-15448

        Scenario Outline: Delete a workflow

            Given I am logged in with <user> and <password>
             When I navigate to the screen <screen>
             And I search for criteria <criteria> and <values>
             And I select the displayed workflow 
             And I click on  delete button
             Then the workflow must be deleted

     
        Examples:
                  | user            | password         | screen        | criteria                   | values                           | 
                  | imen.messaoudi  | NeoxamMess@2424  | Planification | Début;Fin;Langue;Fréquence | 2023-08-22;2026-08-22;LT;MONTHLY |  




      @IMPRESS-15449

        Scenario Outline: Export Scheduled Reports

            Given I am logged in with <user> and <password>
             When I navigate to the screen <screen>
             And I click on the Export icon
             Then The scheduled reports document should be downloaded

     
        Examples:
                  | user            | password        | screen        |           
                  | imen.messaoudi  | NeoxamMess@2424 | Planification | 


       @IMPRESS-15450

        Scenario Outline: Edit a displayed workflow

            Given I am logged in with <user> and <password>
             When I navigate to the screen <screen>
             And I search for criteria <criteria> and <values>
             And I select the displayed workflow 
             And I click on the actions link
             And I click on displayed edit icon
             And I choose a frequency <Frequency> 
             And I choose production start <ProductionStart> 
             And I select the production end <ProductionEnd>
             And I click on the save button
             Then The informations should be updated
     
        Examples:
                  | user            | password           | screen        | criteria                  | values                          |  Frequency | ProductionStart | ProductionEnd |
                  | imen.messaoudi  |  NeoxamMess@2424   | Planification | Début;Fin;Langue;Fréquence| 2023-08-22;2023-12-26;FR;Monthly|  MONTHLY   | 06/06/2023      | 30/6/2027     | 


