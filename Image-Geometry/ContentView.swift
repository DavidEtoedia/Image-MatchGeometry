//
//  ContentView.swift
//  Image-Geometry
//
//  Created by Inyene Etoedia on 09/12/2022.
//

import SwiftUI

struct ContentView: View {
    @Namespace var nameSpace
    @State var show = false
    @State var showDetails = false
    @State var showListItems = false
    @State var animationDelay = 0.2
    
    var column : [GridItem] = [
        GridItem(.fixed(50), spacing: 100),
        GridItem(.fixed(50), spacing: 100),
    ]
    var body: some View {
        ZStack {
            if !show {
                
                     Text("It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.")
                         .font(.footnote.uppercaseSmallCaps())
                         .foregroundColor(.black)
                         .opacity(showDetails ? 0.7 : 0.0)
                         .scaleEffect(showDetails ? 0.93 : 0.0)
                         .matchedGeometryEffect(id: "detailText", in: nameSpace)
                         
                VStack(alignment: .leading,spacing: 5) {
                    Spacer()
                    Text("Hello, world!")
                        .font(.system(size: 30, weight: .bold))
                        .matchedGeometryEffect(id: "hello", in: nameSpace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Hello, This is how we roll!")
                        .font(.footnote.uppercaseSmallCaps())
                        .matchedGeometryEffect(id: "subtitle", in: nameSpace)
                 
                    Text("It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.")
                        .font(.footnote.uppercaseSmallCaps())
                        .matchedGeometryEffect(id: "text", in: nameSpace)
                        .padding(.vertical, 5)
                     
                }
                .frame(width: 300, height: 150)
                .padding(20)
                .background(
                     Image("background-1")
                    .resizable()
//                   .scaledToFill()
                        .aspectRatio(2,contentMode: .fill)
                    .matchedGeometryEffect(id: "bg", in: nameSpace))
                .mask({
                RoundedRectangle(cornerRadius: 20 , style: .continuous)
                .matchedGeometryEffect(id: "corner", in: nameSpace)
           
                            
                })
                  .shadow(color: .black.opacity(0.0), radius: 10, x: 5, y: 5)
                  .padding(0)
                  .onTapGesture {
                      withAnimation (.spring(response: 0.6, dampingFraction: 0.8)){
                          show.toggle()
                          self.showDetails = false
                      }
                  }

            } else {
                ScrollView {
                   
                       VStack (alignment: .leading,spacing: 12){
                           Spacer()
                        Text("Hello, This is how we roll!")
                            .font(.footnote.uppercaseSmallCaps())
                            .matchedGeometryEffect(id: "subtitle", in: nameSpace)
                        Text("Hello, world!")
                            .font(.system(size: 30, weight: .bold))
                            .matchedGeometryEffect(id: "hello", in: nameSpace)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.")
                            .font(.footnote.uppercaseSmallCaps())
                            .matchedGeometryEffect(id: "text", in: nameSpace)
                            .padding(.vertical, 5)
                    }
                    .frame(maxWidth:.infinity)
                    .frame(height: 350)
                    .padding(20)
                    .background(
                        Image("background-1")
                        .resizable()
                        .aspectRatio(2,contentMode: .fill)
                        .matchedGeometryEffect(id: "bg", in: nameSpace))
                        .mask({
                              RoundedRectangle(cornerRadius: 20 , style: .continuous)
                                  .matchedGeometryEffect(id: "corner", in: nameSpace)
                    })
                        .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 5)
                        .onTapGesture {
                            withAnimation (.spring(response: 0.6, dampingFraction: 0.8)){
                                self.showDetails = false
                                self.showListItems = false
                                show.toggle()
                              
                            }
                        }
//                        .padding(20)
                   
                   
                        Text("It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.")
                        
                            .font(.footnote.uppercaseSmallCaps())
                            .foregroundColor(.black)
                            .opacity(showDetails ? 0.7 : 0.0)
                            .scaleEffect(showDetails ? 0.93 : 0.0)
                            .matchedGeometryEffect(id: "detailText", in: nameSpace)
                            .padding(.vertical, 20)
                            .onAppear{
                                withAnimation (.spring(response: 0.8, dampingFraction: 0.7).delay(0.1)){
                                    self.showDetails = true
                                }
                            }
                    
                    LazyVGrid(columns: column) {
                        ForEach(0..<4) { val in
                            Rectangle()
                                .cornerRadius(10)

    //                            .fill(.ultraThinMaterial)
                                .foregroundColor(.red)
                                .frame(width: 150, height: 100)
                                .opacity(showListItems ? 1 : 0)
                                .scaleEffect(showListItems ? 0.93 : 0.0)
                                .animation(Animation.spring(response: 0.5, dampingFraction: 0.55).delay(animationDelay * Double(val)), value: showListItems)

                                .onAppear{
                                    self.showListItems = true
    //                                withAnimation (.spring(response: 0.5, dampingFraction: 0.4).delay(0.1)){
    //
    //                                }

                                }

                        }
                    }

                }
                .ignoresSafeArea()
                
            }
            
         
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
