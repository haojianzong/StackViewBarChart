//
//  ViewController.swift
//  StackViewBarChart
//
//  Created by Jake on 10/12/19.
//  Copyright © 2019 Jake. All rights reserved.
//

import UIKit
import StackViewBarChart

class ViewController: UIViewController {

    private struct Constants {
        static let chartHeight: CGFloat = 300.0
        static let margin: CGFloat = 10.0
    }

    let barChart = StackViewBarChart(frame: .zero)

    let reloadButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let stackView = UIStackView(arrangedSubviews: [barChart, reloadButton])
        stackView.axis = .vertical

        reloadButton.setTitle("Reload data", for: .normal)
        reloadButton.addTarget(self, action: #selector(reload), for: .touchUpInside)

        view.addSubview(stackView)
        stackView.pinMargins(to: view)

        NSLayoutConstraint.activate([
            barChart.heightAnchor.constraint(equalToConstant: Constants.chartHeight),
        ])

        view.backgroundColor = UIColor(hex: 0x0f214a, alpha: 1.0)
        reload()
    }

    @objc private func reload() {
        self.barChart.numberList = [StackViewBarChart.Data(legend: "M", number: UInt.random(in: 0...10)),
                                    StackViewBarChart.Data(legend: "T", number: UInt.random(in: 2...10)),
                                    StackViewBarChart.Data(legend: "W", number: UInt.random(in: 7...20)),
                                    StackViewBarChart.Data(legend: "T", number: UInt.random(in: 1...8)),
                                    StackViewBarChart.Data(legend: "F", number: UInt.random(in: 8...30)),
                                    StackViewBarChart.Data(legend: "S", number: UInt.random(in: 1...20)),
                                    StackViewBarChart.Data(legend: "S", number: UInt.random(in: 2...10))
        ]
    }
}
