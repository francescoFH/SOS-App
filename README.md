# SOS-App

## About 
SOS-App is an emergency app which identifies the user-location and generates the corresponding emergency numbers for that area (Ambulance, Fire, Police). It will also generate a map giving directions to the closest hospitals, police stations and pharmacies. 

- further details to be added

## Installation Instructions
```
Clone project

From project directory run 'pod init'

Open Podfile in text editor and add:

``
pod ‘GoogleMaps’, ‘4.1.0’

pod ‘GooglePlaces’, ‘4.1.0’
``

From command line enter 'pod install'

After dependencies have installed:

open 'SOS-App.xcworkspace'
```

## Tech-Stack 
```
Written using Xcode 12 and Swift 5
SwiftUIKit / SwiftUI hybrid Front & Back
Apple Maps
GoogleMaps 4.1.0
GooglePlaces 4.1.0
```
![External API](https://github.com/BalestraPatrick/EmergencyAPI)

### User Stories:
```
As a User, 
So I can provide my location to the emergency services
I want the app to pinpoint my location and display the address

As a User, 
So I know what number to call for help
I want the app to display the emergency numbers for my current location

As a User, 
So I am able to find help for myself
I want to know the directions to the closest police station, pharmacy and hospital
```

### MVP
App displays emergency service numbers for the users current location (via GPS)
(User Story 1 & 2)

### Helpful Resources:

https://developer.apple.com/sf-symbols/
https://mobileinvader.com/corelocation-in-swiftui-mvvm-unit-tests/
https://stackoverflow.com/questions/8534496/get-device-location-only-country-in-ios
https://stackoverflow.com/questions/8534496/get-device-location-only-country-in-ios
https://medium.com/macoclock/how-to-write-unit-tests-in-swift-using-xcode-f59196d0ebc3
https://www.raywenderlich.com/960290-ios-unit-testing-and-ui-testing-tutorial
https://medium.com/@max.codes/use-swiftui-in-uikit-view-controllers-with-uihostingcontroller-8fe68dfc523bs

### Planning:
#### Storyboards:
![Launch](https://user-images.githubusercontent.com/71830424/105181474-c01c5f80-5b23-11eb-89b8-09ae50f3bef6.png).

![Location](https://user-images.githubusercontent.com/71830424/105181740-16899e00-5b24-11eb-938e-09bac2e1946b.png).

#### Possible Additional Features:
- Translates to local language or language of choice
- User creates profile and then Twilio sends help txt to your emergency contact
- Offers local language phrases allowing the user to ask for help to passers by in the native tongue

