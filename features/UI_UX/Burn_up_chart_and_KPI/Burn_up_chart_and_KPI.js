const { Given, When, Then } = require("@cucumber/cucumber");
const expect = require("chai").expect;
const component = require("../../support/components.js");


  const checkDashboardScreen = async () => {

    try { 
      await page.waitForSelector('.page.dashboard.generic')
    }
    catch (e) { 
      throw `the dashboard screen is not displayed !`

    }
  };

  const displaySections = async (section) => {

    let sections = section.split(";")
    let selector = await page.$$('.block-custom.block-no-title h1') 
    for (i=0 ; i< selector.length; i++ ) {
      let sec = selector[i]
      var secLabel = await page.evaluate((selector)=> selector.innerText,sec)
      if (secLabel==(sections[i])) {  

        await component.ElementVisibility.select.elementIsVisible(sec)
  
      }
    }
 
  };


  const displayKPIs = async (KPIs) => {
    KPIs = KPIs.split(";")
    let selectors = await page.$$('.kpis .kpi') 
    for (i=0 ; i< selectors.length; i++ ) {
      let sec = selectors[i]
      var secLabel = await page.evaluate((selectors)=> selectors.innerText,sec)
      if (secLabel == (KPIs[i])) {

         await component.ElementVisibility.select.elementIsVisible(selectors)
  }
   }
  }
  
  const selectStep = async (step) => {

    await page.waitForSelector('.selection select')
    await page.click('.selection select')
    
    if (step == 'Calc./Gener.'){
     await page.select("select", "date_calc")
    }
    else if (step == 'Validation auditeur'){
     await page.select("select", "auditor_validation")
    }
    else if (step == 'Diffusion'){
      await page.select("select", "diffusion_date")
     }

  
  };



  const displayRuns = async () => {

    let selector = await page.$('.legend')
    await component.ElementVisibility.select.elementIsVisible(selector)
    
  };

  const displayLegend = async () => {

    let selector = await page.$('.component.guide-line-layer.vertical')
    await component.ElementVisibility.select.elementIsVisible(selector)

  }

  const corKPI = async (KPI) => {
    let kpi = KPI.split(";")

    let selector = await page.$$('.block-custom.block-no-title') 
    for (i=0 ; i< selector.length; i++ ) {
      let sec = selector[i]
      var secLabel = await page.evaluate((selector)=> selector.innerText,sec)
      
      if (secLabel.includes(kpi[i])) {
        return true;
      }

  }}

  Then("I am in the dashboard screen", async () => {
    await checkDashboardScreen();
  });

  
  Then("The sections {} are displayed", async (section) => {
    await displaySections(section);
  });

  Then("The KPIs {} are displayed", async (KPIs) => {
    await displayKPIs(KPIs);
  });



  Then("I select the step {}", async (step) => {
    await selectStep(step);
  });

  Then("{} corespond to status values", async (KPI) => {
    await corKPI(KPI);
  });
  
  Then("The finished runs and the expected runs charts are displayed", async () => {
    await displayRuns();
  });

  Then("The legend is displayed", async () => {
    await displayLegend();

  });
  
