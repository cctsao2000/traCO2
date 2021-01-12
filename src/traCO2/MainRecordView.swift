//
//  MainRecordView.swift
//  traCO2
//
//  Created by 曹瀞之 on 2020/12/11.
//

//Dataset Reference: 台灣產品碳足跡資訊 https://data.gov.tw/dataset/8992 https://data.epa.gov.tw/dataset/cfp_p_02


import SwiftUI
import Foundation
import CoreData

struct MainRecordView: View {
    
    @State var currentCF: Double = 0
    @State var date = Date()
    @State var monthCF: Double = 0
    @State var pastRecord: [Double] = [0.0]
    @State var goal: Double
    let dateFormatter = DateFormatter()
    let dateFormatter2 = DateFormatter()
    @State private var showDatePopover: Bool = false
    @State private var changedDate: String = ""
    
    @State private var addRecordPopover: Bool = false
    
    @State var selectObjType: Int = 0
    @State var dayCFList: [String] = []
    @State var foodObjects: [String:Double] = ["Egg":0.17,"梅花肉排":3.40,"Bottled Water":0.13,"麥香奶茶375ml":0.20,"Coca-Cola":0.45,"鳳梨酥":0.18,"統一肉臊麵":0.22]
    @State var trafficObjects: [String:Double] = ["Metro":0.07,"Bus":0.08,"Car":0.11,"Motorcycle":0.10,"Taxi":0.13,"華信航空":0.28,"台灣高鐵":0.03]
    @State var objects: [String:Double] = ["Egg":0.17,"梅花肉排":3.40,"Bottled Water":0.13,"麥香奶茶375ml":0.20,"Coca-Cola":0.45,"鳳梨酥":0.18,"統一肉臊麵":0.22,"Metro":0.07,"Bus":0.08,"Car":0.11,"Motorcycle":0.10,"Taxi":0.13,"華信航空":0.28,"台灣高鐵":0.03]
    @State var searchTerm: String = ""
    @State var searchFoodList: [String:Double] = ["":0]
    
