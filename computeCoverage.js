const request = require('request');
const syncRequest = require('sync-request');

const INSTANCE_URL = 'https://peach.sonarsource.com/';
const PROJECT_KEY = 'tfsec_testcases';
const LOGIN_TOKEN = '';

const URL_HOTSPOTS_SEARCH_API = INSTANCE_URL + 'api/hotspots/search?projectKey=' + PROJECT_KEY;

// get all the Hotspots
request.get({
  url: URL_HOTSPOTS_SEARCH_API,
  json: true,
  headers: { 'User-Agent': 'request' },
  'auth': {
    'user': LOGIN_TOKEN,
    'sendImmediately': true
  }
}, (err, res, data) => {
  if (err) {
    console.log('Error:', err);
  } else if (res.statusCode !== 200) {
    console.log('Status:', res.statusCode);
  } else {
    console.log("Gathering all Hotspots raised by SonarQube");

    const raisedHotspots = new Map();

    // begin: fill "raisedHotspots" 
    Object.entries(data.hotspots).forEach(entry => {
      const hotspotKey = entry[1].key;
      const project = entry[1].project;
      let component = entry[1].component;
      component = component.replace(project + ":", "");

      const line = entry[1].line;

      // this is to get the Rule Identifier of the Hotspot
      const URL_HOTSPOT_SHOW_API = INSTANCE_URL + 'api/hotspots/show?hotspot=' + hotspotKey;

      var auth = "Basic " + Buffer.from(LOGIN_TOKEN + ':').toString("base64");

      var urlHotspotsShowRequest = syncRequest('GET', URL_HOTSPOT_SHOW_API, {
        'headers': {
          'Authorization': auth
        }
      });
      const hotspot = JSON.parse(urlHotspotsShowRequest.getBody('utf8'))
      const ruleKey = hotspot.rule.key;

      const uniqueHotspotKey = component + "_" + line + "_" + ruleKey;
      raisedHotspots.set(uniqueHotspotKey, true);
      console.log(uniqueHotspotKey);
    });
    // end: fill "raisedHotspots" 

    // compute TP Rate
    const expectedIssuesJson = require('./expectedIssues.json');

    let totalExpectedHotspots = expectedIssuesJson.hotspots.length;
    console.log("Total Expected Hotspots: " + totalExpectedHotspots);

    var detectedHotspots = 0;

    Object.entries(expectedIssuesJson.hotspots).forEach(hotspot => {
      const filePath = hotspot[1].filePath;
      const line = hotspot[1].line;
      const ruleKey = hotspot[1].ruleKey;

      const uniqueHotspotKey = filePath + "_" + line + "_" + ruleKey;
      if (raisedHotspots.get(uniqueHotspotKey)) {
        detectedHotspots++;
      }
    });
    console.log("Detected Hotspots: " + detectedHotspots);
    console.log("=> TP Rate: " + Math.round(detectedHotspots * 100 / totalExpectedHotspots) + "%");

    // compute FP Rate
    const notExpectedIssuesJson = require('./notExpectedIssues.json');

    const totalNotExpectedHotspots = notExpectedIssuesJson.hotspots.length;
    console.log("Total Not Expected Hotspots: " + totalNotExpectedHotspots);

    detectedHotspots = 0;

    Object.entries(notExpectedIssuesJson.hotspots).forEach(hotspot => {
      const filePath = hotspot[1].filePath;
      const line = hotspot[1].line;
      const ruleKey = hotspot[1].ruleKey;

      const uniqueHotspotKey = filePath + "_" + line + "_" + ruleKey;
      if (raisedHotspots.get(uniqueHotspotKey)) {
        detectedHotspots++;

        console.log("FP Detected: " + filePath + " " + line + " " + ruleKey);
      }
    });
    console.log("Badly Detected Hotspots: " + detectedHotspots);
    console.log("=> FP Rate: " + Math.round(detectedHotspots * 100 / totalNotExpectedHotspots) + "%");

  }
});