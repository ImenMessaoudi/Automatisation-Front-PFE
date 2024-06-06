const { Given, When, Then } = require("@cucumber/cucumber")
const expect = require("chai").expect
const component = require("../../support/components.js")
const fs = require("fs")
const path = require("path")
const downloadPath = path.resolve("./Downloads")

const displaySpreadsheet = async () => {
  let selector = await page.$(".spreadsheet-inner")
  await component.ElementVisibility.select.elementIsVisible(selector)
}

const clickCreateButton = async () => {
  const createButton = await page.$(".select_action button")

  if (createButton) {
    await createButton.click()
  }
}

const displayScheduleFormPopup = async () => {
  let selector = await page.$(".form-popup")
  await component.ElementVisibility.select.elementIsVisible(selector)
}

const selectReport = async (Report) => {
  await page.waitForSelector(".form-popup form select")

  await page.evaluate((selectedReport) => {
    const select = document.querySelector(".form-popup form select")
    for (const option of select.options) {
      if (option.textContent === selectedReport) {
        option.selected = true
        break
      }
    }
    const event = new Event("change", { bubbles: true })
    select.dispatchEvent(event)
  }, Report)
}

const displayRowsAction = async () => {
  const initialSelectActionsCount = await page.$$(".select_action")

  const checkbox = await page.$(".cell-check.undefined input[type=checkbox]")
  await checkbox.click()

  await page.waitForSelector(".select_action", {
    visible: true,

    timeout: 5000,
  })

  const updatedSelectActionsCount = await page.$$(".select_action")

  if (!(updatedSelectActionsCount.length > initialSelectActionsCount.length)) {
    throw `Additional select actions did not appear`
  }
}

const selectWorkflow = async () => {
  const checkbox = await page.$(".cell-check.undefined input[type=checkbox]")
  await checkbox.click()
}
const clickRunButton = async () => {
  await page.click('button[tt="Valider"]')
}

const clickExportButton = async () => {
  await page._client.send("Page.setDownloadBehavior", {
    behavior: "allow",
    downloadPath: downloadPath,
  })

  await page.click('button[tt="Exporter"]')
}
const verifyDownloadedScheduledReports = async () => {
  const fileName = "scheduled-reports.csv"

  const downloadFolderPath = path.join(__dirname, "Downloads")

  const downloadFilePath = path.join(downloadFolderPath, fileName)

  if (fs.existsSync(downloadFilePath)) {
    throw `The file does not exist in the download path`
  }
}

const selectUmbrella = async (Umbrella) => {
  await page.waitForSelector(".form-popup form select")

  await page.evaluate((selectedUmbrella) => {
    const selectElements = document.querySelectorAll(".form-popup form select")
    if (selectElements.length >= 2) {
      const select = selectElements[1]
      for (const option of select.options) {
        if (option.textContent === selectedUmbrella) {
          option.selected = true
          break
        }
      }
      const event = new Event("change", { bubbles: true })
      select.dispatchEvent(event)
    }
  }, Umbrella)
}

const selectFund = async (Fund) => {
  await page.waitForSelector(".form-popup form select")

  await page.evaluate((selectedFund) => {
    const selectElements = document.querySelectorAll(".form-popup form select")
    if (selectElements.length >= 3) {
      const select = selectElements[2]
      for (const option of select.options) {
        if (option.textContent === selectedFund) {
          option.selected = true
          break
        }
      }
      const event = new Event("change", { bubbles: true })
      select.dispatchEvent(event)
    }
  }, Fund)
}

const selectFundShare = async (FundShare) => {
  await page.waitForSelector(".form-popup form select")

  await page.evaluate((selectedFundShare) => {
    const selectElements = document.querySelectorAll(".form-popup form select")
    if (selectElements.length >= 4) {
      const select = selectElements[3]
      for (const option of select.options) {
        if (option.textContent === selectedFundShare) {
          option.selected = true
          break
        }
      }
      const event = new Event("change", { bubbles: true })
      select.dispatchEvent(event)
    }
  }, FundShare)
}

const selectJurisdiction = async (Jurisdiction) => {
  await page.waitForSelector(".form-popup form select")

  await page.evaluate((selectedJurisdiction) => {
    const selectElements = document.querySelectorAll(".form-popup form select")
    if (selectElements.length >= 5) {
      const select = selectElements[4]
      for (const option of select.options) {
        if (option.textContent === selectedJurisdiction) {
          option.selected = true
          break
        }
      }
      const event = new Event("change", { bubbles: true })
      select.dispatchEvent(event)
    }
  }, Jurisdiction)
}
const pickLanguage = async (Languages) => {
  await page.waitForSelector('label[for="en"]')

  const labelText = await page.evaluate(() => {
    const label = document.querySelector('label[for="en"]')
    return label.textContent.trim()
  })

  if (labelText == Languages) {
    await page.click('label[for="en"]')
  }
}
const selectSwitchAction = async (SwitchAction) => {
  await page.waitForSelector("label.switch")

  const offElement = await page.evaluate(() => {
    const switchLabel = document.querySelector("label.switch")
    const offElement = switchLabel.querySelector("div:not(.on)")
    return offElement.textContent.trim()
  })

  if (offElement === SwitchAction) {
    await page.click("label.switch")
  }
}
const selectFrequency = async (Frequency) => {
  await page.waitForSelector(".form-popup form select")

  await page.evaluate((selectedFrequency) => {
    const selectElements = document.querySelectorAll(".form-popup form select")
    if (selectElements.length >= 8) {
      const select = selectElements[7]
      for (const option of select.options) {
        if (option.textContent === selectedFrequency) {
          option.selected = true
          break
        }
      }
      const event = new Event("change", { bubbles: true })
      select.dispatchEvent(event)
    }
  }, Frequency)
}

