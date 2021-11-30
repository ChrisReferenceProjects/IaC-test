# tfsec_testcases

The goal of this repo is to host the test cases of the tool called [tfsec](https://github.com/aquasecurity/tfsec).

These test cases are originally part of the Go code used by tfsec to implement their rules which doesn't allow us to verify if we cover or not the use cases covered by tfsec.

# How to use it?

First you need to scan the repo on an SonarQube instance having the IaC Analyzer. By default, the scan targets Peach.

```
sonar-scanner -Dsonar.login=CHANGEME
```

Once the project has been scanned, you should use Node + computeCoverage.js to answer the question: what part of the tfsec test cases are covered by this instance of SonarQube?

```
node computeCoverage.js
```

:warning: Don't forget to update the file computeCoverage.js and the constant LOGIN_TOKEN with a valid SonarQube Token so that the script can connect to the SonarQube API and retrieve results from SonarQube.
