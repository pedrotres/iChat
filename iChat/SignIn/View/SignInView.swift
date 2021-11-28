//
//  ContentView.swift
//  iChat
//
//  Created by Pedro Francisco Tres on 27/11/21.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject var viewModel = SignInViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack{
                Image("chat_logo")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
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
                    viewModel.signIn()
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
                
                Divider()
                    .padding()
                
                NavigationLink(destination: SignUpView(), label: {
                    Text("Não tem uma conta? clique aqui")
                        .foregroundColor(Color.black)
                }
                )
                
                
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 32)
            .background(Color.init(red: 240/255, green: 231/255, blue: 210/255))
            .navigationTitle("Login")
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
