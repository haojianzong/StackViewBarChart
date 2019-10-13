# StackViewBarChart
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Twitter](https://img.shields.io/badge/twitter-@haojianzong.svg?style=flat)](http://twitter.com/haojianzong)

<img src="https://github.com/haojianzong/StackViewBarChart/blob/master/intro.jpg" />

Create a simple bar chart with UIStackView, because...why not?

UIStackView is my favorite AutoLayout tool now, so part of the project's goal is to explore UIStackView's capability. It turns out it is fairly easy to create a bar chart with UIStackView.

## Features

- Customize chart legends
- Implemented completely with UIStackView
- Gradual bar color
- Tiny code base (only 2 view classes)
- Easy to folk and modify to use in your project

## Screenshots

<img height="200" align="left" src="https://github.com/haojianzong/StackViewBarChart/blob/master/demo-gif.gif" />
<img height="300" align="left" src="https://github.com/haojianzong/StackViewBarChart/blob/master/demo-landscape.png" />

## Requirements

- iOS >= 12.0
- Swift >= 5.0

## Usage

### Adding the StackViewBarChart to your project:

There are two ways to add the ScrollableGraphView to your project.

#### Manually
Add all of the files in the [Classes](StackViewBarChartExample/Classes/) directory to your project in Xcode to your project in Xcode.

#### Carthage

Add to your Cartfile:

```
github "haojianzong/StackViewBarChart" ~> 0.5.2
```

Then make sure to link the frameworks and `import StackViewBarChart` in your code.

#### CocoaPods

CocoaPods is not supported

### Creating a bar chart with data.

Create a StackViewBarChart instance then set its `numberList` property with custom data.

    ```swift
    class ViewController: UIViewController {

        // Initialize an instance
        let barChart = StackViewBarChart(frame: .zero)

        override func viewDidLoad() {
            super.viewDidLoad()

            // Setup its frame
            view.addSubview(barChart)
            barChart.frame = CGRect
            barChart.frame = CGRect(x: 0, y: 0, width: 300, height: 300)

            // Set the data
            barChart.numberList = [StackViewBarChart.Data(legend: "M", number: 0),
                                   StackViewBarChart.Data(legend: "T", number: 2),
                                   StackViewBarChart.Data(legend: "W", number: 7),
                                   StackViewBarChart.Data(legend: "T", number: 8),
                                   StackViewBarChart.Data(legend: "F", number: 30),
                                   StackViewBarChart.Data(legend: "S", number: 20),
                                   StackViewBarChart.Data(legend: "S", number: 10)
        }
    }
    ```  
    
## Known Issues

- Only support positive numbers
- Autolayout warnings when there are too many bars and the frame is too small

## Other

[Follow me on twitter](https://twitter.com/haojianzong) for interesting updates about other things that I make.
