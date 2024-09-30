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
    private let imageConteinerView = UIView()
    private let imageView = UIImageView()
    private let stackView = UIStackView()


	override func viewDidLoad() {
		super.viewDidLoad()
		updateNumbers()
		
		setupLabel()
        setupImageConteinerView()
		setupImageView()
        setupView()
        setupStackView()
//        view.addSubview(textLabel)
//        view.addSubview(imageConteinerView)
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
    
    private func setupImageConteinerView() {
        imageConteinerView.layer.shadowColor = UIColor.black.cgColor
        imageConteinerView.layer.shadowOffset = CGSize(width: 15, height: 15)
        imageConteinerView.layer.shadowOpacity = 1
        imageConteinerView.layer.shadowRadius = 10
    }
    
    private func setupImageView() {
        imageView.image = UIImage(named: "raccoon")
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        imageConteinerView.addSubview(imageView)
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
        stackView.addArrangedSubview(imageConteinerView)
    }
    
    private func setupLayout() {
//        textLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageConteinerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Ограничения для stackView
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.heightAnchor.constraint(equalToConstant: 400),
            
//            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            imageConteinerView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 150),
//            imageConteinerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            imageConteinerView.heightAnchor.constraint(equalToConstant: 200),
//            imageConteinerView.widthAnchor.constraint(equalToConstant: 200),

            // Ограничения для imageView внутри imageConteinerView
            imageView.leadingAnchor.constraint(equalTo: imageConteinerView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: imageConteinerView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: imageConteinerView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: imageConteinerView.bottomAnchor)
        ])
    }
}

