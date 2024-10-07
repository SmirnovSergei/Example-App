//
//  ShadowView.swift
//  ExampleApp
//
//  Created by Сергей Смирнов on 30.09.2024.
//

import UIKit

class ShadowView: UIView {
    private let imageView = UIImageView()

/*
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupImageView()
        setupLayout()
    }
 */
    init(imageName: String) {
        super.init(frame: .zero)
        setupView()
        setupImageView(imageName)
        setupLayout()
        layoutSubviews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageView(_ imageName: String) {
        imageView.image = UIImage(named: imageName)
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        addSubview(imageView)
    }

    private func setupView() {
        layer.cornerRadius = 20
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 10
    }
    
    private func setupLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let shadowPath = UIBezierPath(rect: bounds)
        layer.shadowPath = shadowPath.cgPath
    }
    
    func updateImage(_ imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}
