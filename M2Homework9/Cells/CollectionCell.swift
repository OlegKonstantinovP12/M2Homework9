//
//  CollectionCell.swift
//  M2Homework9
//
//  Created by Oleg Konstantinov on 25.11.2025.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    static var cellID = "CollectionCell"
    
    private lazy var usernameLabel = setupLabel(font: .interType(size: 20, weight: .extraBold))
    private lazy var titleLabel = setupLabel(font: .interType(size: 20, weight: .extraBold))
    private lazy var dateLabel = setupLabel(font: .interType(size: 12, weight: .regular))
    private lazy var descriptionLabel = setupLabel(font: .interType(size: 16, weight: .regular))
    
    private lazy var nextButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tintColor = .white
        $0.backgroundColor = .greenBtn
        $0.setTitle("next", for: .normal)
        $0.layer.cornerRadius = 20
        return $0
    }(UIButton(primaryAction: nil))
    
    private lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 30
        return $0
    }(UIImageView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .grayLight
        contentView.layer.cornerRadius = 30
        contentView.addSubview(usernameLabel)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(nextButton)
    }
    
    override func prepareForReuse() {
//        1 Удаление изображений
        imageView.image = nil
        descriptionLabel.text = nil
//        2 Удаление констрейнтов
        imageView.constraints.forEach { constraint in
            imageView.removeConstraint(constraint)
        }
    }

    func setupCell(item: Post) {
        usernameLabel.text = item.username
        imageView.image = UIImage(named: item.poster)
        titleLabel.text = item.postTitle
        dateLabel.text = item.date
        descriptionLabel.text = item.post
        
        setupConstraints()
    }
    
    
    private func setupLabel (font: UIFont, ) -> UILabel {
        let label = UILabel()
        label.font = font
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -36),
            usernameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 23),
            usernameLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 132),
            
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            imageView.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 21),
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -36),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 9),
            
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -36),
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descriptionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 14),
            
            nextButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            nextButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 38),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
