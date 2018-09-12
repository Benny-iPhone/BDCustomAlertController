# BDCustomAlertController

[![CI Status](https://img.shields.io/travis/benny.davidovitz@gmail.com/BDCustomAlertController.svg?style=flat)](https://travis-ci.org/benny.davidovitz@gmail.com/BDCustomAlertController)
[![Version](https://img.shields.io/cocoapods/v/BDCustomAlertController.svg?style=flat)](https://cocoapods.org/pods/BDCustomAlertController)
[![License](https://img.shields.io/cocoapods/l/BDCustomAlertController.svg?style=flat)](https://cocoapods.org/pods/BDCustomAlertController)
[![Platform](https://img.shields.io/cocoapods/p/BDCustomAlertController.svg?style=flat)](https://cocoapods.org/pods/BDCustomAlertController)

## What does it do?

**UIAlertAction**

- Display an UIImage within UIAlertAction using actionWithTitle:image:style:handler:

- Display Image and Text using your prefered layout (leader or trailing) by invoking actionWithCustomContent:handler:

**UIAlertController**

- Computed Tint Color

- Date Picker as Cotent View Controller

- More Content Options will be added as you request


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

##### Display an UIAlertAction with text and image

```swift

    func displayAlertActionWithImage(){
        
        let alert = UIAlertController(title: "yo!", message: "a message", preferredStyle: .alert)
        let action = UIAlertAction(title: "Your Text", image: UIImage(named: "your_image_name"), style: .default) { (_) in
            //some code to handle the action
        }
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
        
    }

```
##### Display an UIAlertController with UIDatePicker

```swift
    func displayAlertWithDatePicker(){
        let alert = UIAlertController(title: "yo!", message: "select a date messsage", preferredStyle: .alert)
        alert.insertDatePicker { (datePicker) in
            //config date picker as you like here
        }
        
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { (_) in
            guard let datePicker = alert.datePicker() else{
                return
            }
            
            print("selected date is \(datePicker.date)")
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }

```

## Installation

BDCustomAlertController is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BDCustomAlertController'
```

## Author

Benny Davidovitz 

## License

BDCustomAlertController is available under the MIT license. See the LICENSE file for more info.