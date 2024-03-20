//
//  ViewModelUser.swift
//  RediExpress
//
//  Created by Алексей Никулин on 19.03.2024.
//

import Foundation
import Supabase

class ViewModel: ObservableObject {
    @Published var task: [users] = []
    
    
    let supabase = SupabaseClient(supabaseURL: URL(string: "https://uzxobwrnnjxyfjogsufc.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV6eG9id3Jubmp4eWZqb2dzdWZjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDYyNDU2MDIsImV4cCI6MjAyMTgyMTYwMn0.l7SYH94FPnfDYmelaPZaW1VcpyIAbnp9-ML-yfv9ZkM")
    
    func fetchTems() {
        Task {
            let user: [users] = try await supabase.database
              .from("users")
              .select()
              .execute()
              .value
            
            await MainActor.run {
                self.task = user
            }
        }
    }
    //register
    func signUp (name: String, phone: String, email: String, password: String) {
        Task {
            try await supabase.auth.signIn(
                email: email,
                password: password
            )
            
            try await supabase.auth.update(user: .init (phone: phone) )
            
            let user = try await supabase.auth.session.user
            
            let userInfo = users(id: user.id, balance: 0, is_courier: false, name: name, phone_number: phone, created_at: Date())
            
            try await supabase.database
              .from("users")
              .insert(userInfo)
              .execute()
            
            try await supabase.auth.signOut ()
        }
    }
    struct users: Codable {
        let id: UUID
        let balance: Float
        let is_courier: Bool
        let name: String
        let phone_number: String
        let created_at: Date
        
    }
}
