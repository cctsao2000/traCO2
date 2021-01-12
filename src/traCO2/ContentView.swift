//
//  ContentView.swift
//  traCO2
//
//  Created by 曹瀞之 on 2020/12/10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State var authenticationT: Bool = false
    @State var authenticationF: Bool = false
    @State var loginDict : [String:String] = ["username":"password","nccumis":"sad"]
    
    var body: some View {
        NavigationView{
            ZStack(){
                Rectangle()
                    .fill(Color(red: 54.0/255.0, green: 83.0/255.0, blue: 71.0/255.0, opacity: 1.0))
                    .edgesIgnoringSafeArea(.all)
                VStack() {
                    Spacer()
                        .frame(height: 60)
                    Image("crop")
                        .resizable()
                        .frame(width: 308, height: 228, alignment: .center)
                    Spacer()
                        .frame(height: 80)
                    Group{
                        TextField("Username", text: self.$username)
                            .font(.system(size: 23))
                            .padding()
                            .frame(width: 350, height: 60)
                            .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                            .cornerRadius(15.0)
                        Spacer()
                            .frame(height: 10)
                        SecureField("Password", text: self.$password)
                            .font(.system(size: 23))
                            .padding()
                            .frame(width: 350, height: 60)
                            .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                            .cornerRadius(15.0)
                        Spacer()
                            .frame(height: 20)
                        if authenticationF == true{
                            Text("Invalid information. Try again.")
                                .foregroundColor(.red)
                        }
                        else if authenticationT == true{
                            NavigationLink(
                                destination: MainRecordView(date: Date(), goal: 300),
                                isActive: $authenticationT,
                                label: {
                                    Text(" ")
                                })
                        }
                        else{
                            Text(" ")
                        }
                    }
                    Spacer()
                        .frame(height: 20)
                    Button(action: {
                        authenticationT = false
                        authenticationF = false
                        if loginDict[self.username] != nil && self.password == loginDict[self.username] {
                            self.authenticationT = true
                        }
                        else {
                            self.authenticationF = true
                        }
                    }) {
                        Text("Login")
                            .font(.system(size: 30, weight: .bold))
                            .frame(width: 200, height: 60)
                            .background(Color(red: 186.0/255.0, green: 137.0/255.0, blue: 92.0/255.0, opacity: 1.0))
                            .foregroundColor(.white)
                            .cornerRadius(15.0)
                    }
                    Spacer()
                        .frame(height: 20)
                    NavigationLink(destination: RegisView(loginDict:self.$loginDict)){
                        Text("Don't have an account? Sign up")
                            .foregroundColor(.white)
                            .frame(width: 350, height: 60)
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView{
//            ContentView()
//        }
//    }
//}

