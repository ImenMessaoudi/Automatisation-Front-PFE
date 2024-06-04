const { When, Then} = require("@cucumber/cucumber")
const expect = require("chai")
const path = require('path');
const downloadsFolder = require("downloads-folder")
const downloadPath = path.resolve('./Downloads');
const fs = require('fs');



const selectPreference = async () => { 
    
    await page.waitForSelector('.retract-button')
    await page.click('.retract-button') 
    await page.waitForSelector('a.user')
    await page.click('a.user')
   }

const displayMenus = async (Allmenus) => {    
      let selector= `.${Allmenus}`.split(";")
      let Length = await page.evaluate((selector) => $$(selector).length,selector)
      
      for (let i = 1; i < Length; i++) {
      menuName = await page.evaluate((selector, i) => {if (getComputedStyle($(selector)[i]).display != "none") 
      {
      return true
    }else{
        throw `The menu is not displayed`
    }
    },selector,i)}
}

 const clickAbor = async () => { 

  await page.waitForSelector('.user-menu.retract > a[href]', { waitUntil: 'networkidle2' })
      await page.click('.user-menu.retract > a[href]')
      await page._client.send('Page.setDownloadBehavior', {   
           behavior: 'allow',
           downloadPath: downloadPath 
       });    
}

 const fileDownloded = async () => {    
   function escapeRegex(string) {
      return string.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
  }
  let path = downloadsFolder()
  let fileName = 'smartplanet';
  fileName = escapeRegex(fileName);
  let regex = new RegExp(`^(${fileName}(?: \\([0-9]+\\))?\.jnlp?)$`, 'gi');
  let file = fs.readdirSync(path),
  matched = file.filter(f => f.match(regex))

  if (!matched){
    throw "file not found!"
  }
}

const clickLang = async (languageButton) => { 
  
  await page.waitForSelector('.user-menu.retract #lang')
  await page.click('.user-menu.retract #lang')
  
 if (languageButton === 'EN'){

  await page.select("select#lang", "en")

  }
  else if (languageButton === 'FR'){
   await page.select("select#lang", "fr")
  }
}


const testLang = async (menus) => {  
    
   menus = menus.split(";");

    let links = []
    let mee = await page.$$('.links span')
    for (let i=0;i<mee.length;i++){
      let language  = await page.evaluate((sel) => sel.innerText,mee[i])
      links.push(language)
    }
    for (let i=0;i<menus.length;i++){
      if (!links.includes(menus[i])){
        throw 'not found' 
      }
      
    }
  }


const loggedOut = async () => {    
   
  await page.waitForSelector('.welcome')

}

When('I select the preference menu in the left menu', async  () => {
    await selectPreference()
  })

When('I click in the Abor menu', async  () => {
    await clickAbor()
  })

  When('I click on the language button {}', async  (languageButton) => {
    await clickLang(languageButton)
  })


  
 Then('All the menus {} are displayed', async  (Allmenus) => {
    await displayMenus(Allmenus)
  }) 

  Then('JNLP file is Downloaded', async  () => {
    await fileDownloded()
  }) 

  Then('The language of the menus {} is changed', async  (menus) => {
    await testLang(menus)
  }) 

  Then('I should be logged out', async  () => {
    await loggedOut()
  }) 

