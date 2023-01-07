//
//  SecondView.swift
//  Image-Geometry
//
//  Created by Inyene Etoedia on 21/12/2022.
//

import SwiftUI

struct SecondView: View {
    var nameSpace : Namespace.ID
    @Binding var show : Bool
    @Binding var showDetails : Bool
    @Binding var showListItems : Bool
    var body: some View {
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
            
//                    LazyVGrid(columns: column) {
//                        ForEach(0..<4) { val in
//                            Rectangle()
//                                .cornerRadius(10)
//
//    //                            .fill(.ultraThinMaterial)
//                                .foregroundColor(.red)
//                                .frame(width: 150, height: 100)
//                                .opacity(showListItems ? 1 : 0)
//                                .scaleEffect(showListItems ? 0.93 : 0.0)
//                                .animation(Animation.spring(response: 0.5, dampingFraction: 0.55).delay(animationDelay * Double(val)), value: showListItems)
//
//                                .onAppear{
//                                    self.showListItems = true
//                                  }
//
//                                }
//
//                        }
            }

        }
    }


struct SecondView_Previews: PreviewProvider {
    @Namespace static var nameSpace
    static var previews: some View {
        SecondView(nameSpace: nameSpace, show: .constant(true), showDetails:.constant(true), showListItems: .constant(true))
    }
}
