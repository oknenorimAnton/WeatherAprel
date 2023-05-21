//
//  CurrentForecastTableViewCell.swift
//  WeatherAprel
//
//  Created by Антон on 15.05.2023.
//

import UIKit
import SVGKit

final class CurrentForecastTableViewCell: UITableViewCell {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        return stackView
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let conditionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with viewModel: CurrentForecastViewModel) {
        cityLabel.text = viewModel.city
        temperatureLabel.text = viewModel.temperature
        conditionLabel.text = viewModel.condition.descriprion
        
        let svgImage = SVGKImage(data: viewModel.imageData)
        iconImageView.image = svgImage?.uiImage
    }
}

private extension CurrentForecastTableViewCell {
    func setupCell() {
        addSubviews()
        setupConstraints()
        selectionStyle = .none
    }
    
    func addSubviews() {
        stackView.addArrangedSubview(cityLabel)
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(temperatureLabel)
        stackView.addArrangedSubview(conditionLabel)
        
        contentView.addSubview(stackView)
    }
    
    func setupConstraints() {
        let stackViewPadding = 16.0
        let imageSize = 100.0
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: stackViewPadding),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: stackViewPadding),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -stackViewPadding),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -stackViewPadding),
            
            iconImageView.widthAnchor.constraint(equalToConstant: imageSize),
            iconImageView.heightAnchor.constraint(equalToConstant: imageSize)
        ])
    }
}


