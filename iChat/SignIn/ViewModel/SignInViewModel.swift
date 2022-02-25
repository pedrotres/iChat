//
//  SignInViewModel.swift
//  iChat
//
//  Created by Pedro Francisco Tres on 27/11/21.
//

import Foundation
import FirebaseAuth

class SignInViewModel: ObservableObject {
    var email = ""
    var password = ""
    
    @Published var formInvalid = false
    @Published var isLoading = false
    
    var alertText = ""
    
    
    
    func signIn() {
        isLoading = true
        Auth.auth().signIn(withEmail: email, password: password){
            result, err in
            guard let user = result?.user, err == nil else {
                self.formInvalid = true
                self.alertText = err!.localizedDescription
                print(err)
                self.isLoading = false
                return
            }
            self.isLoading = false
            print("Usuario Logado \(user.uid)")
        }
        
    }
}
