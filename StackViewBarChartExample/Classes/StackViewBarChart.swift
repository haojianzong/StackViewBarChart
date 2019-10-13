//
//  StackViewBarChart.swift
//  StackViewBarChart
//
//  Created by Jake on 10/12/19.
//  Copyright © 2019 Jake. All rights reserved.
//

import Foundation
import UIKit

public class StackViewBarChart: UIView {

    public struct Data {
        let legend: String
        let number: UInt

        public init(legend: String, number: UInt) {
            self.legend = legend
            self.number = number
        }
    }

    private struct Constants {
        static let fromColor = UIColor(hex: 0x0D9675, alpha: 1.0)
        static let toColor = UIColor(hex: 0x177087, alpha: 1.0)

        static let unitHeight: CGFloat = 5.0
        static let unitWidth: CGFloat = 30.0
    }

    public var numberList: [Data] = [
        Data(legend: "M", number: 7),
        Data(legend: "T", number: 8),
        Data(legend: "W", number: 3),
        Data(legend: "T", number: 3),
        Data(legend: "F", number: 2),
        Data(legend: "S", number: 7),
        Data(legend: "S", number: 7),
        ] {
        didSet {
            setNeedsLayout()
        }
    }

    var maxUnit: Int = 10

    let stackView: UIStackView

    override public init(frame: CGRect) {
        stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .bottom
        stackView.axis = .horizontal

        super.init(frame: frame)

        addSubview(stackView)

        stackView.pinEdges(to: self)
    }

    required init?(coder: NSCoder) { fatalError("not implemented") }

    func factoryViewList(containerHeight: CGFloat) -> [UIView] {

        let maxNumber = numberList.reduce(0) {
            return max($1.number, $0)
        }

        var views = [UIView]()
        for (index, data) in numberList.enumerated() {
            let bar = BarView()
            bar.numberLabel.text = String(data.number)
            bar.legendLabel.text = data.legend
            bar.widthAnchor.constraint(equalToConstant: Constants.unitWidth).isActive = true

            bar.containerHeight = containerHeight
            bar.barHeightPercentage = CGFloat(data.number) / CGFloat(maxNumber)

            bar.bar.backgroundColor = Constants.fromColor.toColor(Constants.toColor, percentage: CGFloat(index) / CGFloat(numberList.count))
            views.append(bar)
        }

        return views
    }

    override public func layoutSubviews() {
        super.layoutSubviews()

        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }

        for view in factoryViewList(containerHeight: frame.height) {
            stackView.addArrangedSubview(view)
        }
    }
}
