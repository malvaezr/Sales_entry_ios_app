//
//  View_Model.swift
//  CR_Sales_Tracker
//
//  Created by Rubes on 5/7/22.
//

import Foundation
import Firebase
import SwiftUI

class ViewModel: ObservableObject {
    //@Published var list = [Sale_Retival]()
    @Published var list = [Sale]()
    
    func addData(What_was_sold_ : String, Price : Int,Size : String,Cash_Card_ : String,Date_ : String){
        // Get refrenxce to datatbas
        let db = Firestore.firestore()
        // What collection
        db.collection("Sales").addDocument(data: ["What": What_was_sold_,"Price":Price,"Size":Size,"Cash_Card": Cash_Card_, "Date": Date_]) { error in
            // Check for error
            if error == nil{
                // Retrieve latest data
                self.getData()
                
            }
            else{
                // Handle error
            }
        }
        
        
    }
    func getData(){
        let db = Firestore.firestore()
        
        db.collection("Sales").getDocuments { snapshot,error in
            //Check for errors \
            
            if error == nil{
                // no errors
                if let snapshot = snapshot{
                    DispatchQueue.main.async {
                        
                    
                    self.list =  snapshot.documents.map { d in
                        return Sale(id: d.documentID, What_was_sold_: d["What"] as? String ?? "", Price: d["Price"] as? Int ?? 0, Size: d["Size"] as? String ?? "", Cash_Card_: d["Cash_Card"] as? String ?? "", Date_: d["Date"] as? String ?? "")
                    }
                    }
                }
            }
            else{
                // handle errors
            }
        }
    }
    
    func addDailySales(Todaysdate: String){
        
        
    }
    

    
}