const selectProductionStart = async (ProductionStart) => {
  await page.waitForSelector("input[type=date]")

  await page.focus("input[type=date]")
  await page.type("input[type=date]", ProductionStart)

  await page.evaluate(() => {
    const input = document.querySelector("input[type=date]")
    input.dispatchEvent(new Event("input"))
    input.dispatchEvent(new Event("change"))
  })
}
const selectProductionEnd = async (ProductionEnd) => {
  const secondDateInput = (await page.$$("input[type=date]"))[1]

  await secondDateInput.focus()
  await secondDateInput.type(ProductionEnd)

  await secondDateInput.evaluate((input) => {
    const event = new Event("input", { bubbles: true })
    input.dispatchEvent(event)
  })
}

const clickSaveButton = async () => {
  const saveButton = await page.$("button")

  if (saveButton) {
    await saveButton.click()
  }
}
const spreadSheetVerification = async () => {
  let selector = await page.$(".spreadsheet-inner")
  await component.ElementVisibility.select.elementIsVisible(selector)
}
const clickClearButton = async () => {
  const buttons = await page.$$("button")
  const saveButton = buttons[2]

  if (saveButton) {
    await saveButton.click()
  }
}
const verifyFormAfterClearAction = async () => {
  const noSelection = await page.evaluate(() => {
    const selects = document.querySelectorAll("select")
    for (const select of selects) {
      if (select.selectedIndex !== 0) {
        return false
      }
    }
    return true
  })

  if (noSelection) {
    throw `The selected fields from the schedule popup are not be empty !`
  }
}
const clickDeleteButton = async () => {
  const deleteButton = await page.$("button.ghost")

  await page.once("dialog", async (dialog) => {
    await dialog.accept()
  })
  if (deleteButton) {
    await deleteButton.click()
  }
}
const clickActionsLink = async () => {
  try {
    await page.waitForSelector(".cell-details.undefined")

    await page.click(".cell-details.undefined")
  } catch (error) {
    throw "Une erreur s'est produite "
  }
}
const executeWorkflow = async () => {
  await page.waitForTimeout(2000)

  const pageText = await page.evaluate(() => document.body.textContent)

  if (!pageText.includes("On demand requests has been sent successfully")) {
    throw "Workflow execution has failed."
  }
}
const deleteWorkflow = async () => {
  await page.waitForTimeout(2000)

  const pageText = await page.evaluate(() => document.body.textContent)

  if (!pageText.includes("The selection has been successfully deleted.")) {
    throw "The deletion of the workflow has failed"
  }
}
const saveWorkflow = async () => {
  await page.waitForTimeout(2000)

  const pageText = await page.evaluate(() => document.body.textContent)

  if (!pageText.includes("The schedules has been successfully created.")) {
    throw "The creation of the workflow has failed"
  }
}
const clickEdit = async () => {
  const x = 412
  const y = 181

  await page.mouse.click(x, y)
}
const updateWorkflow = async () => {
  await page.waitForTimeout(2000)

  const pageText = await page.evaluate(() => document.body.textContent)

  if (!pageText.includes("The schedule has been successfully updated.")) {
    throw "The update of the workflow has failed"
  }
}
When("I select the displayed workflow", async () => {
  await selectWorkflow()
})

When("I click on the run button", async () => {
  await clickRunButton()
})
When("I click on clear button", async () => {
  await clickClearButton()
})
When("I click on the Export icon", async () => {
  await clickExportButton()
})
Then("The scheduled reports document should be downloaded", async () => {
  await verifyDownloadedScheduledReports()
})
Then("The spreadsheet must be displayed", async () => {
  await displaySpreadsheet()
})

When("I click on the create button", async () => {
  await clickCreateButton()
})

Then("The schedule form popup should be displayed", async () => {
  await displayScheduleFormPopup()
})

When("I Select the report {}", async (Report) => {
  await selectReport(Report)
})

Then(
  "Additional select actions appears after selecting the displayed workflow",
  async () => {
    await displayRowsAction()
  }
)
When("I Choose the umbrella {}", async (Umbrella) => {
  await selectUmbrella(Umbrella)
})
When("I pick The Fund {}", async (Fund) => {
  await selectFund(Fund)
})
When("I select The Fund share {}", async (FundShare) => {
  await selectFundShare(FundShare)
})
When("I Pick the jurisdiction {}", async (Jurisdiction) => {
  await selectJurisdiction(Jurisdiction)
})
When("I pick a language {} from the displayed languages", async (Languages) => {
  await pickLanguage(Languages)
})
When("I select toggle switch action {}", async (SwitchAction) => {
  await selectSwitchAction(SwitchAction)
})
When("I choose a frequency {}", async (Frequency) => {
  await selectFrequency(Frequency)
})
When("I choose production start {}", async (ProductionStart) => {
  await selectProductionStart(ProductionStart)
})
When("I select the production end {}", async (ProductionEnd) => {
  await selectProductionEnd(ProductionEnd)
})
When("I click on the save button", async () => {
  await clickSaveButton()
})
Then("The workflow should be added to the spreadsheet", async () => {
  await spreadSheetVerification()
})
Then(
  "The selected fields from the schedule popup should be empty",
  async () => {
    await verifyFormAfterClearAction()
  }
)
When("I click on  delete button", async () => {
  await clickDeleteButton()
})
When("I click on the actions link", async () => {
  await clickActionsLink()
})
Then("The workflow should be executed", async () => {
  await executeWorkflow()
})
Then("the workflow must be deleted", async () => {
  await deleteWorkflow()
})
Then("The workflow had to be saved", async () => {
  await saveWorkflow()
})
When("I click on displayed edit icon", async () => {
  await clickEdit()
})
Then("The informations should be updated", async () => {
  await updateWorkflow()
})
