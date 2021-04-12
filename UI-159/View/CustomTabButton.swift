//
//  CustomTabButton.swift
//  UI-159
//
//  Created by にゃんにゃん丸 on 2021/04/09.
//

import SwiftUI

struct CustomTabButton: View {
    @Binding var selectedTab : String
    @Namespace var animation
    var body: some View {
        HStack(spacing:0){
            
            TabBarButton(image: "home", animation: animation, selected: $selectedTab)
            
            TabBarButton(image: "heart", animation: animation, selected: $selectedTab)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image("search")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .padding(20)
                    .background(pink)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: -5)
            })
            .offset(y: -15)
            
            
            TabBarButton(image: "cart", animation: animation, selected: $selectedTab)
            
            TabBarButton(image: "bell", animation: animation, selected: $selectedTab)
            
        }
        .padding(.vertical,10)
        .padding(.bottom,getSafeArea().bottom == 0 ? 15 : getSafeArea().bottom)
    }
}

struct CustomTabButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabBarButton : View {
    var image : String
    var animation : Namespace.ID
    @Binding var selected : String
    var body: some View{
        
        Button(action: {
            withAnimation(.spring()){
                
                selected = image
            }
            
        }, label: {
            VStack(spacing:10){
                
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .foregroundColor(selected == image ? getColor(image: image) : Color.gray.opacity(0.3))
                
                if selected == image{
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: 8, height: 8)
                        .matchedGeometryEffect(id: "TAB", in: animation)
                }
            }
            .frame(maxWidth: .infinity)
        })
        
    }
    func getColor(image :String)->Color{
        
        switch image{
        
        case "home" : return Color.red
        case "heart" : return Color.green
        case "cart" : return Color.purple
        case "bell" : return Color.yellow
        
        default : return Color.gray
        }
        
        
    }
    
   
}
