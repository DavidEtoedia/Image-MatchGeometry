//
//  firstView.swift
//  Image-Geometry
//
//  Created by Inyene Etoedia on 21/12/2022.
//

import SwiftUI

struct firstView: View {
    var nameSpace : Namespace.ID
    @Binding var showDetails : Bool
    @Binding var show : Bool
    var body: some View {
        VStack{
            
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
        }
    }
}

struct firstView_Previews: PreviewProvider {
    @Namespace static var nameSpace
    static var previews: some View {
        firstView(nameSpace: nameSpace, showDetails: .constant(true), show: .constant(true))
    }
}
