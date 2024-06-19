const { Given, When, Then, Before, After } = require("@cucumber/cucumber")
const component = require("../support/components.js")
const moment = require("moment")

const CheckSpreadSheet = async () => {
  let spreadsheet_array = await page.$$(
    ".spreadsheet-inner .line:not(.line.header)"
  )
  if (spreadsheet_array.length !== 0) {
    return true
  } else {
    throw "the spreadsheet is empty"
  }
}

const QuickFilterStatus = async (filterStatus) => {
  let QuickFilters = await page.$$(".row.hbar-overflow")
  found = false
  if (filterStatus == "Displayed") {
    if (QuickFilters.length != 0) {
      found = true
    } else {
      throw "the spreadsheet is hidden"
    }
  }

  if (filterStatus == "Hidden") {
    if (QuickFilters.length == 0) {
      return true
    } else {
      throw "the spreadsheet must be hidden"
    }
  }
}

const ClickOnSelectAllButton = async () => {
  await component.spreadsheet.select.SelectAllWorkflows()
}

const ClickOnDeselectAllButton = async () => {
  await component.spreadsheet.select.DeselectAllWorkflows()
}

const CheckSelectedReports = async () => {
  let theSelectedRow = await component.RowCenter.GetSelectedDocs()
  let theTotalNumbrOfDocs = await component.RowCenter.GetTotalRows()
  if (!(theSelectedRow == theTotalNumbrOfDocs)) {
    throw `Error: The selected rows value ${theSelectedRow} is different from ${theTotalNumbrOfDocs}`
  }
}
const CheckDisselectedReports = async () => {
  let theSelectedRow = await component.RowCenter.GetSelectedDocs()
  if (!(theSelectedRow == 0)) {
    throw `Error: The selected rows value ${theSelectedRow} is not null `
  }
}

const CheckRowCenterButtons = async (ItemsButtons) => {
  let ItemsButtons_array = ItemsButtons.split(";")

  let RowCenterButtons_array = await page.$$(".row.center.right button")
  for (let j = 0; j < RowCenterButtons_array.length; j++) {
    let RowCenterButtons = RowCenterButtons_array[j]
    let ItemButtonLabel = ItemsButtons_array[j]
    let RowCenterButtonLabel = await page.evaluate(
      (RowCenterButtons) => RowCenterButtons.attributes.tt.nodeValue,
      RowCenterButtons
    )
    let RowCenterButtonEnabled = await page.evaluate(
      (RowCenterButtons) => RowCenterButtons.hasAttribute("disabled"),
      RowCenterButtons
    )
    if (
      !(
        ItemButtonLabel.toLowerCase() == RowCenterButtonLabel.toLowerCase() &&
        RowCenterButtonEnabled == false
      )
    ) {
      throw `Error:The button label ${RowCenterButtonLabel} must be equal to ${ItemButtonLabel} and it's status ${RowCenterButtonEnabled} must be false`
    }
  }
  
  let dropDownLists = await page.$$(".select_action select")
  for (let k = 0; k < dropDownLists.length; k++) {
    let TheDropDownList = dropDownLists[k]
    let TheDDownListLength = await page.evaluate(
      (TheDropDownList) => TheDropDownList.length,
      TheDropDownList
    )

    if (TheDDownListLength <= 0) {
      throw `Error:The ${TheDDownListLength} is either empty or does not exist`
    }
  }
}

const CheckHiddenButtons = async (ItemsButtons) => {
  let selectActionList = await page.$$(".row.center.right .select_action")

  let selectActionListLength = await page.evaluate(
    (selectActionList) => selectActionList.length,
    selectActionList
  )

  if (selectActionListLength == 0) {
    return true
  } else {
    throw `Error:The bulk action is still displayed`
  }
}

const EnableQuickFilter = async (filter, filterButton) => {
  await component.Filters.QuickGroupingFiltersOn(filter, filterButton)
}

var filters_array
var Items_array
const ChooseFilters = async (Filters, filterItems) => {
  filters_array = Filters.split(";")
  Items_array = filterItems.split(";")

  await component.NavBottom.ChooseLanguage("en")

  for (let i = 0; i < filters_array.length; i++) {
    if (filters_array[i].toLowerCase() == "status") {
      filters_array[i] = "functional_status"
    } else {
      filters_array[i] = filters_array[i].toLowerCase().replace(/ /g, "_")
    }

    await page.select(".row.hbar-overflow .hbar-block select", filters_array[i])

    let hbarRows = await page.$$(".hbar-overflow .hbar .row")

    for (j = 0; j < hbarRows.length; j++) {
      let theHbar = hbarRows[j]
      let HbarRowLabel = await page.evaluate(
        (hbarRows) => hbarRows.innerText,
        hbarRows[j]
      )

      if (HbarRowLabel.includes(Items_array[i])) {
        await page.evaluate((theHbar) => {
          theHbar.click()
        }, theHbar)
        break
      }
    }
  }
}


