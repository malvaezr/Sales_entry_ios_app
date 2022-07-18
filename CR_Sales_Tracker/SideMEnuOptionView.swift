//
//  SideMEnuOptionView.swift
//  CR_Sales_Tracker
//
//  Created by Rubes on 5/9/22.
//

import SwiftUI

struct SideMEnuOptionView: View {
    let viewModel: SideMenuViewModel
    var body: some View {
        HStack(spacing: 16){
            Image(systemName: viewModel.imageName).frame(width: 24, height: 24)
            Text(viewModel.title).font(.system(size: 15, weight: .semibold))
            
            Spacer()
        }.foregroundColor(Color.white).padding()

    }
}

struct SideMEnuOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SideMEnuOptionView(viewModel: .Sales_Today)
    }
}
