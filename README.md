# Movie Listing

[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

![Simulator Screenshot - iPhone 14 Pro Max - 2023-07-13 at 17 15 50](https://github.com/iabhishek-nag/EITC/assets/106676582/0bf3ed8f-a67a-435d-bc2e-de56186455dc)
![Simulator Screenshot - iPhone 14 Pro Max - 2023-07-13 at 17 15 56](https://github.com/iabhishek-nag/EITC/assets/106676582/414cd3e4-8db4-4174-b01a-4cfa959bbaad)


## Version

1.0

## Prerequisites

- Xcode 11.3 or later
- iOS 12.4 or later
- macOS 10.15 or later

## 1. Dependencies

We will be building this app using Xcode 11.3 with Swift 5.x. This app will also consume the https://www.themoviedb.org API to get Movie list.

- Xcode 11.3
- Swift 5.x

### Dependency Manager
CocoaPods

### Library Used
- IQKeyboardManagerSwift
- RxSwift
- RxCocoa
- ProgressHUD
- Alamofire
- AlamofireImage


## 2. Written in Swift

This Code sample is written in Swift.


## Design Patterns

- ### MVVM

Model-View-ViewModel (MVVM) is one of the building blocks of Cocoa and is undoubtedly the most-used design pattern of all. It classifies objects according to their general role in your application and encourages clean separation of code based on role.

![minio_SWIFT1](https://koenig-media.raywenderlich.com/uploads/2019/12/MVVM-Diagram.png)

- ### Decorator

The Decorator pattern dynamically adds behaviors and responsibilities to an object without modifying its code. It’s an alternative to subclassing where you modify a class’s behavior by wrapping it with another object.

In Swift, there are two very common implementations of this pattern: Extensions and Delegation.

## Features

- Show Login Screen with form Validation
- List Popular Movies

## Installation

\*Cloning or downloading the repository

- Go to working directory
- Open EITC.xcworkspace
- Use command + B or Product -> Build to build the project
- Press run icon in Xcode or command + R to run the project on Simulator

## Step to run the project from command-line

- Make sure command-line tools of Xcode is installed
- Go to working Directory
- xcodebuild -scheme EITC build -allowProvisioningUpdates


## To Do

### Unit Test cases

### CI/CD

- [Jenkins](http://jenkins.io)
- [Azure DevOps](https://azure.microsoft.com/en-in/services/devops/#DevOps)
- [TestFlight](https://developer.apple.com/testflight/)
- [fastlane](https://fastlane.tools)
- [Xcode Server](https://developer.apple.com/library/archive/documentation/IDEs/Conceptual/xcode_guide-continuous_integration/index.html)

### Crash Reporting

- [AppCenter](https://appcenter.ms/)

## License

Distributed under the MIT license. See `LICENSE` for more information.

[LICENSE](https://github.com/laxmansahni/HealthApp/blob/master/LICENSE)

[swift-image]: https://img.shields.io/badge/swift-5.0-orange
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com
