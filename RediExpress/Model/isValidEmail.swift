//
//  String.swift
//  RediExpress
//
//  Created by Алексей Никулин on 16.03.2024.
//

import Foundation

extension String {
    //  Created by Алексей Никулин on 16.03.2024.
    //Проверка на email
    func isValidMail () -> Bool {
        let emailRegex = "^[s-za-z0-9._%+-]+@[a-za-z0-9.-]+\\.[a-za-z]{2,3}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
        
        
    }
}
