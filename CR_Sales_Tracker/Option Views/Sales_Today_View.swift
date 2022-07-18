//
//  Sales_Today_View.swift
//  CR_Sales_Tracker
//
//  Created by Rubes on 5/11/22.
//

import SwiftUI
import CoreData
import Firebase
import Combine

struct Sales_Today_View: View {
   
    
    @ObservedObject var model = ViewModel()
    var list = [Sale]()
    @State var m_list = [Sale]()
    @State var list_2 = [Sale]()
    var dateFormatter : DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    var TP_Date = Date()
    init(){
        model.getData()
    }
    var body: some View {
      
            VStack {
                
                
                    VStack{
                        
                        HStack {
                            Spacer()
                            
                            
                        }
                       
                    ForEach(list_2){Sale in
                        Text(Sale.What_was_sold_)
                    }
                            }
                
                
               Spacer()
                
            }
            .toolbar{ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action:{
                    list_2 =  Add_to_list2(inputArray: m_list);
                    print(list_2.last);
                    print(list_2.first)
                    m_list.removeAll()
                    
                },label: {
                    Image(systemName: "arrow.clockwise.circle").foregroundColor(Color.black).frame(width: 50, height: 50)
                })
            }
            }
            
       
           
        
    }
    
    
    
    func Add_to_list2(inputArray: [Sale]) -> [Sale] {
        // do something to inputArray, perhaps copy it?

        model.getData()
        let  Date = dateFormatter.string(from: TP_Date);
        for Sale in model.list{
            print(Sale.Date_)
            print(Date)
            if Sale.Date_ == Date{
                //print(Sale.What_was_sold_)
                m_list.append(Sale)
               // print(m_list.first)
              //  print(m_list.last)
            }
        }
        return m_list
        
    }
    struct Sales_Today_View_Previews: PreviewProvider {
        static var previews: some View {
            Sales_Today_View()
            
        }
    }
}
