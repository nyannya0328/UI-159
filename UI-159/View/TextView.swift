//
//  TextView.swift
//  UI-159
//
//  Created by にゃんにゃん丸 on 2021/04/10.
//

import SwiftUI

struct TextView: View {
    
    @State var ison = false
    var body: some View {
        ZStack{
            
            Image("pro")
                .resizable()
            VStack(spacing:25){
                
                TextSheimer(title: "Lion", ison: $ison)
                
                TextSheimer(title: "ライオン", ison: $ison)
                
                imageSheimer(image: "pro",ison: $ison)
                    .offset(y: 200)
                Toggle(isOn: $ison, label: {
                    
                    Text("Enable Multi Color")
                        .font(.footnote)
                        .fontWeight(.bold)
                    
                    
                })
                .padding()
                
                
            }
            .preferredColorScheme(.dark)
        }
    
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}

struct TextSheimer  : View{
    var title : String
    @State var animation = false
    
    @Binding var ison : Bool
    var body: some View{
        
        ZStack{
            
            
            Text(title)
                .font(.system(size: 60, weight: .bold))
                .foregroundColor(Color.white.opacity(0.3))
            
            
            HStack(spacing : 0){
                
                ForEach(0..<title.count,id:\.self){index in
                    
                    Text(String(title[title.index(title.startIndex,offsetBy: index)]))
                        .font(.system(size: 60, weight: .bold))
                        .foregroundColor(ison ?  randomColor() : Color.white)
                    
                }
                
                
            }
            .mask(
            
            Rectangle()
                .fill(
                    LinearGradient(gradient: .init(colors: [.green,.purple]), startPoint: .leading, endPoint: .trailing)
                
                )
                .rotationEffect(.init(degrees: 70))
                .padding(20)
                .offset(x: -250)
                .offset(x: animation ? 500 : 0)
            
            )
            .onAppear(perform: {
                
                withAnimation(Animation.linear(duration: 2.5).repeatForever(autoreverses: false)){
                    
                    animation.toggle()
                }
                
            })
        }
        
        
    }
    func randomColor()->Color{
        
        let color = UIColor(displayP3Red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        return Color(color)
    }
}

struct imageSheimer  : View{
    var image : String
    @State var animation = false
    
    @Binding var ison : Bool
    var body: some View{
        
        ZStack{
            
            
            Image(image)
               
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .clipShape(Circle())
              
                
            
            
            HStack(spacing : 0){
                
                ForEach(0..<image.count,id:\.self){index in
                    
                    Text(String(image[image.index(image.startIndex,offsetBy: index)]))
                        .font(.system(size: 60, weight: .bold))
                        .foregroundColor(ison ?  randomColor() : Color.white)
                        
                    
                }
                
                
            }
            .mask(
            
            Rectangle()
                .fill(
                    LinearGradient(gradient: .init(colors: [.green,.purple]), startPoint: .leading, endPoint: .trailing)
                
                )
                .rotationEffect(.init(degrees: 70))
                .padding(20)
                .offset(x: -250)
                .offset(x: animation ? 500 : 0)
            
            )
            .onAppear(perform: {
                
                withAnimation(Animation.linear(duration: 2.5).repeatForever(autoreverses: false)){
                    
                    animation.toggle()
                }
                
            })
        }
        
        
    }
    func randomColor()->Color{
        
        let color = UIColor(displayP3Red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        return Color(color)
    }
}
