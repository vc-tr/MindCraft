import SwiftUI

struct FireStreakCounter: View {
    var count: Int
    
    var body: some View {
        ZStack {
            Image(systemName: "flame.fill")
                .foregroundColor(.red)
                .font(.system(size: 24)) // Adjust size as needed
            
            Text("\(count)")
                .foregroundColor(.white)
                .font(.headline)
                .offset(x: 18, y: -10)
        }
    }
}


struct MenuBoardView: View {
    var missions: [String]
    var username: String
    var exp: Int
    var level: Int

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Button(action: {
                            // Handle click for the globe icon
                        }) {
                            Image(systemName: "globe")
                                .foregroundColor(.white)
                                .font(.title)
                        }
                        .padding(.leading, 20) // Adjust the padding as needed
                        
                        Spacer()

                        Button(action: {
                            // Handle click for the magnifying glass
                        }) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                                .font(.title)
                        }
                    }
                    .padding(.top, 10)
 
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Username: \(username)")
                            .foregroundColor(.white)
                            .font(Font.custom("Minecraft", size: 24)) // Increase font size
                            .fontWeight(.bold)
                        Text("Lvl: \(level)")
                            .foregroundColor(.white)
                            .padding(.top, 20)

                        Text("Exp: \(exp)")
                            .foregroundColor(.white)
                    }
                    .padding(.top, 10)
                    
                    Spacer()


                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack{
                                Text("Mission Board")
                                    .font(.title)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                FireStreakCounter(count: 5) // Replace '5' with your actual streak count

                            }

                            Spacer()

                            ForEach(0..<missions.count, id: \.self) { index in
                                Button(action: {
                                    // Handle button click for the mission
                                }) {
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text(missions[index])
                                            .foregroundColor(.white)
                                            .font(.headline)
                                        Text("Sample Explanation for Mission \(index + 1)")
                                            .foregroundColor(.white)
                                            .font(.subheadline)
                                    }
                                    .padding(10)
                                    .background(Color.clear)
                                    .cornerRadius(10)
                                }

                                if index != missions.count - 1 {
                                    Divider()
                                        .background(Color.white.opacity(0.2))
                                        .padding(.horizontal, 10)
                                }
                            }
                        }
                        .padding()
                        .background(Color.gray.opacity(0.3)) // Gray background for the whole VStack
                        .cornerRadius(20)
                    }


                    Spacer()

                    HStack {
                        Spacer()
                        
                        Button(action: {
                            // Handle click for the bell icon
                        }) {
                            Image(systemName: "bell")
                                .foregroundColor(.white)
                                .font(.title)
                        }
                    }
                }
                .padding(.leading, 20)
            }
        }
    }
}

struct MenuBoardView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBoardView(missions: ["Mission 1", "Mission 2", "Mission 3"],
                      username: "Player123",
                      exp: 1500,
                      level: 25)
    }
}
