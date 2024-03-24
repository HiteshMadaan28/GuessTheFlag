//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Hitesh Madaan on 04/03/24.
//

import SwiftUI

struct TitleModifier: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
            
    }
}

extension View{
    func titleM()-> some View{
        modifier(TitleModifier())
    }
}

struct FlagImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(radius: 5)
            .clipShape(.rect(cornerRadius: 15))
    }
}

extension View{
    func flagImage()-> some View{
        modifier(FlagImage())
    }
    
}



struct ContentView:View{
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State private var correctAns = Int.random(in: 0...2)
    
    @State private var gameAlert=false
    @State private var gameFinished=false
    @State private var score=0
    @State private var scoreTitle=""
    @State private var totalQuestion=0
    
    func re(){
        score=0
        totalQuestion=0
    }
    func flagTapped(_ number:Int){
        
        if(number == correctAns){
            
            score += 1
            totalQuestion += 1
            if(totalQuestion==8){
                gameFinished=true
            }
            scoreTitle = "Congratulations"
        }
        else{
            
            totalQuestion += 1
            if(totalQuestion==8){
                gameFinished=true
                
            }
            scoreTitle="Wrong! That’s the flag of \(countries[correctAns])"
            
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
            VStack{
                
                Spacer()
                
                Text("Guess The Flag")
                    .titleM()
//                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
//                    .foregroundColor(.white)
                
                VStack(spacing:15){
                    VStack{
                        Text("Tap the Flag OFF")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAns])
                            .font(.largeTitle.bold())
                    }
                    VStack(spacing : 30){
                        ForEach(0..<3){ numbers in
                            Button{
                                flagTapped(numbers)
                                
                            }label: {
                                Image(countries[numbers]).flagImage()
//                                    .shadow(radius: 5)
//                                    .clipShape(.rect(cornerRadius: 15))
                                
                                
                            }
                            
                        }
                    }
                    
                    Text("\(totalQuestion) / 8")
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Result : \(score)")
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                    
                    
                    
                    
                
                Spacer()
            }.padding()
           
            
            
        }
        .alert(scoreTitle,isPresented: $gameAlert){
            Button("Continue",action: askQuestion)
            }message:{
                Text("Your score is \(score)")
            }
         .alert("The Game is Finished",isPresented: $gameFinished){
                
                Button("Restart",action: re)
               
                }message:{
                    Text("Final Score \(score)")
                    
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
