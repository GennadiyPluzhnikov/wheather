//
//  Alert.swift
//  petProjectWheather
//
//  Created by Геннадий on 24.02.2025.
//

import Foundation
import UIKit

// MARK: - Параметры для экрана ошибки

class SearchAlert: UIViewController {
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        // Показать alert
        if let topVC = UIApplication.shared.keyWindow?.rootViewController {
            topVC.present(alert, animated: true)
        }
    }
}
