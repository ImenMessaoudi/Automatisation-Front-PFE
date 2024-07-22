        
@IMPRESS-9715
Feature: Search Bar
        
        @IMPRESS-9716
        Scenario Outline: Search: favorite items
            Given I am logged in with <user> and <password>
              And I am on english follow-up screen containing <spreadsheetHeader>
              And I search for criteria <criteria> and <values>
              And I click on button favorite
             When I logout
              And I am logged in with <user> and <password>
              And I click on button search
             Then the favorite list is displayed with <criteria> and <values>
  


        Examples:
                  | user           | password         | criteria                                               | values                                            | spreadsheetHeader                                                                                                                                                |
                  | imen.messaoudi | NeoxamMess@2424  | Closing month;Jurisdiction;Document;Fund code;Language | 2022-12;lu;PRIIPS-RISK-PERF-COMPUTATION;001915;fr | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |


                  
                  
        @IMPRESS-9717
        Scenario Outline:Search Standard

            Given I am logged in with <user> and <password>
              And I am on english follow-up screen containing <spreadsheetHeader>
             When I click on button search
              And I search and select the correspondant <criteria> and <values>
             Then The correspondent workflows <columns> are filled with correspondent <items>


        Examples:
                  | user           | password        | criteria                                 | values                          | columns                 | items                         | spreadsheetHeader                                                                                                                                                |
                  | imen.messaoudi | NeoxamMess@2424 | Closing month;Document;Short code;Status | 2022-06;AA-FR-UCITS;AA;Finished | Closing;Doc.;Doc.;Steps | 30/12/20;AA-FR-UCITS;AA;12/12 | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |

       
        @IMPRESS-10100
        Scenario Outline: Search Advanced

            Given I am logged in with <user> and <password>
              And I am on english follow-up screen containing <spreadsheetHeader>
             When I click on button advanced filter
              And I search <criteria> and <values> in advanced table
             Then The correspondent workflows <columns> are filled with correspondent <items>
            

        Examples:
                  | user           | password        | criteria  | values | columns | items  | spreadsheetHeader                                                                                                                                                |
                  | imen.messaoudi | NeoxamMess@2424 | Fund code | 050645 | Fund    | 050645 | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |
                 