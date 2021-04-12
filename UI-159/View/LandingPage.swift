//
//  LandingPage.swift
//  UI-159
//
//  Created by にゃんにゃん丸 on 2021/04/09.
//

import SwiftUI

struct LandingPage: View {
    @Binding var selectedCategory : categorie
    var body: some View {
        VStack{
            
            HStack{
                
                
                Image(systemName: "circle.grid.2x2")
                    .font(.title2)
                    .padding(10)
                    .background(pink.opacity(0.3))
                    .foregroundColor(pink)
                    .cornerRadius(10)
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("pro")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30)
                        .padding(10)
                        .background(pink.opacity(0.3))
                        .foregroundColor(pink)
                        .clipShape(Circle())
                })
            }
            .overlay(
            
                HStack(spacing:25){
                    
                    Image("placeholder")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 18, height: 18)
                        .foregroundColor(.pink)
                    
                    
                    Text("Lion USA")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    
                }
            )
            .padding()
            
            
            ScrollView(.vertical, showsIndicators: false, content: {
               
                VStack(alignment:.leading,spacing:15){
                    
                    HStack(spacing:15){
                        
                        
                        VStack(alignment: .leading, spacing: 15, content: {
                            
                            (
                            Text("The First in Delevery")
                                
                                +
                                
                                Text("Food")
                                .foregroundColor(.red)
                                
                            
                            
                            )
                            .font(.title)
                            .fontWeight(.bold)
                            
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Order Now")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    .background(pink)
                                    .clipShape(Capsule())
                            })
                            
                            
                        })
                        
                        Spacer()
                        
                        
                        Image("delivery-man")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: getRect().width / 3)
                    }
                    .padding()
                    .background(yellow.opacity(0.3))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    Text("Categories")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                    
                    
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack{
                            
                                
                                ForEach(categories){cate in
                                    
                                    HStack(spacing:15){
                                    
                                    Image(cate.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 18, height: 18)
                                        .padding(5)
                                        .background(selectedCategory.id == cate.id ? Color.white : Color.gray.opacity(0.3))
                                    
                                    Text(cate.name)
                                        .font(.footnote)
                                        .fontWeight(.bold)
                                        .foregroundColor(selectedCategory.id == cate.id ? .white : .black)
                                    
                                }
                                    .padding(.vertical,12)
                                    .padding(.horizontal)
                                    .background(selectedCategory.id == cate.id ? pink : Color.gray.opacity(0.3))
                                    .clipShape(Capsule())
                                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                                    .onTapGesture {
                                        withAnimation(.spring()){
                                            
                                            selectedCategory = cate
                                        }
                                    }
                                
                            }
                           
                        }
                        .padding(.horizontal)
                    })
                    
                    
                    HStack{
                        
                        Text("Popular Now")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("View All")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(pink)
                            
                            Image(systemName: "chevron.right")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.vertical,4)
                                .padding(.horizontal)
                                .background(pink)
                                .clipShape(Circle())
                        })
                        
                        
                        
                    }
                    .padding()
                    .padding(.top)
                    
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack(spacing:25){
                            
                            ForEach(populars){item in
                                
                                PopularRowView(popular: item)
                                
                                
                            }
                            
                        }
                        .padding()
                    })
                    
                        
                    
                }
                .padding(.vertical,10)
                
                
            })
        }
        .background(Color.primary.opacity(0.02).ignoresSafeArea())
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
