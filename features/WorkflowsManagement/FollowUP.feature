@IMPRESS-9684
Feature: Follow-up screen
              As an Impress user
              I want to display and manipulate the Follow-up screen
              So that I can follow and manipulate running workflow
 

        @IMPRESS-9661
        Scenario Outline:  Display Follow-up screen
  
            Given I am logged in with <user> and <password>
             When I navigate to the screen <screen>
             Then I am on english follow-up screen containing <spreadsheetHeader>
              And workflow section is displayed
 
        Examples:
                  | user           | password         | screen | spreadsheetHeader                                                                                                                                                |
                  | imen.messaoudi | NeoxamMess@2424  | Suivi  | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |
    


        @IMPRESS-9685
        Scenario Outline:  Quick filters

            Given I am logged in with <user> and <password>
              And I am on english follow-up screen containing <spreadsheetHeader>
             When I activate button <filterButton> of <filter> filter
             Then  Quick filters are <filterStatus>

        Examples:
                  | user           | password        | filter        | filterButton | filterStatus | spreadsheetHeader                                                                                                                                                |
                  | imen.messaoudi | NeoxamMess@2424 | Quick filters | Off          | Hidden       | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |
                  | imen.messaoudi | NeoxamMess@2424 | Quick filters | On           | Displayed    | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |
                 

       
        @IMPRESS-9669
        Scenario Outline: Select all workflows
  
            Given I am logged in with <user> and <password>
              And I am on english follow-up screen containing <spreadsheetHeader>
             When I check select All button
             Then All reports are selected
              And <ItemsButtons> are enabled and displayed
    
        Examples:
                  | user           | password       | ItemsButtons                                                                                                 | spreadsheetHeader                                                                                                                                                |
                  | imen.messaoudi |NeoxamMess@2424 | Assign;Export;Validate;Reject;Skip;Relaunch last action;Relaunch;Archive;Datahub;low;standard;high;emergency | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |
                
                  
                           
        @IMPRESS-9670
        Scenario Outline: Deselect all workflows
  
            Given I am logged in with <user> and <password>
              And I am on english follow-up screen containing <spreadsheetHeader>
             When I check select All button
              And I uncheck select All button
             Then All reports are deselected
              And  <Itemsbuttons> are not displayed
     
        Examples:
                  | user           | password        | ItemsButtons                                                                                                 | spreadsheetHeader                                                                                                                                                |
                  | imen.messaoudi | NeoxamMess@2424 | Assign;Export;Validate;Reject;Skip;Relaunch last action;Relaunch;Archive;Datahub;low;standard;high;emergency | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |
                 

    
        @IMPRESS-9874
        Scenario Outline:  Display workflows from quick Filters

            Given I am logged in with <user> and <password>
              And I am on english follow-up screen containing <spreadsheetHeader>
              And the filter Quick filters is On
              And the filter Grouping is Off
             When I choose <Filters> and <filterItems>
             Then The correspondent workflows <columns> are filled with correspondent <values>
              And <Filters> and <filterItems> are displayed on the search bar
        Examples:
                
                  | user           | password | Filters                                  | filterItems                         | spreadsheetHeader                                                                                                                                                | columns                          | values                                         |
                  | IMP_AUTOMATION | Neoxam23 | Document;Short code;Status;Closing month | AA-FR-UCITS;AA;Finished;2021-12     | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion | Doc.;Doc.;Steps;Closing          | AA-FR-UCITS;AA;12/12;31/12/20                  |
                  | IMP_AUTOMATION | Neoxam23 | Priority;Regulation;Language;Man co      | high;AIF;fr;Amundi Asset Management | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion | Prio;Reg;Jurid - Lang;Man Co val | high;AIF;Language: FR; Amundi Asset Management |
                   
                  
       
        @IMPRESS-9890
        Scenario Outline:  Grouping Umbrella workflows

            Given I am logged in with <user> and <password>
              And I am on english follow-up screen containing <spreadsheetHeader>
             When I activate button <filterButton> of Grouping filter
              And I activate button <FilteringMode> of Filtering mode filter
              And I search for criteria <criteria> and <values>
             Then Umbrella are grouped by <criteriaGroup> and <values>
              And Umbrella <UmbrellaName> is shown up and linked compartiment are <CompartementStatus>

        Examples:
                  | user           | password | criteria                                      | values                        | filterButton | FilteringMode | UmbrellaName | CompartementStatus | spreadsheetHeader                                                                                                                                                | criteriaGroup            |
                  | IMP_AUTOMATION | Neoxam23 | Fund code;Document;Closing month;Jurisdiction | AEROPE;AR-UMBRELLA;2021-12;fr | On           | Block         | AMUNOR       | displayed          | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion | AEROPE (AR asof 2021-12) |
                  | IMP_AUTOMATION | Neoxam23 | Fund code;Document;Closing month;Jurisdiction | AEROPE;AR-UMBRELLA;2021-12;fr | On           | Row           | AMUNOR       | Hidden             | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion | AEROPE (AR asof 2021-12) |
  