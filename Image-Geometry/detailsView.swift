//
//  detailsView.swift
//  Image-Geometry
//
//  Created by Inyene Etoedia on 15/12/2022.
//

import SwiftUI

struct detailsView: View {
    @State var show : Bool = false
    @State var rotation = 0.0
    @State var opacity : Bool = false
    @State var opacityVal : Double = 0.0
    @State private var isMatched = false
    @State var scaleVal : Double = 0.0
    @State var scaleBool : Bool = false
    @State var offset = CGSize.zero
    @Namespace var nameSpace
    var data = ["One", "Two", "Three", "Four"]
       @State var showListItems = false
       @State var animationDelay = 0.5
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack (spacing: 30){
    //            Toggle("Show List Items", isOn: $showListItems)
                
                   Rectangle()
                    .foregroundColor(offset.height > 10 ? .blue : . red)
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                    .offset(offset)
                    .gesture(
                        DragGesture()
                            .onChanged({ val in
                                offset = val.translation
                            })
                            .onEnded({ newVal in
                                offset = .zero
                            })
                    )
                

    //            List {
    //
    //                ForEach(data.indices, id: \.self) { index in
    //
    //                    Button(action: {
    //                        // navigation action
    //                    }, label: {
    //                        Text(data[index])
    //                    })
    //                        .opacity(showListItems ? 1 : 0)
    //                        .animation(Animation.easeOut(duration: 0.6).delay(animationDelay * Double(index)), value: showListItems)
    //
    //                } //: ForEach
    //
    //            }
    //            Button {
    //                withAnimation (.spring(response: 0.6, dampingFraction: 0.8)){
    //                    opacity.toggle()
    //                }
    //
    //            } label: {
    //                Text("Test Button")
    //            }

    //            Text("This is my view with Animation")
    //                .opacity(opacity ? 0.8 : 0.0)
    //                .scaleEffect(opacity ? 0.93 : 0.0, anchor: .top)
    //                .animation(Animation.easeIn(duration: 0.5).delay(0.5), value: opacity)
    //            VStack{
    //                Button(action: {
    //                    withAnimation(.spring(response: 0.6, dampingFraction: 0.4)) {
    //                        self.isMatched.toggle()
    //                                 scaleVal = 0.0
    ////                                 opacity.toggle()
    //                        self.scaleBool = false
    //
    //                             }
    //                         }) {
    //                             Text("Toggle Match Geometry")
    ////                                 .offset(y: isMatched ? 0.5 : 0.0)
    //                         }
    //                         .offset(x: 0, y: isMatched ?  -25 : 0.0)
    //                      Text("David Matched")
    //                      .opacity(isMatched ? 0.8 : 0.0)
    //                      .scaleEffect(isMatched ? 0.93 : 0.0, anchor: .top)
    //
    //            }
                
    //            if !show{
    //                Text("It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.")
    //                    .font(.footnote.uppercaseSmallCaps())
    //                    .foregroundColor(.black)
    //                    .opacity(!show ? 0.7 : 0.0)
    //                    .animation(Animation.easeIn(duration: 4).delay(0), value: show)
    //                    .onTapGesture{
    //                        withAnimation (.spring(response: 0.6, dampingFraction: 0.8)){
    //                            show.toggle()
    //                            opacity.toggle()
    //                        }
    //                }
    //            } else{
    //                Text("It has survived not only five centuries, but also the leap into .")
    //                    .font(.footnote.uppercaseSmallCaps())
    //                    .foregroundColor(.black)
    //                    .opacity(opacity ? 0.7 : 0.0)
    //                    .animation(Animation.easeIn(duration: 3).delay(1), value: opacity)
    //                    .onTapGesture{
    //                        withAnimation (.spring(response: 0.6, dampingFraction: 0.8)){
    //                            show.toggle()
    //                            opacity.toggle()
    //                        }
    //                }
    //            }
    //
            }
//            .frame(maxWidth: .infinity)
            
        }
    }
}

struct detailsView_Previews: PreviewProvider {
    static var previews: some View {
        detailsView()
    }
}
