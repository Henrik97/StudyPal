//
//  CardView.swift
//  StudyPal
//
//  Created by Henrik Woodgates on 16/03/2023.
//

import SwiftUI

struct CardView: View {
    var person: String
    @State private var offset = CGSize.zero
    @State private var color: Color = .blue
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .frame(width: 320, height: 500)
                    .border(.white, width: 6.0)
                    .cornerRadius(4)
                    .foregroundColor(color.opacity(0.9))
                    .shadow(radius: 4)
                
                HStack{
                    Text(person)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                    Image(systemName: "book.fill")
                        .foregroundColor(.white)
                }
            }
            .offset(x:offset.width, y:offset.height * 0.4)
            .rotationEffect(.degrees(Double(offset.width / 40)))
            .gesture(
                DragGesture()
                    .onChanged{ gesture in
                        offset = gesture.translation
                        withAnimation{
                            changeColor(width: offset.width)
                        }
                    } .onEnded { _ in
                        withAnimation{
                            swipeCard(width: offset.width)
                            changeColor(width: offset.width)
                        }
                    })
            
            HStack(spacing:100){
                Button(action:{swipeCard(width: -500)}){
                    Image(systemName: "x.circle")
                    
                
                    
                    
                }
                .foregroundColor(.white)
                .buttonStyle(.bordered)
                .background(.red)
                .cornerRadius(10)
                .controlSize(.large)
                
                Button(action:{swipeCard(width: 500)}){
                    Image(systemName: "book.fill")
                        .background(.green)
                    
                    
                    
                }
                .foregroundColor(.white)
                .buttonStyle(.bordered)
                .background(.green)
                .cornerRadius(10)
                .controlSize(.large)
            
            }
        }
    }
    func swipeCard(width: CGFloat){
        switch width {
        case -500...(-150):
            print("\(person) removed")
            offset = CGSize(width: -500, height: 0)
            
        case 150...500:
            print("\(person) added")
            offset = CGSize(width: 500, height: 0)
            
        default:
            offset = .zero
        }
        
    }
    func changeColor(width: CGFloat){
        switch width {
        case -500...(-150):
            color = .red
            
        case 150...500:
            color = .green
            
        default:
            color = .blue
            
        }
    }
}
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(person: "Thomas")
    }
}
