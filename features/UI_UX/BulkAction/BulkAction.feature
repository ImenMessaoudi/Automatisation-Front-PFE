@IMPRESS-9876
Feature: Bulk Action
              As an Impress user
              I want to display and manipulate the Follow-up screen
              So that I can follow and manipulate running workflow
 
        @IMPRESS-9878
        Scenario Outline: Assign a workflow to a DATAHUB USER

            Given I am logged in with <user> and <password>
              And I am on english follow-up screen containing <spreadsheetHeader>
             When I select <number> runs in workflow section
              And bulk action menu is displayed
              And I choose a <DHuser>
              And I click on button Assign
             Then the workflow is assigned to <DHuser>
              And <AssignIcon> is displayed in Resp column in the selected workflows

  
        Examples:
         
                  | user           | password | DHuser         | AssignIcon | number | spreadsheetHeader                                                                                                                                                |
                  | IMP_AUTOMATION | Neoxam23 | IMP_AUTOMATION | I          | 1      | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |
                  | IMP_AUTOMATION | Neoxam23 | ETENGUE        | E          | 1      | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |


        @IMPRESS-10003
        Scenario Outline: Change Priority
            Given I am logged in with <user> and <password>
              And I am on english follow-up screen containing <spreadsheetHeader>
             When I select <number> runs in workflow section
              And bulk action menu is displayed
              And I click on button <Priority>
             Then the <Priority> is changed for the <number> selected workflows

        Examples:
                  | user           | password | Priority  | number | spreadsheetHeader                                                                                                                                                |
                  | IMP_AUTOMATION | Neoxam23 | emergency | 3      | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |
                  | IMP_AUTOMATION | Neoxam23 | high      | 2      | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |
                  | IMP_AUTOMATION | Neoxam23 | low       | 1      | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |
            
       
        @IMPRESS-9879
        Scenario Outline: Export workflow with history

            Given I am logged in with <user> and <password>
              And I am on english follow-up screen containing <spreadsheetHeader>
             When I select <number> runs in workflow section
              And bulk action menu is displayed
              And I check history box
              And I click on button export
             Then production file download is done

        Examples:
                  | user           | password | number | spreadsheetHeader                                                                                                                                                |
                  | IMP_AUTOMATION | Neoxam23 | 3      | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |

          
        @IMPRESS-9881
        Scenario Outline: Archive workflow

            Given I am logged in with <user> and <password>
              And I am on english follow-up screen containing <spreadsheetHeader>
             When I search for criteria <criteria> and <values>
              And I select <number> runs in workflow section
              And bulk action menu is displayed
              And I click on button Archive
             Then the workflows are deleted from the workflow section

        Examples:
                  | user           | password | number | criteria  | values | spreadsheetHeader                                                                                                                                                |
                  | IMP_AUTOMATION | Neoxam23 | 1      | Fund code | 001300 | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |


        @IMPRESS-10005
        Scenario Outline: Validate or reject steps from bulk action

            Given I am logged in with <user> and <password>
              And I am on english follow-up screen containing <spreadsheetHeader>
             When I select workflow <Status>
              And I select <number> runs in workflow section
              And bulk action menu is displayed
              And I click on button <ActionButton>
             Then I verify the workflows number of <Status> is decremented by <number>

        Examples:
                  | user           | password | Status          | ActionButton | NewStatus | number | spreadsheetHeader                                                                                                                                                |
                  | IMP_AUTOMATION | Neoxam23 | Wait validation | Validate     | Success   | 2      | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |
                  | IMP_AUTOMATION | Neoxam23 | Wait validation | Disapprove   | Error     | 1      | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |


        @IMPRESS-10030
        Scenario Outline: Relaunch Action/steps from bulk action

            Given I am logged in with <user> and <password>
              And I am on english follow-up screen containing <spreadsheetHeader>
             When I select workflow <Status>
              And I select <number> runs in workflow section
              And bulk action menu is displayed
              And I select <StepButton> from steps dropdown
              And I select <ActionButton> from actions dropdown
              And I click on button <buttonName>
             Then I verify the workflows number of <Status> is decremented by <number>


        Examples:
                  | user           | password | Status          | buttonName | number | StepButton | ActionButton   | spreadsheetHeader                                                                                                                                                |
                  | IMP_AUTOMATION | Neoxam23 | Wait validation | Relaunch   | 1      | Data       | Initialization | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |
               

        @IMPRESS-10004
        Scenario Outline: Rerun or skip step from the bulk action

            Given I am logged in with <user> and <password>
              And I am on english follow-up screen containing <spreadsheetHeader>
             When I select workflow <Status>
              And I select <number> runs in workflow section
              And bulk action menu is displayed
              And I click on button <ActionButton>
             Then I verify the workflows number of <Status> is decremented by <number>

        Examples:
                  | user           | password | Status | ActionButton                | number | spreadsheetHeader                                                                                                                                                |
                  | IMP_AUTOMATION | Neoxam23 | Error  | Passer                      | 1      | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |
                  | IMP_AUTOMATION | Neoxam23 | Error  | Relancer la dernière action | 1      | Steps;Prio;Owner;Doc.;Off.;Jurid - Lang;Man Co;Auditor;Fund;Fund name;Share code;Share Name;Reg;Vehicle;Closing;Man Co val;Comput./Gener.;Val. auditor;Diffusion |
                 
                   