const { Given, When, Then, Before, After } = require("@cucumber/cucumber");
const component = require("../../support/components.js");
const fs = require("fs");
const { Console } = require("console");

const SelectFirstWorkflow = async () => {
  let firstWorkflowCheckBox = await page.$(
    ".spreadsheet-inner .line:not(.line.header) input"
  );

  await page.evaluate((firstWorkflowCheckBox) => {
    firstWorkflowCheckBox.click();
  }, firstWorkflowCheckBox);
};

const CheckBulkActionMenu = async () => {
  let BulkActionMenu = await page.$$(
    ".row.expand .row.center.right .select_action"
  );

  if (!(BulkActionMenu.length != 0)) {
    throw `ERROR: bulk action menu is not displayed`;
  }
};

const CheckHistoryBox = async () => {
  let histoCheckBox = await page.$(".center input[type=checkbox]");
  await page.click(".center input[type=checkbox]");

  let cellContent = await page.evaluate(
    (histoCheckBox) => histoCheckBox.checked,
    histoCheckBox
  );
  if (!(cellContent == true)) {
    throw `Error: History box is not checked!!`;
  }
};

var TotalRows;
const getTotalRows = async () => {
  TotalRows = parseInt(await component.RowCenter.GetTotalRows());
};

const CheckDeletedWorkflow = async () => {
  await page.waitForSelector(
    ".prod .center:not(.center.tasks):not(.center.right)"
  );

  let MsgPath = await page.$(
    ".prod .center:not(.center.tasks):not(.center.right)"
  );

  let MsgContent = await page.evaluate((MsgPath) => MsgPath.innerText, MsgPath);
  if (!(MsgContent == "No entry matches your search")) {
    throw `Error : the workflows were not deleted successfully!!`;
  }
};

const chooseDHUser = async (DHuser) => {
  let UsersList = await page.$$(" .row.center.right  select option");

  for (let i = 0; i < UsersList.length; i++) {
    let theUser = await page.evaluate(
      (UsersList) => UsersList.innerText,
      UsersList[i]
    );


    if (theUser == DHuser) {
      await page.select(".row.center.right select", DHuser);
      break;
    }
  }

};

const CheckAssignment = async (DHuser) => {
  let DHuserPath = await page.$(".line:not(.line.header) .cell-owner div");

    let DHuserValue = (
    await page.evaluate(
      (DHuserPath) => DHuserPath.attributes.tt.nodeValue,
      DHuserPath
    )
  )
  let DHuserValueL = DHuserValue.toLowerCase();

  let DHuserL = DHuser.toLowerCase().replace("_", " "); 

  try {
    await page.waitForFunction(
      (DHuserL, DHuserValueL) => DHuserL === DHuserValueL,
      { timeout: 80000 },
      DHuserL,
      DHuserValueL
    )
    return true
  } catch (error) {
    throw `ERROR : ${DHuserL} IS DIFFERENT FROM ${DHuserValueL}`
  }

};

const CheckAssignmentIcon = async (AssignIcon) => {
  await page.waitForSelector(".line:not(.line.header) .cell-owner");
  

  let respPath = await page.$(".line:not(.line.header) .cell-owner");

  await page.waitForFunction(
    (respPath, AssignIcon) => respPath.innerText === AssignIcon,
    { timeout: 480000},
    respPath,
    AssignIcon
  );
};


const SelectRuns = async (number) => {
  let CheckBoxInputs = await page.$$(
    ".spreadsheet-inner .line:not(.line.header) input"
  );
  let num = parseInt(number);

  for (let i = 0; i < num; i++) {
    let runToBeChecked = CheckBoxInputs[i];
    await page.evaluate((runToBeChecked) => {
      runToBeChecked.click();
    }, runToBeChecked);
  }
};

const chooseSeletedRunsPrio = async (Priority) => {
  BulkActionPrioButtons = await page.$$(".select_action .priority button");
  LowPrio = BulkActionPrioButtons[1];
  StandardPrio = BulkActionPrioButtons[2];
  HighPrio = BulkActionPrioButtons[3];
  EmergencyPrio = BulkActionPrioButtons[4];

  await changePrio(Priority, ".select_action .priority button");
};

const checkBulkActionPriorities = async (Priority, number) => {
  let priorityCell = await page.$$(
    ".spreadsheet-inner .line:not(.line.header) .cell-priority div"
  );
  numb = parseInt(number);
  try {
  for (let i = 0; i < numb; i++) {
    let theCell = priorityCell[i];

    let theCellLink = await page.evaluate(
      (theCell) => theCell.attributes[0].value,
      theCell
    );

    if (theCellLink == Priority) {
      return true
    
    }}
   } catch (error) {
    throw `Error: the number of ${Priority} priority should be equal to ${num}`; 
    }
     
      
    }

;

const chooseActionfromDDown = async (StepButton, dropdownName) => {
  if (StepButton == "Data" && dropdownName == "steps") {
    await selectFromDDownList(".row.center.right  select", StepButton);
  } else if (StepButton == "Initialization" && dropdownName == "actions") {
    await selectFromDDownList(".select_action select", StepButton);
  }
};

When("I select the first workflow", async () => {
  await SelectFirstWorkflow();
});
When("bulk action menu is displayed", async () => {
  await CheckBulkActionMenu();
});
When("I check history box", async () => {
  await CheckHistoryBox();
});

Given("I get the total rows", async () => {
  getTotalRows();
});

Then("the workflows are deleted from the workflow section", async () => {
  await CheckDeletedWorkflow();
});

When("I choose a {}", async (DHuser) => {
  await chooseDHUser(DHuser);
});

Then("the workflow is assigned to {}", async (DHuser) => {
  await CheckAssignment(DHuser);
});
Then(
  "{} is displayed in Resp column in the selected workflows",
  async (AssignIcon) => {
    await CheckAssignmentIcon(AssignIcon);
  }
);

When("I select {} runs in workflow section", async (number) => {
  await SelectRuns(number);
});

When("I choose {} priority", async (Priority) => {
  await chooseSeletedRunsPrio(Priority);
});

Then(
  "the {} is changed for the {} selected workflows",
  async (Priority, number) => {
    await checkBulkActionPriorities(Priority, number);
  }
);

When("I select {} from {} dropdown", async (StepButton, dropdownName) => {
  await chooseActionfromDDown(StepButton, dropdownName);
});