    func showdate() -> String {
        dateFormatter2.dateFormat = "yyyy / MM / dd"
        let showndate = dateFormatter2.string(from: date)
        return showndate
    }
    func changedate() -> Void {
        dateFormatter.dateFormat = "YYYY/MM/dd"
        date = dateFormatter.date(from: changedDate) ?? Date()
    }
    func calCF() -> Double{
        var currentCF = 0.0
        for cfObject in dayCFList{
            currentCF += objects[cfObject] ?? 0;
        }
        return currentCF
    }
    func calMonthCF() -> Double{
        var monthCF = 0.0
        monthCF += calCF()
        return monthCF
    }
    func searchFList() -> [String:Double]{
        if (searchTerm == ""){
            let searchFoodList = foodObjects
            return searchFoodList
        }
        else{
            let searchFoodList = foodObjects.filter{$0.key.lowercased().contains(searchTerm.lowercased())}
            return searchFoodList
        }
    }
    func searchTList() -> [String:Double]{
        if (searchTerm == ""){
            let searchTrafficList = trafficObjects
            return searchTrafficList
        }
        else{
            let searchTrafficList = trafficObjects.filter{$0.key.lowercased().contains(searchTerm.lowercased())}
            return searchTrafficList
        }
    }
    func calPercentage() -> Double{
        return (100-(calMonthCF()/Double(goal))*100)
    }
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Spacer()
                        .frame(height:90)
                    HStack{
                        Button(action:{showDatePopover.toggle()}){
                            Image(systemName:"calendar")
                                .foregroundColor(Color(red: 54.0/255.0, green: 83.0/255.0, blue: 71.0/255.0, opacity: 1.0))
                                .font(.system(size: 35))
                        }
                        Spacer()
                            .frame(width:20)
                        Text(showdate())
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 54.0/255.0, green: 83.0/255.0, blue: 71.0/255.0, opacity: 1.0))
                            .font(.system(size: 35))
                        Spacer()
                            .frame(width:20)
                        Button(action:{addRecordPopover.toggle()}){
                            Image(systemName:"plus.circle")
                                .foregroundColor(Color(red: 54.0/255.0, green: 83.0/255.0, blue: 71.0/255.0, opacity: 1.0))
                                .font(.system(size: 35))
                        }
                    }
                    ZStack(alignment: .top){
                        Rectangle()
                            .fill(Color(red: 131/255.0, green: 188/255.0, blue: 86/255.0, opacity: 1.0))
                            .frame(height:600)
                        VStack{
                            HStack{
                                Image("cf")
                                    .resizable()
                                    .frame(width:45, height:74)
                                    .padding(.top,25)
                                Spacer()
                                    .frame(width:100)
                                Text("\(calCF(),specifier:"%.2f") kg")
                                    .foregroundColor(.white)
                                    .font(.system(size: 60))
                                    .fontWeight(/*@START_MENU_TOKEN@*/.heavy/*@END_MENU_TOKEN@*/)
                                    .padding(.top,30)
                            }
                            Spacer()
                                .frame(height: 27)
                            ForEach(dayCFList,id: \.self){cfObject in
                                ZStack{
                                    Rectangle()
                                        .fill(Color(red: 95/255.0, green: 143/255.0, blue: 80/255.0, opacity: 0.7))
                                        .frame(width:370,height:65)
                                    HStack{
                                        Spacer()
                                            .frame(width:40)
                                        if (foodObjects[cfObject] != nil){
                                            Image("food")
                                                .resizable()
                                                .frame(width:40, height:40)
                                        }
                                        else{
                                            Image("metro")
                                                .resizable()
                                                .frame(width:40, height:40)
                                        }
                                        Spacer()
                                            .frame(width:23)
                                        Text(cfObject)
                                            .fontWeight(.medium)
                                            .foregroundColor(.white)
                                            .font(.system(size: 28))
                                        Spacer()
                                        Text(objects[cfObject]!.description+" kg")
                                            .fontWeight(.medium)
                                            .foregroundColor(.white)
                                            .font(.system(size: 28))
                                        Spacer()
                                            .frame(width:45)
                                    }
                                }
                                Spacer()
                                    .frame(height: 12)
                            }
                        }
                    }
                    ZStack{
                        Rectangle()
                            .fill(Color(red: 150/255.0, green: 214/255.0, blue: 98/255.0, opacity: 1.0))
                            .frame(height:130)
                        HStack{
                            Spacer()
                                .frame(width:15)
                            VStack{
                                Image("eco")
                                    .resizable()
                                    .frame(width:55, height:55)
                                Text("\(calPercentage(),specifier:"%.1f") %")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .font(.system(size: 22))
                            }
                            Spacer()
                                .frame(width:25)
                            Text("\((Double(goal)-calMonthCF()),specifier:"%.1f") / \(goal,specifier:"%.f") kg")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .font(.system(size: 39.5))
                            Spacer()
                                .frame(width:15)
                        }
                    }
                    .offset(y:-100)
                    
                    Spacer()
                        .frame(height: 20)
                    HStack{
                        Spacer()
                        NavigationLink(destination: RankView()){
                            Image(systemName: "rosette")
                                .foregroundColor(Color(red: 122/255.0, green: 122/255.0, blue: 122/255.0, opacity: 1))
                                .font(.system(size: 40))
                        }
                        Spacer()
                        NavigationLink(destination: StatView()){
                            Image("statistics")
                                .resizable()
                                .frame(width:45, height:45)
                        }
                        Spacer()
                        NavigationLink(destination: SettingView(goal: self.$goal)){
                            Image(systemName: "gear")
                                .foregroundColor(Color(red: 122/255.0, green: 122/255.0, blue: 122/255.0, opacity: 1))
                                .font(.system(size: 40))
                        }
                        Spacer()
                        NavigationLink(destination: ContentView()){
                            Image("logout")
                                .resizable()
                                .frame(width:45, height:45)
                        }
                        Spacer()
                    }
                    .offset(y:-90)
                    Spacer()
                }
                if (showDatePopover == true){
                    ZStack{
                        Image("triangle")
                            .resizable()
                            .frame(width:105,height:90)
                            .opacity(0.7)
                            .position(x: 125, y:430)
                        Rectangle()
                            .fill(Color(.white))
                            .frame(width:270,height:150)
                            .cornerRadius(15.0)
                        VStack{
                            TextField("YYYY/MM/DD",text: self.$changedDate)
                                .font(.system(size: 23))
                                .padding()
                                .frame(width:220, height:50)
                                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                            Spacer()
                                .frame(height:18)
                            Divider()
                                .frame(width:270)
                            Spacer()
                                .frame(height:15)
                            Button(action:{changedate();showDatePopover.toggle()}){
                                Text("OK")
                                    .font(.system(size: 25))
                                    .frame(width:250,height:30.0)
                            }
                        }
                    }
                    .position(x: 145, y: 240)
                }
                if (addRecordPopover == true){
                    ZStack{
                        Image("triangle")
                            .resizable()
                            .frame(width:85,height:60)
                            .opacity(0.7)
                            .position(x: 315, y: 200)
                        Rectangle()
                            .fill(Color(.systemGray6))
                            .frame(width:300,height:575)
                            .cornerRadius(15.0)
                            .position(x: 207, y: 475)
                        VStack{
                            Spacer()
                                .frame(height:30)
                            Picker(selection: $selectObjType, label: Text(""), content: {
                                            Text("Food").tag(0)
                                            Text("Traffic").tag(1)
                                        }).pickerStyle(SegmentedPickerStyle())
                            .frame(width:270)
                            TextField("Search", text: self.$searchTerm)
                                .font(.system(size: 20))
                                .padding()
                                .frame(width: 270, height: 40)
                                .background(Color(.white))
                                .cornerRadius(10.0)
                                .offset(y:8)
                            if (selectObjType == 0){
                                List(Array(searchFList().keys),id: \.self){foodName in
                                    Button(action:{dayCFList.append(foodName);addRecordPopover.toggle()}){
                                        HStack{
                                            Spacer()
                                            Text(foodName)
                                                .font(.system(size: 18))
                                                .padding()
                                                .frame(width:160,height:35,alignment:.leading)
                                            Spacer()
                                                .frame(width:5)
                                            Text(foodObjects[foodName]?.description ?? "")
                                                .font(.system(size: 18))
                                                .padding()
                                                .frame(width:90,height:35,alignment:.trailing)
                                            Spacer()
                                        }
                                        .offset(x:-10)
                                    }
                                }
                                .frame(width:300,height:500)
                                .offset(y:-15)
                                .cornerRadius(15.0)
                            }
                            else{
                                List(Array(searchTList().keys),id: \.self){trafficName in
                                    Button(action:{dayCFList.append(trafficName);addRecordPopover.toggle()}){
                                        HStack{
                                            Spacer()
                                            Text(trafficName)
                                                .font(.system(size: 18))
                                                .padding()
                                                .frame(width:160,height:35,alignment:.leading)
                                            Spacer()
                                                .frame(width:5)
                                            Text(trafficObjects[trafficName]?.description ?? "")
                                                .font(.system(size: 18))
                                                .padding()
                                                .frame(width:90,height:35,alignment:.trailing)
                                            Spacer()
                                        }
                                        .offset(x:-10)
                                    }
                                }
                                .frame(width:300,height:500)
                                .offset(y:-15)
                                .cornerRadius(15.0)
                            }
                        }
                    }
                    .position(x:250,y:450)
                }
            }
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
    }
}

struct MainRecordView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MainRecordView(date: Date(), goal: 300)
        }
    }
}
