//
//  ViewController.swift
//  ExampleApp
//
//  Created by brubru on 08.09.2024.
//

import UIKit

class ViewController: UIViewController {
	
	private let helper = Helper()
	private let textLabel = UILabel()
    private let shadowView = ShadowView(imageName: "raccoon")
    private let secondShadowView = ShadowView(imageName: "custom")
    private let stackView = UIStackView()


	override func viewDidLoad() {
		super.viewDidLoad()
		updateNumbers()
		
		setupLabel()
        setupView()
        setupStackView()
        view.addSubview(stackView)
        setupLayout()
	}
	
	private func updateNumbers() {
		helper.addNumber(Int.random(in: 1...10))
	}
	
	private func setupLabel() {
		let firstNumber = helper.getNumbers().first
		textLabel.text = "\(firstNumber ?? 0)"
		textLabel.font = .systemFont(ofSize: 30, weight: .bold)
        textLabel.textAlignment = .center
		textLabel.textColor = .red
	}

    private func setupView() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.green.cgColor, UIColor.blue.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)

        view.layer.insertSublayer(gradient, at: 0)
    }

    private func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        
        // Добавляем элементы в StackView
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(shadowView)
        stackView.addArrangedSubview(secondShadowView)
    }

    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Ограничения для stackView
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8)
        ])
    }
}

