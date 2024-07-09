
const { Given, When, Then} = require("@cucumber/cucumber")
const expect = require("chai").expect
const component = require('../../support/components.js')




const testLogout = async () => {   
     
    await page.waitForSelector('.retract-button')
    await page.click('.retract-button') 
    await page.waitForSelector('a.user') 
    await page.click('a.user')
    await page.waitForSelector('.link-logout')
    await page.click('.link-logout') 
      
}



const CheckFavList = async(criteria,values) => {
    await component.Search.SerachByFavList(criteria,values,page)
}



const  SearchForValues = async (criteria,values) => {

    
    var val_array = values.split(";")
    let crit_array = criteria.split(";") 

    for (let i = 0; i < val_array.length; i++){
  
        let theValue = val_array[i]   
        let searchInput = await page.$('.search input')
        await page.evaluate((searchInput)=>searchInput.click(),searchInput)
        await page.keyboard.type(theValue) 

        let suggestionList = await page.$$('.list .suggestion')

        for (let j=0 ; j<suggestionList.length;j++){
        
        let Keys=await page.$$('.list .suggestion .key')
            
        let Values=await page.$$('.list .suggestion .value')

        let TheKeyLabel = await page.evaluate((Keys) => Keys.innerText , Keys[j])

        let TheValueLabel = await page.evaluate((Values) => Values.innerText , Values[j])
        
       if ((TheKeyLabel == crit_array[i] ) && (TheValueLabel==val_array[i])) {
            let theSugg = suggestionList[j]
            await page.evaluate((theSugg) => theSugg.click(), theSugg)
            break
            
       } 
        
    } 

    }
}





const advancedSearch = async (criteria,values) => {

    await component.Search.search(criteria,values)
   
    }

    

When ("I create a favorite List with {} and {}" , async (criterias,values) =>{
    await CreateFavCriteriaList(criterias,values)
    })





Then ("the favorite list is displayed with {} and {}" , async(criteria,values) => {
    await CheckFavList(criteria,values)
})



When ("I search and select the correspondant {} and {}",async (criteria,values) => {
    await SearchForValues(criteria,values)
})





When ("I search {} and {} in advanced table",async(criteria,values) => {
    advancedSearch(criteria,values)

})