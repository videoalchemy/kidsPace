##KidsPace
> You know, for kids!  Responsive visuals for a child's play space
__________________________

###Overview
KidsPace: a play-space illumination toy that lets kids play with the color of their surroundings.       

_________________________________

###Feature List
#####v1.0.0
- control R,G,B of space using keyboard

###Future Features
- touchscreen control (iPad and iPhone)
- create and control virtual shapes
- virtual shapes move autonomously
- shapes respond to movement in the space
- shapes respond to real objects in the space
- projection mapping to objects in the space
- physical interaction with projection mapped objects
- HOT WHEELS TRACKING!
    + RaceTrack Mapping
    + virtual obstructions
    + Car tracking / Car recognition
    + Race winner validation (who entered area x first?)
    + etc etc etc


_________________________________

###[Executable Specs]
 


________________________________________

###Process Prototypes:
This project is also an investigation into the software development process.  What are the 'best practices'?  Best way to document?  To track features?  To track releases?  To track bugs?  To log changes? To evolve software?  I've worked with two dev teams on two enterprise level software projects and in both cases, we were forced by breakdown and failure to invent and deploy reliable processes and procedures. Doing so was challenge. Retrofitting processes to full blown projects is just as difficult as changing the dev team culture:  so much inertial.  A small solo-project, however, is ideal for test-driving process prototypyes.      

####Process Tools:
#####git tags

#####specification by example (aka Executable Specs)

#####Behavior Driven Development
Start with a failing customer acceptance test that describes the behavior of the system from the customer's point of view.  Write this acceptance test in the form of an example of the way we want the system to behave in particular scenearios.  This will enable me to visualize the system before building it. (source: Cucumber - BDD for Testers and Developers by by Wayne and Hellesoy)

#####Cucumber  
- Define:
    + Cucumber is a tool based on Behavior Driven Development (BDD) framework which is used to write acceptance tests for web application. It allows automation of functional validation in easily readable and understandable format GHERKIN
- Cucumber Feature Files:
    + Feature files are essential part of cucumber which is used to write test automation steps or acceptance tests. This can be used as live document. The steps are the application specification. All the feature files ends with .feature extension.
    + example Feature File:
```
Feature:  Login Functionality Feature
    
    In order to ensure Login Fucntionality works,
    I want to run cucumber tests to verify it is working

Scenario(#1): Login Functionality 
    Given user navs to blah blah
    When user logs in using blah
    Then login shoud be successful

Scenario(#2): Login Functionality
    Given : given specifics of the precondition
    When: when some action is performed
    Then:  expected outcome
    Background: steps for precondition to other steps
    And: used to combine two or more same type actions
```
- **FEATURE:**
    + this gives info about the high level business functionality and the PURPOSE / INTENT
- **SCENARIO Outline**
    + used when same test has to be performed with different data set. 
    + data listed gets passed in as a parameter in multiple instances
    + test becomes PARAMATERIZED 
    + example
```
Feature: Login 
Scenario Outline:  Login functionality
Given: user navs to site
When: user logs in using un: \<username> and password \<password>
Then: login should be successful

Examples:
|username   |password   |
|Tom        |password1  |
|John       |passwrod2  |
```
- **TAGS**
    + Cucumber by default runs all feature files
    + Tags are what tell cucumber to run only certain tests
    + example: 
        * **@SmokeTest**
    + example of using multiple tags simultaneously:
        * **@SmokeTest @LoginTest**
    + other example tages:
        * **@positiveScenario**
        * **@negativeScenario**
        





____________________________

[SemVer]:http://semver.org/
[Executable Specs]:https://github.com/VideoAlchemy/kidspace/blob/master/executable_specs.md


