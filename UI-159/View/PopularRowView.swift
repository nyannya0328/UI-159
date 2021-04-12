//
//  PopularRowView.swift
//  UI-159
//
//  Created by にゃんにゃん丸 on 2021/04/09.
//

import SwiftUI

struct PopularRowView: View {
    var popular : Popular
    var body: some View {
        VStack(spacing:15){
            
            Image(systemName: "flame")
                .font(.footnote)
                .foregroundColor(.red)
                .padding(8)
                .background(Color.orange.opacity(0.3))
                .frame(maxWidth: .infinity,alignment: .trailing)
                .padding(-15)
            
            Image(popular.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: getRect().width / 3)
            
            
            Text(popular.title)
                .fontWeight(.bold)
                .padding(.top,20)
            
            Text(popular.description)
                .font(.footnote)
                .fontWeight(.bold)
             (
             
                Text(popular.price)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                +
                Text("  円")
             
             )
            
        }
        .padding(.horizontal,30)
        .padding(.vertical,20)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
    }
}

struct PopularRowView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}
