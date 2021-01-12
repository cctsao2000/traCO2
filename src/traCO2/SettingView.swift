//
//  SettingView.swift
//  traCO2
//
//  Created by 曹瀞之 on 2020/12/12.
//

import SwiftUI

struct SettingView: View {
    @Binding var goal: Double
    @State var enterGoal: String = ""
    @State private var askGoal = false
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                    .frame(height:30)
                Button(action:{askGoal.toggle()}){
                    HStack{
                        Spacer()
                            .frame(width:40)
                        Image("flag")
                            .resizable()
                            .frame(width:30,height:30)
                        Spacer()
                            .frame(width:20)
                        Text("Set Monthly Goal")
                            .foregroundColor(Color(red: 122/255.0, green: 122/255.0, blue: 122/255.0, opacity: 1))
                            .font(.system(size: 22))
                            .fontWeight(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                }
                Group{
                    Spacer()
                        .frame(height:15)
                    Divider()
                        .padding()
                    Spacer()
                        .frame(height:15)
                }
                HStack{
                    Spacer()
                        .frame(width:40)
                    Image(systemName: "globe")
                        .foregroundColor(Color(red: 122/255.0, green: 122/255.0, blue: 122/255.0, opacity: 1))
                        .font(.system(size: 25))
                    Spacer()
                        .frame(width:20)
                    Text("Language")
                        .foregroundColor(Color(red: 122/255.0, green: 122/255.0, blue: 122/255.0, opacity: 1))
                        .font(.system(size: 22))
                        .fontWeight(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                Group{
                    Spacer()
                        .frame(height:15)
                    Divider()
                        .padding()
                    Spacer()
                        .frame(height:15)
                }
                HStack{
                    Spacer()
                        .frame(width:40)
                    Image(systemName: "heart.fill")
                        .foregroundColor(Color(red: 122/255.0, green: 122/255.0, blue: 122/255.0, opacity: 1))
                        .font(.system(size: 25))
                    Spacer()
                        .frame(width:20)
                    Text("Support traCO2")
                        .foregroundColor(Color(red: 122/255.0, green: 122/255.0, blue: 122/255.0, opacity: 1))
                        .font(.system(size: 22))
                        .fontWeight(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                Group{
                    Spacer()
                        .frame(height:15)
                    Divider()
                        .padding()
                    Spacer()
                        .frame(height:15)
                }
                Link(destination: URL(string: "https://www.apple.com/tw/app-store/")!,label:{HStack{
                    Spacer()
                        .frame(width:40)
                    Image(systemName: "star.fill")
                        .foregroundColor(Color(red: 122/255.0, green: 122/255.0, blue: 122/255.0, opacity: 1))
                        .font(.system(size: 25))
                    Spacer()
                        .frame(width:20)
                    Text("Rate Us")
                        .foregroundColor(Color(red: 122/255.0, green: 122/255.0, blue: 122/255.0, opacity: 1))
                        .font(.system(size: 22))
                        .fontWeight(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
                    Spacer()
                }})
                Spacer()
            }
            if askGoal == true{
                ZStack{
                    Rectangle()
                        .fill(Color(red: 210/255.0, green: 210/255.0, blue: 210/255.0, opacity: 1))
                        .frame(width:300,height:200)
                        .cornerRadius(15.0)
                    VStack{
                        Spacer()
                            .frame(height:320)
                        Group{
                            TextField("Kilogram", text: $enterGoal)           .frame(width:220, height:20)
                                .font(.system(size: 23))
                                .padding()
                                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                                .cornerRadius(5.0)
                            Spacer()
                                .frame(height:30)
                            Button(action:{askGoal = false;goal = Double(enterGoal) ?? 300}){
                                ZStack{
                                    Rectangle()
                                        .fill(Color(red: 180/255.0, green: 180/255.0, blue: 180/255.0, opacity: 1))
                                        .frame(width: 300, height: 84)
                                        .cornerRadius(15.0)
                                    Text("Submit")
                                        .fontWeight(.regular)
                                        .foregroundColor(.white)
                                        .font(.system(size: 25))
                                        .offset(y:3)
                                }
                            }
                            Spacer()
                        }
                    }
                    Rectangle()
                        .fill(Color(red: 210/255.0, green: 210/255.0, blue: 210/255.0, opacity: 1))
                        .frame(width:300,height:30)
                        .offset(y:12)
                }
            }
        }
        .navigationTitle("Setting")
        .navigationBarTitleDisplayMode(.inline)
    }
}


//struct SettingView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            SettingView()
//        }
//    }
//}
