//
//  SideMenuViewModel.swift
//  CR_Sales_Tracker
//
//  Created by Rubes on 5/9/22.
//

import Foundation
import SwiftUI

enum SideMenuViewModel: Int, CaseIterable{
    case Sales_Today
    case Revenue
    case Reports
    case Switch_Account
    
    var title: String {
        switch self {
        case .Sales_Today: return "Sales_Today"
        case .Revenue: return "Revenue"
        case .Reports: return "Reports"
        case .Switch_Account: return "Switch_Account"
        }
    }
    var imageName: String {
        switch self {
        case .Sales_Today: return "bag"
        case .Revenue: return "dollarsign.circle"
        case .Reports: return "folder"
        case .Switch_Account: return "person"
        }
    }
    
   
    
}
