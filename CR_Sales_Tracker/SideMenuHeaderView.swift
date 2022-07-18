//
//  SideMenuHeaderView.swift
//  CR_Sales_Tracker
//
//  Created by Rubes on 5/8/22.
//

import SwiftUI
import Firebase

struct SideMenuHeaderView: View {
    
    @Binding var isShowing: Bool

    
    var body: some View {
        ZStack (alignment: .topTrailing){
            Button(action: {
                withAnimation(.spring()){
                    isShowing.toggle()
                }            },  label: {Image(systemName: "xmark")
                    .frame(width: 40, height: 40)
                .foregroundColor(Color.white)})
                .padding()
            VStack (alignment: .leading){
                Text("Menu").font(.system(size: 24,weight: .semibold)).foregroundColor(Color.green)
                
                HStack(spacing: 12){
                    HStack (spacing: 4){
                        
                    }.foregroundColor(Color.green)
                    
                    Spacer()
                    
                }.padding(.top, 2)
                
                
                Spacer()
            }.padding(.leading, 10)
        }
        
    }
}

func retrieveData(){
    @ObservedObject var model = ViewModel()
    model.getData()
    
}
struct SideMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeaderView(isShowing: .constant(true))
    }
}
