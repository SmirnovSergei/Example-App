//
//  ViewController.swift
//  ExampleApp
//
//  Created by brubru on 08.09.2024.
//

import UIKit

class ViewController: UIViewController {
	
	private let textLabel = UILabel()
    private let shadowView = ShadowView(imageName: ShadowViewType.raccon.rawValue)
    private let secondShadowView = ShadowView(imageName: ShadowViewType.custom.rawValue)
    private let stackView = UIStackView()

    private let helper = Helper()
    
    private var randomNumber: Int {
        Int.random(in: 1...10)
    }
    
	override func viewDidLoad() {
		super.viewDidLoad()
		updateNumbers()
		
		setupLabel()
        view.addGradient()
        setupStackView()
        view.addSubview(stackView)
        setupLayout()
	}
	
	private func updateNumbers() {
		helper.addNumber(randomNumber)
	}
}

// MARK: - Nested types
extension ViewController {
    
    enum ShadowViewType: String {
        case raccon = "raccon"
        case custom = "custom"
    }
    
    enum Constant {
        static let font30: CGFloat = 30
    }
}

// MARK: - Setup View
private extension ViewController {
    
    func setupLabel() {
        let firstNumber = helper.getNumbers().first
        textLabel.text = "\(firstNumber ?? 0)"
        textLabel.font = .systemFont(ofSize: Constant.font30, weight: .bold)
        textLabel.textAlignment = .center
        textLabel.textColor = .red
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
}

// MARK: - Setup Layout
extension ViewController {
    
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
