//
//  Login Veiw.swift
//  App
//
//  Created by Dylan Wang on 7/12/23.
//

import SwiftUI

struct Login_Veiw: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        NavigationStack {
            VStack {
                //image
                Image("logo 1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 170)
                    .padding(.vertical, 32)
                //form fields
                VStack(spacing: 24) {
                    InputView(text: $email, title: "Email Address",             placeholder: "name@example.com")
                    .autocapitalization(.none)
                    
                    InputView(text: $password, title: "Password",               placeholder: "Enter your password",
                             isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top,12)
                .padding(.bottom,50)
                //sing in button
                
                Button {
                    print("Log user in")
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .cornerRadius(10)
            
               
                
                Spacer()
                
                //sing up button
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 2) {
                        Text("Don't have an account? ")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size:14))
                }
            }
        }
    }
}



struct Login_Veiw_Previews: PreviewProvider {
    static var previews: some View {
        Login_Veiw()
    }
}
