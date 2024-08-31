const {
    AfterAll,
    BeforeAll,
    setDefaultTimeout,
    setDefinitionFunctionWrapper,
    AfterStep,
    Status,
} = require("@cucumber/cucumber")
const puppeteer = require("puppeteer")
const chai = require("chai")

setDefaultTimeout(10 * 180 * 1000)

let context

setDefinitionFunctionWrapper(function (fn) {
    return async function (...args) {
        try {
            context = this
            return await fn.apply(this, args)
        } catch (ex) {
            this.attach(await page.screenshot(), "image/png")
            throw ex
        }
    }
})

AfterStep(async (scenario) => {
    if (scenario.result.status === Status.PASSED) {
        //await page.waitForTimeout(10000)
       
        context.attach(await page.screenshot(), "image/png")
    }
})

//const puppeteer = require('puppeteer-core'); // Utilisez puppeteer-core si vous spécifiez executablePath
 
BeforeAll(async function () {
    try {
        console.log("Starting Puppeteer launch...");
        global.browser = await puppeteer.launch({
            executablePath: 'C:\\Program Files (x86)\\Microsoft\\Edge\\Application\\msedge.exe',
            //executablePath: '/usr/bin/microsoft-edge',
            headless: false,
            slowMo: 25,
            ignoreHTTPSErrors: true,
            defaultViewport: {
                width: 1720,
                height: 900,
                deviceScaleFactor: process.platform === "darwin" ? 2 : 1,
        
            },
            args: ["--start-maximized", "--no-sandbox", "--disable-setuid-sandbox"]
        });
        console.log("Puppeteer launched successfully.");
        
        const page = (await global.browser.pages())[0];
        global.page = page;
        const { installMouseHelper } = require("./install-mouse-helper");
        await installMouseHelper(page);
 
        global.metadata = {
            browser: await global.browser.version(),
            platform: process.platform,
            user: process.env.USER,
        };
    
 
    } catch (error) {
        console.error("Error during Puppeteer launch: ", error);
    }
});

AfterAll(async () => {
    try {
      if (browser) {
        // Vérifiez que le navigateur est encore ouvert
        const pages = await browser.pages();
        if (pages.length > 0) {
          // Vous pouvez également essayer de fermer toutes les pages ouvertes
          await Promise.all(pages.map(page => page.close()));
        }
        
        // Fermez le navigateur
        await browser.close();
      }
    } catch (e) {
      console.error('Erreur lors de la fermeture du navigateur:', e);
    }
  });
  
  
Promise.map = async (arr, fn) =>
    await arr.reduce(
        async (acc, v, i) => ((await acc).push(await fn(v, i)), acc),
        Promise.resolve([])
    )
global.log = (...args) =>
    process.env.CUCUMBER_ARGS.includes("--format") ||
    console.log("\n", new Date(), ...args)
global.debug = () => {
    debugger
}

const { After, Before, Given, Then, When } = require("@cucumber/cucumber")
global.After = After
global.Before = Before
global.Given = Given
global.Then = Then
global.When = When



  