const CheckItemsOnSearchBar = async (Filters, filterItems) => {
  let Searchvalues = await page.$$(".filters  .search-wrapper .filter .value")
  let SearchItems = await page.$$(".filters  .search-wrapper .filter .key")
  let OldfilterArray = Filters.split(";")

  for (let i = 0; i < Items_array.length; i++) {
    let theSearchValue = await page.evaluate(
      (Searchvalues) => Searchvalues.innerText,
      Searchvalues[i]
    )
    let theSearchItem = await page.evaluate(
      (SearchItems) => SearchItems.innerText,
      SearchItems[i]
    )

    if (
      !(
        theSearchValue.toLowerCase() == Items_array[i].toLowerCase() &&
        theSearchItem.toLowerCase() == OldfilterArray[i].toLowerCase()
      )
    ) {
      throw `Error: The search key ${theSearchItem} or the search value ${theSearchValue}  do not exist on search bar`
    }
  }
}

const CheckGroupedWorkflows = async (fund, date) => {
  let date_array = date.split(";")
  let groups = await page.$$(".spreadsheet-inner .group")

  for (let i = 0; i < groups.length; i++) {
    let groupLabel = await page.evaluate(
      (groups) => groups.innerText,
      groups[i]
    )

    let theFundLabel = groupLabel.split(" (asof ")[0]
    let theDateLabel = groupLabel.split(" (asof ")[1].split(")")[0]

    if (fund == theFundLabel && date_array[i] == theDateLabel) {
    } else {
      throw `Error: The fund value ${theFundLabel} is different from ${fund} or date value ${theDateLabel} is different from ${date_array[i]} `
    }
  }
}

const CheckGroupedUmbrella = async (criteriaGroup, values) => {
  let ValuesTable = values.split(";")
  await page.waitForSelector('.spreadsheet .indent-1 [*|href="#flag-fr"]')
  let GroupingUmbrella = await page.$(".spreadsheet .indent-1")

  let GroupingUmbrellaLabel = await page.evaluate(
    (GroupingUmbrella) => GroupingUmbrella.innerText,
    GroupingUmbrella
  )

  if (GroupingUmbrellaLabel == criteriaGroup) {
  } else {
    throw `Error: The Griteria Group value  ${criteriaGroup} is different from group Umbrella label ${GroupingUmbrellaLabel} `
  }
}

const CheckDisplayedUmbrella = async (UmbrellaName, CompartementStatus) => {
  let FundTabe = await page.$$(".line .cell-fund-id.string")
  let FundTableLength = FundTabe.length

  for (i = 0; i < FundTableLength; i++) {
    let theFundName = FundTabe[i]
    let FundName = await page.evaluate(
      (theFundName) => theFundName.innerText,
      theFundName
    )

    if (CompartementStatus == "displayed") {
      if (FundName == UmbrellaName && FundTableLength > 1) {
        break
      }
    } else {
      if (FundName == UmbrellaName && FundTableLength == 1) {
        break
      }
    }
  }
}

Then("workflow section is displayed", async () => {
  await CheckSpreadSheet()
})

Then("Quick filters are {}", async (filterStatus) => {
  await QuickFilterStatus(filterStatus)
})

When("I check select All button", async () => {
  await ClickOnSelectAllButton()
})
When("I uncheck select All button", async () => {
  await ClickOnDeselectAllButton()
})

Then("All reports are selected", async () => {
  await CheckSelectedReports()
})

Then("All reports are deselected", async () => {
  await CheckDisselectedReports()
})

Then("{} are enabled and displayed", async (ItemsButtons) => {
  await CheckRowCenterButtons(ItemsButtons)
})

Then("{} are not displayed", async (ItemsButtons) => {
  await CheckHiddenButtons(ItemsButtons)
})

Given("the filter {} is {}", async (filter, filterButton) => {
  await EnableQuickFilter(filter, filterButton)
})

When("I choose {} and {}", async (Filters, filterItems) => {
  await ChooseFilters(Filters, filterItems)
})


Then(
  "{} and {} are displayed on the search bar",
  async (Filters, filterItems) => {
    await CheckItemsOnSearchBar(Filters, filterItems)
  }
)

Then("workflows are grouped by {} and {}", async (fund, date) => {
  await CheckGroupedWorkflows(fund, date)
})

Then("Umbrella are grouped by {} and {}", async (criteriaGroup, values) => {
  await CheckGroupedUmbrella(criteriaGroup, values)
})

Then(
  "Umbrella {} is shown up and linked compartiment are {}",
  async (UmbrellaName, CompartementStatus) => {
    await CheckDisplayedUmbrella(UmbrellaName, CompartementStatus)
  }
)
