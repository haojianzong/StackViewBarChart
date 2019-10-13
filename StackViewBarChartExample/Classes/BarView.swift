//
//  BarView.swift
//  StackViewBarChart
//
//  Created by Jake on 10/12/19.
//  Copyright © 2019 Jake. All rights reserved.
//

import Foundation
import UIKit

public class BarView: UIView {

    private struct Constants {
        static let numberFont = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        static let legendFont = UIFont.systemFont(ofSize: 14.0, weight: .thin)

        static let itemSpacing: CGFloat = 5.0
    }

    public var containerHeight: CGFloat = 100.0 {
        didSet {
            updateBarHeight()
        }
    }

    // The bar height percentage, doesn't contain the legend and number.
    public var barHeightPercentage: CGFloat = 0.5 {
        didSet {
            updateBarHeight()
        }
    }

    let stackView: UIStackView

    public let bar = UIView()
    public let legendLabel = UILabel()
    public let numberLabel = UILabel()

    private let barHeightConstraint: NSLayoutConstraint

    private func updateBarHeight() {
        barHeightConstraint.constant = barMaxHeight * barHeightPercentage
    }

    private var barMaxHeight: CGFloat {
        return max(0, containerHeight - Constants.numberFont.lineHeight - Constants.legendFont.lineHeight - 2 * Constants.itemSpacing)
    }

    override init(frame: CGRect) {
        stackView = UIStackView(arrangedSubviews: [numberLabel, bar, legendLabel])
        stackView.axis = .vertical
        stackView.spacing = Constants.itemSpacing

        barHeightConstraint = bar.heightAnchor.constraint(equalToConstant: frame.height * barHeightPercentage)

        super.init(frame: frame)

        bar.backgroundColor = .green

        addSubview(stackView)
        stackView.pinEdges(to: self)

        legendLabel.text = "n/a"
        legendLabel.textAlignment = .center
        legendLabel.font = Constants.legendFont
        legendLabel.textColor = UIColor(hex: 0xA9A8A9, alpha: 1.0)

        numberLabel.text = "0"
        numberLabel.textAlignment = .center
        numberLabel.font = Constants.numberFont
        numberLabel.textColor = UIColor(hex: 0x0D9275, alpha: 1.0)

        barHeightConstraint.isActive = true
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        updateBarHeight()
    }

    required init?(coder: NSCoder) { fatalError("not implemented") }

}
