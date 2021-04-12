//
//  AnimationView.swift
//  UI-159
//
//  Created by にゃんにゃん丸 on 2021/04/11.
//

import SwiftUI

struct AnimationView: View {
    @State var startAnimation = false
    @State var endAnimation = false
    @State var pulse1 = false
    @State var pulse2 = false
    
    @State var findPeople : [People] = []
    var body: some View {
        VStack{
            
            HStack(spacing:15){
                
                
                Button(action: {}) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.black)
                    
                    Text(endAnimation ? "\(peoples.count) people nearBy": "Near By Search")
                        .font(.footnote)
                        .fontWeight(.bold)
                }
               
                
              
                
                Spacer()
                
                Button(action: veryfyAndAddpeople) {
                    if endAnimation{
                        
                        Image(systemName: "arrow.clockwise")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.black)
                        
                    }
                    else{
                        
                        Image(systemName: "plus")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.black)
                    }
                }
                .animation(.none)
                
                
                
            }
            .padding()
            .padding(.top,getSafeArea().top)
            .background(Color.white)
            
            ZStack{
                
                
                Circle()
                    .stroke(Color.purple,lineWidth: 1.4)
                    .frame(width: 130, height: 130)
                    .scaleEffect(pulse1 ? 3.3 : 0)
                    .opacity(pulse1 ? 0 : 1)
                
                Circle()
                    .stroke(Color.purple,lineWidth: 1.4)
                    .frame(width: 130, height: 130)
                    .scaleEffect(pulse2 ? 3.3 : 0)
                    .opacity(pulse2 ? 0 : 1)
                
                 Circle()
                    .fill(Color.white)
                    .frame(width: 130, height: 130)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 5)
                
            
                    
                    Circle()
                        .stroke(Color.blue,lineWidth: 1.4)
                        .frame(width: endAnimation ? 70 : 30, height: endAnimation ? 70 : 30)
                        .overlay(
                        
                        Image(systemName: "checkmark")
                            .font(.largeTitle)
                            .foregroundColor(.green)
                            .opacity(endAnimation ? 1 : 0)
                        
                        )
                ZStack{
                    
                    Circle()
                        .trim(from: 0, to: 0.4)
                        .stroke(Color.blue,lineWidth: 1.4)
                    
                    Circle()
                        .trim(from: 0, to: 0.4)
                        .stroke(Color.blue,lineWidth: 1.4)
                        .rotationEffect(.init(degrees: -180))
                    
                    
                }
                .frame(width: 70, height: 70)
                .rotationEffect(.init(degrees: startAnimation ? 360 : 0))
                ForEach(findPeople){people in
                    
                    Image(people.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .padding(4)
                        .background(Color.white.clipShape(Circle()))
                      .offset(people.offset)
                        
                        
                    
                }
                
                
                
            }
            .frame(maxHeight: .infinity)
            
            if endAnimation{
                
                
                VStack{
                    
                    
                    Capsule()
                        .fill(Color.gray)
                        .frame(width: 45, height: 3)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        
                        HStack(spacing:15){
                            
                            
                            ForEach(peoples){people in
                                
                                VStack(spacing:15){
                                    
                                    
                                    Image(people.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                    
                                    Text(people.name)
                                        .font(.title)
                                        .fontWeight(.bold)
                                    
                                    
                                    Button(action: {}) {
                                        
                                        Text("Choose")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .padding(.vertical,10)
                                            .padding(.horizontal,30)
                                            .background(Color.blue)
                                            .cornerRadius(10)
                                        
                                        
                                    }
                                    
                                    
                                }
                                .padding(.horizontal)
                                
                            }
                            
                        }
                        .padding()
                        .padding(.bottom,getSafeArea().bottom)
                        
                    }
                    
                    
                }
                .background(Color.white)
                .cornerRadius(25)
                .transition(.move(edge: .bottom))
                
            }
            
            
        }
        .ignoresSafeArea()
        .background(Color.blue.opacity(0.2).ignoresSafeArea())
        .onAppear(perform: {
            
            AnimatedView()
            
        })
    }
    
    func veryfyAndAddpeople(){
        
        
        if findPeople.count < 5{
            
            var people = peoples[findPeople.count]
            people.offset = firstFiveOffset[findPeople.count]
            
            findPeople.append(people)
            
        }
        else{
            
            withAnimation(Animation.linear(duration: 0.6)){
                
                endAnimation.toggle()
                pulse2 = false
                pulse1 = false
                startAnimation = false
                
            }
            
            if !endAnimation{

                withAnimation{
                    
                    findPeople.removeAll()
                    AnimatedView()
                }

            }
            
        }
       
        
    }
    
    func AnimatedView(){
        
        withAnimation(Animation.linear(duration: 1.7).repeatForever(autoreverses: false)){
            
            startAnimation.toggle()
        }
        
        withAnimation(Animation.linear(duration: 1.7).delay(-0.1).repeatForever(autoreverses: false)){
            
           pulse1.toggle()
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            
            
            withAnimation(Animation.linear(duration: 1.7).delay(-0.1).repeatForever(autoreverses: false)){
                
               pulse2.toggle()
            }
            
        }
        
      
        
        
        
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}

struct People : Identifiable {
    var id = UUID().uuidString
    var image : String
    var name : String
    var offset : CGSize = CGSize(width: 0, height: 0)
}

var peoples = [
People(image: "p1", name: "きんぐまる"),
    People(image: "p2", name: "コアラ丸"),
    People(image: "p3", name: "チーこ"),
    People(image: "p4", name: "らいまる"),
    People(image: "p5", name: "こあら"),
]

var firstFiveOffset: [CGSize] = [

CGSize(width: 100, height: 100),
    CGSize(width: -100, height: -100),
    
    CGSize(width: -50, height: 130),
    CGSize(width: 130, height: -50),
    CGSize(width: 100, height: -50),
    ]

