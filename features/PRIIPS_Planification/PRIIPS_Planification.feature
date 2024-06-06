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
                  | user            | password    | screen        | criteria                   | values                          | 
                  | abir.khabthani  |             | Planification | Début;Fin;Langue;Fréquence | 2023-02-07;2024-12-26;en;MONTHLY|  


      @IMPRESS-15443
         
        Scenario Outline: Display The Schedule FORM POPUP

            Given I am logged in with <user> and <password>
             When I navigate to the screen <screen>
             And I click on the create button
             Then The schedule form popup should be displayed

     
        Examples:
                  | user            | password    | screen        | 
                  | abir.khabthani  |             | Planification | 


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
             And I choose a frequency <Frequency> 
             And I choose production start <ProductionStart> 
             And I select the production end <ProductionEnd>
             And I click on the save button
             Then The workflow had to be saved 
             And The workflow should be added to the spreadsheet
     
        Examples:
                  | user            | password    | screen        | Report      | Umbrella          | Fund           | FundShare     | Jurisdiction | Languages | SwitchAction | Frequency | ProductionStart | ProductionEnd | 
                  | abir.khabthani  |             | Planification | EPT 2.1(En) | UMBRELLA_NAME_62  | FUND_NAME_138  | Tous          | Croatia      | EN        | ON           | Mensuel   | 06/01/2021      | 30/10/2026    |   

        
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
                  | user            | password    | screen        | Report      | Umbrella          | Fund           | Fund Share     | Jurisdiction | Languages | SwitchAction | 
                  | abir.khabthani  |             | Planification | EPT 2.1(En) | UMBRELLA_NAME_64  | FUND_NAME_142  | SHARE_NAME_70  | Austria      | EN        | OFF          |  


      @IMPRESS-15446

        Scenario Outline: Display Row Actions

            Given I am logged in with <user> and <password>
             When I navigate to the screen <screen>
             And I search for criteria <criteria> and <values>
             Then Additional select actions appears after selecting the displayed workflow

     
        Examples:
                  | user            | password    | screen        | criteria                   | values                           | 
                  | abir.khabthani  |             | Planification | Début;Fin;Langue;Fréquence | 2023-08-22;2024-08-22;EN;MONTHLY |  


      @IMPRESS-15447

        Scenario Outline: Run a workflow

            Given I am logged in with <user> and <password>
             When I navigate to the screen <screen>
             And I search for criteria <criteria> and <values>
             And I select the displayed workflow 
             And I click on the run button
             Then The workflow should be executed

     
        Examples:
                  | user            | password    | screen        | criteria                   | values                           | 
                  | abir.khabthani  |             | Planification | Début;Fin;Langue;Fréquence | 2023-08-22;2024-08-22;EN;MONTHLY |   

      @IMPRESS-15448

        Scenario Outline: Delete a workflow

            Given I am logged in with <user> and <password>
             When I navigate to the screen <screen>
             And I search for criteria <criteria> and <values>
             And I select the displayed workflow 
             And I click on  delete button
             Then the workflow must be deleted

     
        Examples:
                  | user            | password    | screen        | criteria                   | values                           | 
                  | abir.khabthani  |             | Planification | Début;Fin;Langue;Fréquence | 2023-08-22;2026-08-22;LT;MONTHLY |  




      @IMPRESS-15449

        Scenario Outline: Export Scheduled Reports

            Given I am logged in with <user> and <password>
             When I navigate to the screen <screen>
             And I click on the Export icon
             Then The scheduled reports document should be downloaded

     
        Examples:
                  | user            | password    | screen        |           
                  | abir.khabthani  |             | Planification | 


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
                  | user            | password    | screen        | criteria                  | values                          |  Frequency | ProductionStart | ProductionEnd |
                  | abir.khabthani  |             | Planification | Début;Fin;Langue;Fréquence| 2023-08-22;2023-12-26;FR;Monthly|  Monthly   | 06/06/2023      | 30/6/2027     | 


