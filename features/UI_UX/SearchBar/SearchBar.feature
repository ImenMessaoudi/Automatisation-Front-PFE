        
@IMPRESS-9715
Feature: Search Bar
        
        @IMPRESS-9716
        Scenario Outline: Search: favorite items
            Given I am logged in with <user> and <password>
              And I am on english follow-up screen containing <spreadsheetHeader>
              And I search for criteria <criteria> and <values>
              And I click on button favorite
              And I logout
              Then I should be logged out
              #And I am logged in with <user> and <password>
              #And I click on button search
             #Then the favorite list is displayed with <criteria> and <values>
  


        Examples:
                  | user           | password         | criteria                                               | values                                            | spreadsheetHeader                                                                                                                                                |
                  | imen.messaoudi | NeoxamMess@2424  | Closing month;Jurisdiction;Document;Fund code;Language | 2022-12;lu;PRIIPS-RISK-PERF-COMPUTATION;001915;fr | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |
        
         
         @IMPRESS-97161
        Scenario Outline: Search: favorite items
            Given I am logged in with <user> and <password>
              And I am on english follow-up screen containing <spreadsheetHeader>
              And I search for criteria <criteria> and <values>
              And I click on button favorite
              #And I am logged in with <user> and <password>
              #And I click on button search
             Then the favorite list is displayed with <criteria> and <values>
             And I logout
             And I should be logged out
  


        Examples:
                  | user           | password         | criteria                                               | values                                            | spreadsheetHeader                                                                                                                                                |
                  | imen.messaoudi | NeoxamMess@2424  | Closing month;Jurisdiction;Document;Fund code;Language | 2022-12;lu;PRIIPS-RISK-PERF-COMPUTATION;001915;fr | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |
                  | imen.messaoudi | NeoxamMess@2424  | Closing month;Jurisdiction;Document;Fund code;Language | 2022-12;lu;PRIIPS-RISK-PERF-COMPUTATION;001915;fr | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |
                  
                  
        @IMPRESS-9717
        Scenario Outline:Search Standard

            Given I am logged in with <user> and <password>
              And I am on english follow-up screen containing <spreadsheetHeader>
             When I click on button search
              And I search and select the correspondant <criteria> and <values>
             Then The correspondent workflows <columns> are filled with correspondent <items>
             And I logout
             And I should be logged out

        Examples:
                  | user           | password        | criteria                                 | values                                           | columns                 | items                                          | spreadsheetHeader                                                                                                                                                |
                  | imen.messaoudi | NeoxamMess@2424 | Closing month;Document;Short code;Status | 2022-12;PRIIPS-NARRATIVE-COMPUTATION;AA;Finished | Closing;Doc.;Doc.;Steps | 31/12/22;PRIIPS-NARRATIVE-COMPUTATION;AA;12/12 | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |
                  | imen.messaoudi | NeoxamMess@2424 | Closing month;Document;Short code;Status | 2022-12;PRIIPS-RISK-PERF-COMPUTATION;AA;Finished | Closing;Doc.;Doc.;Steps | 31/12/22;PRIIPS-RISK-PERF-COMPUTATION;AA;12/12 | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |
 
        
        
        @IMPRESS-10100
        Scenario Outline: Search Advanced

            Given I am logged in with <user> and <password>
              And I am on english follow-up screen containing <spreadsheetHeader>
             When I click on button advanced filter
              And I search <criteria> and <values> in advanced table
             #Then The correspondent workflows <columns> are filled with correspondent <items>
             And I logout
             And I should be logged out

        Examples:
                  | user           | password        | criteria  | values | columns | items                       | spreadsheetHeader                                                                                                                                                |
                  | imen.messaoudi | NeoxamMess@2424 | Fund code | 001915 | Fund    | PRIIPS-NARRATIVE-COMPUTATION| Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |
                 