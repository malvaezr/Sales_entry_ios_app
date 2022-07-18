//
//  ContentView.swift
//  CR_Sales_Tracker
//
//  Created by Rubes on 5/5/22.
//

import SwiftUI
import CoreData
import Firebase
import Combine

struct ContentView: View {
    
    private var Cash_card_selection = ["Cash", "Card "]
    @State private var SelectedIndex = 0
    @State var selectedDate: Date = Date()
    @State private var What_was_sold = ""
    @State private var Price = ""
    @State private var Date_sold = Date() // Date of sell
    @State private var Size = ""
    @State private var Cash_Card = "Cash" // true means its cash
    @State var selection: String = "Cash" // The option will be saved
    let Purchase_options: [String] = ["Cash","Card","Cash+tax"]
    let Location_Options: [String] = ["Rubens","CR","Plaza"]
    @State var location = "CR"
    var dateFormatter : DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    @State var selection2: String = ""
    //Model to see data
    @ObservedObject var model = ViewModel()
    
    // Menu Variables
    @State private var isShowing =  false
    var body: some View
    {
        NavigationView{
            ZStack {
                
                if isShowing{
                    SideMenu(isShowing: $isShowing)
                }
                VStack {
                    
                    Spacer()
                    
                    Form{
                        Section(header:Text("Sale Information")){
                            TextField("What was sold",text: $What_was_sold)
                            TextField("Price sold at", text: $Price)
                                .keyboardType(.numberPad)
                                .onReceive(Just(Price)) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered != newValue {
                                        self.Price = filtered
                                    }
                                }
                            TextField("What size",text: $Size)
                            Picker(selection: $selection , label: Text("Cash/Card")
                                   ,content: {
                                ForEach(Purchase_options.indices){index in
                                    Text(Purchase_options[index]).tag(Purchase_options[index])
                                }
                            }).pickerStyle(SegmentedPickerStyle())
                            DatePicker(selection: $Date_sold, label: { Text("Date Sold") })
                            
                            Picker(selection: $selection2 , label: Text("Location")
                                   ,content: {
                                ForEach(Location_Options.indices){index in
                                    Text(Location_Options[index]).tag(Location_Options[index])
                                }
                            })
                            
                            
                            
                        }
                        Section(header:Text("Data Retrival")){
                            List(model.list){item in
                                Text(item.What_was_sold_)}
                        }
                    }
                    
                    
                    
                }
                .cornerRadius(isShowing ? 20 : 0)
                .offset(x: isShowing ? 300 : 0, y: isShowing ? 30 : 0)
                .scaleEffect(isShowing ? 0.8 : 1)
                .navigationBarTitle("Sale Input")
                .toolbar{ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        let  Date = dateFormatter.string(from:Date_sold);
                        let Price_Int = Int(Price) ?? 0
                        model.addData(What_was_sold_: What_was_sold, Price: Price_Int , Size: Size, Cash_Card_: selection, Date_: Date);
                        print(selection, Date
                              ,What_was_sold,Price,Size);},label: {
                            Image(systemName: "paperplane").foregroundColor(Color.black)
                        })                }
                }
                .toolbar{ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action: {
                        withAnimation(.spring()){
                            isShowing.toggle()
                        };print(isShowing)
                        
                    }, label:{Image(systemName: "list.dash").foregroundColor(Color.black)})
                }
                }
                //Else Statement
                
            }.foregroundColor(Color.black)
                .onAppear{
                    isShowing = false
                    
                }
            
        }// Zstack
    }
    init() {
        model.getData()
        UISegmentedControl.appearance().selectedSegmentTintColor = .green
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
    }
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                ContentView()
                    .previewDevice("iPhone 13")
                    .previewLayout(.device)
                    .preferredColorScheme(.light)
                
            }
        }
    }
}
