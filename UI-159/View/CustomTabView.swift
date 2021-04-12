//
//  CustomTabView.swift
//  UI-159
//
//  Created by にゃんにゃん丸 on 2021/04/10.
//

import SwiftUI

struct CustomTabView: View {
    
    var colors : [Color] = [.red,.green,.blue,.purple]
    @State var offset : CGFloat = 0
    var body: some View {
        ScrollView(.init()){
            
            
            TabView{
                
                
                ForEach(colors.indices,id:\.self){index in
                    
                    
                    
                    
                    
                   
                    
                    if index == 0{
                        
                        colors[index]
                            .overlay(
                            
                                GeometryReader{proxy -> Color in
                                    
                                    let minx = proxy.frame(in: .global).minX
                                    
                                    DispatchQueue.main.async {
                                        
                                        self.offset = -minx
                                        
                                    }
                                    
                                    
                                    return Color.clear
                                    
                                }
                            
                            )
                        
                        
                    }
                    else{
                        
                        colors[index]
                    }
                    
                }
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .overlay(
            
                HStack(spacing:15){
                    
                    ForEach(colors.indices,id:\.self){index in
                        
                        
                        Capsule()
                            .fill(Color.white)
                            .frame(width: getIndex() == index ? 20 : 7, height: 7)
                        
                        
                          
                    }
                    
                    
                    
                }
                
                .overlay(
                
                Capsule()
                    .fill(Color.white)
                    .frame(width: 20, height: 7)
                    .offset(x: getOffset())
                    
                    
                    ,alignment: .leading
                
                )
                .padding(.bottom,getSafeArea().bottom == 0 ? 15 : getSafeArea().bottom)
                .padding(.bottom,10)
                
                
                ,alignment: .bottom
                
               
               
            )
           
            
        }
        .ignoresSafeArea()
    }
    
    func getIndex()->Int{
        
        let index = Int(round(Double(offset / getRect().width)))
        
        return index
        
    }
    
    func getOffset()->CGFloat{
        
        let progress = offset / getRect().width
        return 22 * progress
        
    }
}


struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
