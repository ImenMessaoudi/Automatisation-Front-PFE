const { Given, When, Then } = require("@cucumber/cucumber")
const expect = require("chai").expect
const component = require("../support/components.js")

const diplayedDataFunction = async (data, dataValues) => {
  let table1 = []
  let table2 = []
  data = data.split(",")
  dataValues = dataValues.split(",")

  let innerKey = await page.evaluate(() =>
    $$(".block.info .row .key").map((p) => p.innerText)
  )
  table1.push(innerKey)

  for (let i = 0; i < data.length; i++) {
    if (table1.includes(data[i])) {
      throw "the data are displayed"
    }
  }
  let innerValue = await page.evaluate(() =>
    $$(".block.info .row .value").map((p) => p.innerText)
  )
  table2.push(innerValue)

  for (let i = 0; i < dataValues.length; i++) {
    if (table2.includes(dataValues[i])) {
      throw "the dataValues are displayed"
    }
  }
}

const diplayedData = async (report_screen_name, data, dataValues) => {
  let screenName = await page.$(".row.between")
  let innerScreenName = await page.evaluate((sel) => sel.innerText, screenName)

  if (innerScreenName == report_screen_name) {
    await diplayedDataFunction(data, dataValues)
  } else if (innerScreenName != report_screen_name) {
    await clickAnnualReport()
    await diplayedDataFunction(data, dataValues)
  }
}

const clickAnnualReport = async () => {
  await page.waitForSelector("a.details.active")
  await page.click("a.details.active")
}

Then("{} is relaunched", async (stepName) => {
  await relaunchStep(stepName)
})

When("I click on Go to annual report", async () => {
  await clickAnnualReport()
})

Then(
  "{} screen is displayed with right {} and {}",
  async (report_screen_name, data, dataValues) => {
    await diplayedData(report_screen_name, data, dataValues)
  }
)
