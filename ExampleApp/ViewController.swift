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


	override func viewDidLoad() {
		super.viewDidLoad()
		updateNumbers()
		
		setupLabel()
        setupImageConteinerView()
		setupImageView()
        view.addSubview(textLabel)
        view.addSubview(imageConteinerView)
        setupView()
        setupLayout()
	}
	
	private func updateNumbers() {
		helper.addNumber(Int.random(in: 1...10))
	}
	
	private func setupLabel() {
		let firstNumber = helper.getNumbers().first
		textLabel.text = "\(firstNumber ?? 0)"
		textLabel.font = .systemFont(ofSize: 30, weight: .bold)
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
    
    private func setupLayout() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        imageConteinerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageConteinerView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 150),
            imageConteinerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageConteinerView.heightAnchor.constraint(equalToConstant: 200),
            imageConteinerView.widthAnchor.constraint(equalToConstant: 200),
            imageView.leftAnchor.constraint(equalTo: imageConteinerView.leftAnchor),
            imageView.topAnchor.constraint(equalTo: imageConteinerView.topAnchor),
            imageView.rightAnchor.constraint(equalTo: imageConteinerView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: imageConteinerView.bottomAnchor)
        ])
    }
}

