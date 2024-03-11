//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Hitesh Madaan on 04/03/24.
//

import SwiftUI

struct ContentView:View{
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State private var correctAns = Int.random(in: 0...2)
    
    @State private var gameAlert=false
    @State private var score=0
    @State private var scoreTitle=""
    
    func flagTapped(_ number:Int){
        
        if(number == correctAns){
            scoreTitle = "Congratulations"
            score += 1
        }
        else{
            scoreTitle="Missed"
        }
        
        gameAlert=true
        
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAns=Int.random(in: 0...2)
    }
    
    var body: some View{
        ZStack{
            LinearGradient(colors: [.yellow , .green], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
            VStack(spacing:30){
                VStack{
                    Text("Tap the Flag OFF")
                        .foregroundStyle(.white)
                        .font(.subheadline.weight(.heavy))
                    
                    Text(countries[correctAns])
                        .foregroundStyle(.white)
                        .font(.largeTitle.bold())
                }
                VStack(spacing : 30){
                    ForEach(0..<3){ numbers in
                        Button{
                            flagTapped(numbers)
                            
                        }label: {
                            Image(countries[numbers])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                        
                    }
                }
                Button("Restart",role: .destructive){
                    
                    score=0
                    
                }
            }
           
            
            
        }.alert(scoreTitle,isPresented: $gameAlert){
            Button("Continue",action: askQuestion)
            }message:{
                Text("Your score is \(score)")
            }
    }
}
    


//struct ContentView: View {
//    
//    @State private var messageAlert=false
//    
//    var body: some View {
//        // .leading and .trailing for left and right alignment of view
//        // Same with HStack
//        // Spacer() is like a spring take all the space and push other view to one corner
//        ZStack{
//            //Color.primary used for text to automaticaly convert from white to black when the darkmode is on
//            // Shift+command+A for switching between dark and light mode
//            Color(red:1.5,green:4.5,blue:0)
//                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
//                .ignoresSafeArea()
//                
//            Text("This is the Text below")
//                .foregroundStyle(.secondary)
//                .font(.largeTitle)
//                .padding(20)
//                .background(.ultraThinMaterial)
//               
//                
//                
//            
//        }
//        ZStack{
//            LinearGradient(colors: [.yellow,.white,.green], startPoint: .top, endPoint: .bottom )
//                .ignoresSafeArea()
//            
////            RadialGradient(colors: [.yellow, .green], center: .center, startRadius: 0, endRadius: 200)
//            
////            AngularGradient(colors: [.red, .yellow, .green , .blue , .red ], center: .center)
////                .ignoresSafeArea()
//            
////            Button{
////                print("Button clicked")
////            }label: {
////                Label("Edit", systemImage: "pencil")
////                    
////            }
//            
//            Button("Click here"){
//                messageAlert=true
//            }
//            .alert("Important message",isPresented: $messageAlert){
//                Button("Delete",role: .destructive){}
//                Button("Cancle",role: .cancel){}
//            }message: {
//                Text("follow the instructions")
//            }
//            
//            
//        }
//        
//    }
//    func del(){
//        print("This item is deleted..")
//    }
//
//}

#Preview {
    ContentView()
}
