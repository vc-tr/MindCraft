//
//  ContentView.swift
//  MindCraft
//
//  Created by Võ Hữu Thọ on 7/14/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedCategories: Set<String> = []

    let categories = [
        "Physical Health",
        "Mental Health",
        "Emotional Well-being",
        "Sleep and Rest",
        "Nutrition and Healthy Eating",
        "Exercise and Fitness",
        "Stress Management",
        "Relaxation Techniques",
        "Time Management",
        "Personal Hygiene",
        "Skincare and Beauty",
        "Mindfulness and Meditation",
        "Hobbies and Creative Activities",
        "Social Connections and Relationships",
        "Setting Boundaries",
        "Self-Reflection and Journaling",
        "Learning and Personal Growth",
        "Digital Detox",
        "Setting and Achieving Goals",
        "Spirituality and Inner Peace"
    ]

    var body: some View {
        NavigationView {
            ZStack{
                Color.black
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Text("MindCraft")
                        .font(Font.custom("Minecraft.tt", size: 48))
                        .fontWeight(.bold)
                        .padding(.bottom, 100)
                        .padding(.top,20)
                        .foregroundColor(.white)
                    Text("What do you want to improve about yourself?")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                        .foregroundColor(.white)
                    Text("Choose at least 3 categories?")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.bottom, 20)
                        .foregroundColor(.white)
                    
                    Spacer()

                    ScrollViewReader { scrollViewProxy in
                        ScrollView(.vertical, showsIndicators: true) {
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(categories, id: \.self) { category in
                                    Button(action: {
                                        if selectedCategories.contains(category) {
                                            selectedCategories.remove(category)
                                        } else {
                                            // Check if the user has already selected 10 categories
                                            if selectedCategories.count < 10 {
                                                selectedCategories.insert(category)
                                            }
                                        }
                                    }) {
                                    Text(category)
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 10)
                                        .background(selectedCategories.contains(category) ? Color.purple : Color.white)
                                        .foregroundColor(.black)
                                        .cornerRadius(20)
                                }
                                .padding(.bottom, 10)
                            }
                        }
                        .padding(.horizontal, 20)
                        .overlay(
                            // Add a custom scroll indicator
                            VStack {
                                GeometryReader { geometry in
                                    let offset = geometry.frame(in: .named("scroll")).minY
                                    let height = geometry.size.height
                                    let contentHeight = geometry.frame(in: .global).height
                                    let scrollPercentage = offset / (contentHeight - height)
                                    let scrollIndicatorHeight = height * height / contentHeight

                                    RoundedRectangle(cornerRadius: scrollIndicatorHeight / 2)
                                        .frame(width: 8, height: scrollIndicatorHeight)
                                        .foregroundColor(.gray)
                                        .opacity(scrollPercentage > 0 ? 1 : 0)
                                        .offset(y: scrollPercentage * (height - scrollIndicatorHeight))
                                        .gesture(
                                            DragGesture()
                                                .onChanged { value in
                                                    let scrollableHeight = contentHeight - height
                                                    let dragOffset = value.translation.height / height
                                                    let scrollOffset = scrollableHeight * dragOffset
                                                    scrollViewProxy.scrollTo(offset + scrollOffset)
                                                }
                                        )
                                }
                                .frame(width: 8)
                                .padding(.trailing, 6)
                                Spacer()
                            }
                            .frame(maxHeight: .infinity, alignment: .trailing)
                            .padding(.vertical, 10)
                            .padding(.trailing, 2)
                            .background(Color.black.opacity(0.6))
                            , alignment: .trailing
                        )
                        .coordinateSpace(name: "scroll") // Coordinate space for scroll indicator
                    }
                }

                    Spacer()

                    HStack {
                        Spacer()
                        NavigationLink(destination: NextView()) {
                            Text("Continue")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 200, height: 50)
                                .background(selectedCategories.count >= 3 ? Color.blue : Color.gray) // Use the count of selectedCategories for the condition
                                .cornerRadius(10)
                                .padding(.bottom, 20)
                        }
                        .disabled(selectedCategories.count < 3) // Disable the button if there are less than 3 selected categories
                        .opacity(selectedCategories.count < 3 ? 0.5 : 1) // Optionally reduce opacity when disabled
                        Spacer()
                    }
                    .disabled(selectedCategories.isEmpty)
                    .opacity(selectedCategories.isEmpty ? 0.5 : 1)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NextView: View {
    var body: some View {
        Text("Next View")
    }
}
