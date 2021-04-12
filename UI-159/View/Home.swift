//
//  Home.swift
//  UI-159
//
//  Created by にゃんにゃん丸 on 2021/04/09.
//

import SwiftUI

var pink = Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
var yellow = Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))

struct Home: View {
    @State var selectedCategory : categorie = categories.first!
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var selectedTab = "home"
    var body: some View {
        
        VStack(spacing:0){
            TabView(selection:$selectedTab){
                
                LandingPage(selectedCategory: $selectedCategory)
                    .tag("home")
                
                CustomTabView()
                    .tag("heart")
                    .ignoresSafeArea()
                TextView()
                    .tag("bell")
                AnimationView()
                    .tag("cart")
            }
            
            CustomTabButton(selectedTab: $selectedTab)
        }
        .ignoresSafeArea()
        
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
    
    func getSafeArea()->UIEdgeInsets{
        
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}


