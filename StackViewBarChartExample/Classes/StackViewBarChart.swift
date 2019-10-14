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

        static let unitHeight: CGFloat = 15.0
        static let unitWidth: CGFloat = 20.0
    }

    public var dataList: [Data] = [
        Data(legend: "M", number: 0),
        Data(legend: "T", number: 0),
        Data(legend: "W", number: 0),
        Data(legend: "T", number: 0),
        Data(legend: "F", number: 0),
        Data(legend: "S", number: 0),
        Data(legend: "S", number: 0),
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

        let maxNumber = dataList.reduce(0) {
            return max($1.number, $0)
        }

        let shouldUseRelativeHeight = CGFloat(maxNumber) * Constants.unitHeight > (containerHeight / 2.0)

        var views = [UIView]()
        for (index, data) in dataList.enumerated() {
            let bar = BarView()
            bar.numberLabel.text = String(data.number)
            bar.legendLabel.text = data.legend
            bar.widthAnchor.constraint(equalToConstant: Constants.unitWidth).isActive = true

            bar.containerHeight = containerHeight

            if shouldUseRelativeHeight {
                // Each bar height is relative to the max bar height, while max bar height is 1.0
                bar.barHeightPercentage = CGFloat(data.number) / CGFloat(maxNumber)
            } else {
                // Prefers constant unit height when bar height is within half of container height
                bar.barHeightConstant = CGFloat(data.number) * Constants.unitHeight
            }

            bar.bar.backgroundColor = Constants.fromColor.toColor(Constants.toColor, percentage: CGFloat(index) / CGFloat(dataList.count))
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
