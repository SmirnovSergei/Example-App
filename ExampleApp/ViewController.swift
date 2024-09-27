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
        setupView()
        
        view.addSubview(textLabel)
        view.addSubview(imageConteinerView)
	}
	
	private func updateNumbers() {
		helper.addNumber(Int.random(in: 1...10))
	}
	
	private func setupLabel() {
		let firstNumber = helper.getNumbers().first
		textLabel.text = "\(firstNumber ?? 0)"
		textLabel.font = .systemFont(ofSize: 30, weight: .bold)
		textLabel.textColor = .red
		textLabel.frame = CGRect(x: 30, y: 30, width: 100, height: 50)
	}
    
    private func setupImageConteinerView() {
        imageConteinerView.layer.frame = CGRect(x: 30, y: 130, width: 100, height: 200)
        imageConteinerView.layer.shadowColor = UIColor.black.cgColor
        imageConteinerView.layer.shadowOffset = CGSize(width: 15, height: 15)
        imageConteinerView.layer.shadowOpacity = 1
        imageConteinerView.layer.shadowRadius = 10
    }
    
    private func setupImageView() {
        imageView.image = UIImage(named: "raccoon")
        imageView.frame = imageConteinerView.bounds
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        
        imageConteinerView.addSubview(imageView)
    }
    
    private func setupView() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.green.cgColor, UIColor.blue.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        // Добавляем подслой к кнопке
        view.layer.insertSublayer(gradient, at: 0) // Градиент на фоне кнопки
    }
}

