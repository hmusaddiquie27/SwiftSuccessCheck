# SwiftSuccessCheck
Animated success tick with completion block developed in swift 3.
This is a WIP. Not recommended for production usage

![alt tag](https://s3.amazonaws.com/cocoacontrols_production/uploads/control_image/image/12426/SwiftSuccessCheckExaple.png)

## Requirements

- iOS 8 and above.
- Xcode 8 and above

## Adding SwiftSuccessCheck to your project

### MEHTOD 1: (Using Pods)
1. Add a pod entry for `SwiftSuccessCheck` to your Podfile

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'SwiftSuccessCheck'
```

2. Install the pod(s) by running `pod install`.

### MEHTOD 2: (Source file)

```
Alternatively, you can directly clone the complete project from `https://github.com/hmusaddiquie27/SwiftSuccessCheck.git` add copy `SuccessCheck.swift` file under the folder of your project. 
```

## Usage

```
// Create instance of SuccessCheck in your controller's viewDidLoad() method
var scView = SuccessCheck(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

// Add to the parent view
self.view.addSubview(scView)

// Animate the tick process
scView.initWithTime(withDuration: duration, bgCcolor: .orange, colorOfStroke: .white, widthOfTick: 5) { 
	//do additional work after completion
}
```

See example project `SwiftSuccessCheckExaple` for detail.

## License
This code is distributed under the terms and conditions of the [MIT license](LICENSE).