const cucumberHtmlReporter = require('cucumber-html-reporter');

const options = {
  theme: 'bootstrap',
  jsonFile: './reports/cucumber-report.json',
  output: './reports/cucumber-report.html',
  reportSuiteAsScenarios: true,
  launchReport: true,
  metadata: {
    browser: {
      name: 'chrome',
      version: '92'
    },
    device: 'Local test machine',
    platform: {
      name: 'Windows',
      version: '10'
    }
  }
};

cucumberHtmlReporter.generate(options);
