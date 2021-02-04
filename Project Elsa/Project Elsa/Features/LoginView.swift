//
//  LoginView.swift
//  Project Elsa
//
//  Created by Dennis Silva on 2/3/21.
//


import SwiftUI

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var authenticationFailed: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 10)
            
            if authenticationFailed {
                Text("Username or password was incorrect. Please try again.")
                    .foregroundColor(Color.red)
            }
            
            UserNameField(username: $username)
        
            PasswordField(password: $password)
            
            Button(action: { login()}) {
                Text("LOGIN")
                    .background(Color.green)
                    .cornerRadius(30.0)
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
            }
        }.padding()
    }
    
    fileprivate func login() {
        if username.isEmptyOrWhitespace || password.isEmptyOrWhitespace {
            return
        }
        
        let apiBaseUrl = getSettingValue(forKey: "BaseUrl")!.replacingOccurrences(of: "||", with: "//")
        let url: URL = URL(string: "\(apiBaseUrl)/user/login")!

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let loginRequest: LoginRequest = LoginRequest(username: username, password: password)
        request.httpBody = try! JSONEncoder().encode(loginRequest)
       
        let loginTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print ("Error \(error)")
                return
            }
    
            if let data = data {
                let loginResponse = try! JSONDecoder().decode(LoginResponse.self, from: data)
                print("Response - \(loginResponse.displayName)")
            }
        }
        
        loginTask.resume()
    }
}

struct UserNameField: View {
    @Binding var username: String
    
    var body: some View {
        TextField("Username", text: $username)
            .background(Color.gray.brightness(0.4))
            .cornerRadius(5.0)
            .padding()
    }
}

struct PasswordField: View {
    @Binding var password: String
    
    var body: some View {
        SecureField("Password", text: $password)
            .background(Color.gray.brightness(0.4))
            .cornerRadius(5.0)
            .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

