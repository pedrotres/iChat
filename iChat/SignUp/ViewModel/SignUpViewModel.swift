//
//  SignUpViewModel.swift
//  iChat
//
//  Created by Pedro Francisco Tres on 27/11/21.
//

import Foundation
import FirebaseAuth
import FirebaseStorage

class SignUpViewModel: ObservableObject {
    var email = ""
    var password = ""
    var nome = ""
    
    @Published var image = UIImage()
    
    @Published var formInvalid = false
    
    var alertText = ""
    
    @Published var isLoading = false
    
    func signUp() {

        print("nome, email e senha")
        
        if (image.size.width <= 0) {
            formInvalid = true
            alertText = "Selecione a foto"
            return
        }
        
        isLoading = true
        Auth.auth().createUser(withEmail: email, password: password){
            result, err in
            guard let user = result?.user, err == nil else {
                self.formInvalid = true
                self.alertText = err!.localizedDescription
                print(err)
                self.isLoading = false
                return
            }
            self.isLoading = false
            print("USuario criado \(user.uid)")
            self.uploadPhoto()
        }
    }
    
    private func uploadPhoto() {
        let filename = UUID().uuidString
        
        guard let data = image.jpegData(compressionQuality: 0.2) else {return }
        
        let newMetadata = StorageMetadata()
        newMetadata.contentType = "image/jpeg"
        
        let ref = Storage.storage().reference(withPath: "/images/\(filename).jpg")
        ref.putData(data, metadata: newMetadata, completion: {metadata, err in
            ref.downloadURL{
                url, error in
                self.isLoading = false
                print("Foto criada \(url)")
            }
        })
    }
    
    
}

