// Окно ошибки для негативных кейсов (город или погода не найдены)

import Foundation
import UIKit

class SearchAlert: UIViewController {
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        if let topVC = UIApplication.shared.keyWindow?.rootViewController {
            topVC.present(alert, animated: true)
        }
    }
}
