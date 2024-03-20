//
//  ProfileViewModel.swift
//  RediExpress
//
//  Created by Алексей Никулин on 20.03.2024.
//

import SwiftUI

struct ProfileViewModel: Identifiable {
    var id: UUID = UUID()
    var image: String
    var mainText: String
    var secondText: String
}
