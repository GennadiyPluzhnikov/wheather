//
//  Constraints.swift
//  petProjectWheather
//
//  Created by Геннадий on 24.02.2025.
//

import Foundation
import UIKit

class Constraints: UIViewController {
    
    func constraints() {
        
        let wheatherController = WheatherController()
        
        NSLayoutConstraint.activate([
            
            // Background Image
            wheatherController.backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            wheatherController.backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            wheatherController.backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            wheatherController.backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Ограничения для ScrollView
            wheatherController.scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            wheatherController.scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            wheatherController.scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            wheatherController.scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Ограничения для contentView
            wheatherController.contentView.topAnchor.constraint(equalTo: wheatherController.scrollView.topAnchor),
            wheatherController.contentView.leadingAnchor.constraint(equalTo: wheatherController.scrollView.leadingAnchor),
            wheatherController.contentView.trailingAnchor.constraint(equalTo: wheatherController.scrollView.trailingAnchor),
            wheatherController.contentView.bottomAnchor.constraint(equalTo: wheatherController.scrollView.bottomAnchor),
            wheatherController.contentView.widthAnchor.constraint(equalTo: wheatherController.scrollView.widthAnchor),
            
            // Основной стек
            wheatherController.mainBlocksStackView.topAnchor.constraint(equalTo: wheatherController.descriptionLabel.bottomAnchor, constant: 20),
            wheatherController.mainBlocksStackView.leadingAnchor.constraint(equalTo: wheatherController.contentView.leadingAnchor, constant: 20),
            wheatherController.mainBlocksStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            wheatherController.mainBlocksStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            // Элементы внутри ScrollView
            wheatherController.cityLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            wheatherController.cityLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            wheatherController.temperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 10),
            wheatherController.temperatureLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            wheatherController.descriptionLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 10),
            wheatherController.descriptionLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            wheatherController.forecastWheather.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 630),
            wheatherController.forecastWheather.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            wheatherController.forecastWheather.widthAnchor.constraint(equalToConstant: 250),
            wheatherController.forecastWheather.heightAnchor.constraint(equalToConstant: 40),
            
            wheatherController.changeCity.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30),
            wheatherController.changeCity.leadingAnchor.constraint(equalTo: cityLabel.trailingAnchor, constant: 5),
            wheatherController.changeCity.widthAnchor.constraint(equalToConstant: 30),
            wheatherController.changeCity.heightAnchor.constraint(equalToConstant: 30)
            
        ])
    }
}
