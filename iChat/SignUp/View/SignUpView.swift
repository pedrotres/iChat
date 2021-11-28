//
//  SignUpView.swift
//  iChat
//
//  Created by Pedro Francisco Tres on 27/11/21.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject var viewModel = SignUpViewModel()
    @State var isShowPhotoLibrary = false
    
    
    
    var body: some View {
        VStack{
            
            Button {
                isShowPhotoLibrary = true
            } label: {
                
                if viewModel.image.size.width > 0 {
                    Image(uiImage: viewModel.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 130, height: 130)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color("GreenColor"), lineWidth: 4))
                        .shadow(radius: 7)
                }else {
                    Text("Foto")
                        .frame(width: 130, height: 130)
                        .padding()
                        .background(Color("GreenColor"))
                        .foregroundColor(Color.white)
                        .cornerRadius(100)
                }
            }
            .padding(.bottom, 32)
            .sheet(isPresented: $isShowPhotoLibrary){
                ImagePicker(selectedImage: $viewModel.image)
            }
            
            TextField("Entre com seu nome", text: $viewModel.nome)
                .autocapitalization(.none)
                .disableAutocorrection(false)
                .padding()
                .background(Color.white)
                .cornerRadius(24)
                .overlay(RoundedRectangle(cornerRadius: 24).strokeBorder(Color(UIColor.separator), style: StrokeStyle(lineWidth: 1)))
                .padding(.bottom, 24)
            
            TextField("Entre com seu e-mail", text: $viewModel.email)
                .autocapitalization(.none)
                .disableAutocorrection(false)
                .padding()
                .background(Color.white)
                .cornerRadius(24)
                .overlay(RoundedRectangle(cornerRadius: 24).strokeBorder(Color(UIColor.separator), style: StrokeStyle(lineWidth: 1)))
                .padding(.bottom, 24)
            
            
            SecureField("Entre com sua senha", text: $viewModel.password)
                .autocapitalization(.none)
                .disableAutocorrection(false)
                .padding()
                .background(Color.white)
                .cornerRadius(24)
                .overlay(RoundedRectangle(cornerRadius: 24).strokeBorder(Color(UIColor.separator), style: StrokeStyle(lineWidth: 1)))
                .padding(.bottom, 30)
            
            if viewModel.isLoading {
                ProgressView()
                    .padding()
            }
            
            
            Button{
                viewModel.signUp()
            } label: {
                Text("Entrar")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("GreenColor"))
                    .foregroundColor(Color.white)
                    .cornerRadius(24)
            }
            .alert(isPresented: $viewModel.formInvalid){
                Alert(title: Text(viewModel.alertText))
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 32)
        .background(Color.init(red: 240/255, green: 231/255, blue: 210/255))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
