//
//  ContentView.swift
//  page
//
//  Created by Dylan Wang on 8/6/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.black
                .background(Color.black.edgesIgnoringSafeArea(.all))
            VStack {
                //image
                Image("leaf2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 170)
                    .padding(.bottom, 200)
                
                Text("MindCraft")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 60))
                
                Button {
                    print("Go Next")
                } label: {
                    HStack {
                        Text("Next")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                   
                }
                .background(Color(.white))
                .cornerRadius(10)
               
                
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
