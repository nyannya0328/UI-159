//
//  ContentView.swift
//  UI-159
//
//  Created by にゃんにゃん丸 on 2021/04/09.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("current_Page") var currentPage = 1
    
    var body: some View {
        if currentPage > totalPage{
           Home()

        }
        else{



        WaikView()
        }
        
        
        
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct WaikView: View {
    
    @AppStorage("current_Page") var currentPage = 1
    

    var body: some View {
        ZStack{
            
            if currentPage == 1{
                
                ScreenView(image: "pro", title: "KING", bgcolor: Color.red)
                    .transition(.slide)
            }
            
            if currentPage == 2{
                ScreenView(image: "pro", title: "Lion", bgcolor: Color.blue)
                    .transition(.scale)
                
            }
            
            if currentPage == 3{
                
                ScreenView(image: "pro", title: "おう", bgcolor: Color.green)
                    .transition(.slide)
                
                
            }
            
            if currentPage == 4{
                ScreenView(image: "pro", title: "王", bgcolor: Color.purple)
                    .transition(.slide)
                
            }
            
            if currentPage == 5{
                
                
                    ScreenView(image: "pro", title: "らい音", bgcolor: Color.orange)
                        .transition(.scale)
                    
                
            }
            
          
            
           
            
            
            
        
            
          
        }
        .overlay(
        
            Button(action: {
                
                withAnimation(.easeOut){
                    
                    if currentPage <= totalPage{
                        
                        currentPage += 1
                    }
                    else{
                        
                        currentPage = 1
                    }
                    
                }
                
            }, label: {
                
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.purple)
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .clipShape(Circle())
                    .overlay(
                    
                    
                        ZStack{
                            
                            Circle()
                                .stroke(Color.black.opacity(0.3),lineWidth: 3)
                               
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(currentPage) / CGFloat(totalPage))
                                .stroke(Color.white,lineWidth: 4)
                                
                                .rotationEffect(.init(degrees: -90))
                        }
                        .padding(-15)
                    )
                
                
                
                
            })
            .padding(.bottom,20)
            ,alignment: .bottom
        )
    }
}

struct ScreenView: View {
    
    @AppStorage("current_Page") var currentPage = 1
    
    var image : String
    //var detail : String
    var title : String
    var bgcolor : Color
    
    var body: some View{

        VStack(spacing:20){
            
            
            HStack{
                
                if currentPage == 1{
                    
                    Text("Hello Member")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .kerning(1.5)
                }
                
                else{
                    
                    Button(action: {
                        
                        
                        withAnimation(.easeInOut){
                            currentPage -= 1
                        }
                    }) {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(8)
                        
                    }
                    
                }
                
                Spacer()
                
                
                Button(action: {
                    
                    withAnimation(.easeInOut){
                        currentPage = 6
                    }
                    
                }) {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.5)
                }
                
                
            }
            .padding()
            .foregroundColor(.black)
            
            
            
            Spacer()
            
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                
            
            
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
            
            
            Text("King Lion")
                .fontWeight(.semibold)
                .kerning(1.5)
                .padding(.top,30)
            
            
            Spacer(minLength: 120)
            
        }
        .background(bgcolor.cornerRadius(10).ignoresSafeArea())


    }
}

var totalPage = 5
