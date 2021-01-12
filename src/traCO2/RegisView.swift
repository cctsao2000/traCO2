//
//  RegisView.swift
//  traCO2
//
//  Created by 曹瀞之 on 2020/12/11.
//

import SwiftUI

struct RegisView: View {
    
    @State var setUsername: String = ""
    @State var setPassword: String = ""
    @Binding var loginDict: [String:String]

    func register() -> Void {
        loginDict[setUsername] = setPassword
        print(loginDict)
    }
    
    var body: some View {
        ZStack(){
            Rectangle()
                .fill(Color(red: 54.0/255.0, green: 83.0/255.0, blue: 71.0/255.0, opacity: 1.0))
                .edgesIgnoringSafeArea(.all)
            VStack{
                Group{
                    Spacer()
                        .frame(height:120)
                    Image("logoName")
                        .resizable()
                        .frame(width:250,height:45)
                    Spacer()
                        .frame(height:50)
                    TextField("Username", text: self.$setUsername)
                        .font(.system(size: 23))
                        .padding()
                        .frame(width: 350, height: 60)
                        .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                        .cornerRadius(15.0)
                    Spacer()
                        .frame(height:20)
                    TextField("Password", text: self.$setPassword)
                        .font(.system(size: 23))
                        .padding()
                        .frame(width: 350, height: 60)
                        .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                        .cornerRadius(15.0)
                    Spacer()
                        .frame(height:30)
                    Button(action:{register()}) {
                        NavigationLink(destination: ContentView()){
                            Text("Submit")
                                .font(.system(size: 30, weight: .bold))
                                .frame(width: 200, height: 60)
                                .background(Color(red: 186.0/255.0, green: 137.0/255.0, blue: 92.0/255.0, opacity: 1.0))
                                .foregroundColor(.white)
                                .cornerRadius(15.0)
                        }
                    }
                }
                Spacer()
                    .frame(height:120)
                Text("Want to create a restaurant account?")
                    .foregroundColor(.white)
                    .frame(width: 350, height: 30)
                Text("Contact us")
                    .foregroundColor(.white)
                    .frame(width: 350, height: 30)
                Text("regiscontact@traco2.com")
                    .foregroundColor(.white)
                    .frame(width: 350, height: 30)
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

//struct RegisView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisView()
//    }
//}
