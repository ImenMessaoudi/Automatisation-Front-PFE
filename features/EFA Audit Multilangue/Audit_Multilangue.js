const { Given, When, Then } = require("@cucumber/cucumber")
const expect = require("chai").expect
const component = require("../support/components.js")

const checkDisplayedLanguages = async (AddedLanguages) => {
  await page.waitForSelector(":nth-child(12) .value")
  let lng = await page.$(":nth-child(12) .value")
  let AddedLng = await page.evaluate((elm) => elm.innerText, lng)
  if (AddedLng != AddedLanguages) {
    throw `The added languages : ${AddedLanguages} are not displayed ! `
  }
}

const checkDisplayedReports = async () => {
  const selector = "div.action_file a[href]"
  const elements = await page.$$(selector)

  const fileLanguages = ["en", "fr", "de", "it"]

  for (let i = 0; i < elements.length; i++) {
    const element = elements[i]
    const attributeValue = await element.evaluate((el) => el.getAttribute("tt"))
    const innerText = await page.evaluate((el) => el.innerText, element)

    const expectedLanguage = fileLanguages[i]

    if (innerText.includes(expectedLanguage)) {
      throw `Le fichier ${i + 1} n'est pas en ${expectedLanguage}.`
    }
  }
}

When(
  "I verifiy that added languages {} are displayed",
  async (AddedLanguages) => {
    await checkDisplayedLanguages(AddedLanguages)
  }
)

Then("The reports should be displayed in the box form", async () => {
  await checkDisplayedReports()
})
