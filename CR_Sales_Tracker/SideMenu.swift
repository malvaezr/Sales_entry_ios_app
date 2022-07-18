//
//  SideMenu.swift
//  CR_Sales_Tracker
//
//  Created by Rubes on 5/8/22.
//

import SwiftUI

struct SideMenu: View {
    @Binding var isShowing: Bool
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.black,Color.blue]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            VStack{
                SideMenuHeaderView(isShowing: $isShowing)
                    .frame(height: 100)

                //Option View
                ForEach(SideMenuViewModel.allCases, id: \.self)  { option in
                    
                    if option == SideMenuViewModel.Sales_Today {
                        NavigationLink(destination: Sales_Today_View(), label: {
                            SideMEnuOptionView(viewModel:  option)

                        }
                        )
                          
                    }
                    else if option == SideMenuViewModel.Revenue{
                        NavigationLink(destination: RevenueView(), label: {
                            SideMEnuOptionView(viewModel:  option)

                        })
                    }
                    else if option == SideMenuViewModel.Reports{
                        NavigationLink(destination: ReportsView(), label: {
                            SideMEnuOptionView(viewModel:  option)

                        })
                    }
                    else if option == SideMenuViewModel.Switch_Account{
                        NavigationLink(destination: SwitchAccountView(), label: {
                            SideMEnuOptionView(viewModel:  option)

                        })
                    }
                }
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}



struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu(isShowing: .constant(true))
            .previewDevice("iPhone 13 Pro")
            .preferredColorScheme(.dark)
    }
}
/*
 NavigationLink (
 
     destination: Sales_Today_View(),label: {
     SideMEnuOptionView(viewModel:  option)

 })
 */
