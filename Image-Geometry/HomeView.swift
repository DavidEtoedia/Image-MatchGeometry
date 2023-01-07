//
//  HomeView.swift
//  Image-Geometry
//
//  Created by Inyene Etoedia on 20/12/2022.
//

import SwiftUI

struct HomeView: View {
    @Namespace var nameSpace
    @State var show = false
    @State var showDetails = false
    @State var animateView = false
    @State var animateContent = false
    @State var showListItems = false
    @State var currentItem : ImageModel?
    @State private var offset = CGSize.zero
    @State private var imageSize = CGSize.zero
    @State private var heightVal : Double = 0.0
    @State private var scrollOffset: CGFloat = 0
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            VStack(spacing: 30) {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("Image Geometry")
                            .font(.largeTitle)
                        Text("ImageView")
                            .font(.callout)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                    Button {
                    } label: {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 40))
                    }
                }
                .opacity(!showDetails ? 1 : 0.0)
                .padding(.horizontal)
                
                ForEach(todayImage) { val in
                    Button {
                        withAnimation(.interactiveSpring(response: 0.6,dampingFraction: 0.7,blendDuration: 0.5)){
                            currentItem = val
                            showDetails = true
                        }
                        
                    } label: {
                        CardView(todayImage: val)
                            .scaleEffect(currentItem?.id == val.id && showDetails ? 1 : 0.94)
                    }
//                    .buttonStyle(ScaleButtonStyle())
                    .opacity(showDetails ? (currentItem?.id == val.id ? 1 : 0) : 1)
                }
            }
        
        }
        .overlay{
            if let currentItem = currentItem{
                DetailView(todayImage: currentItem)
                    .ignoresSafeArea()
                   
            }
        }
        .background (alignment: .top){
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.black.opacity(0.8))
                .frame(height: animateView ? nil : 350, alignment: .top)
                .opacity(animateView ? 1 : 0.0)
                .animation(.spring(), value: animateView)
                .ignoresSafeArea()
        }
    }
    
    // MARK: CardView
    @ViewBuilder
    func CardView(todayImage : ImageModel) -> some View{
        VStack{
            ZStack(alignment : .bottomLeading){
                GeometryReader{ proxy in
                    let size = proxy.size
                    Image(todayImage.pictures)
                        .resizable()
//                        .aspectRatio(1, contentMode: .fill)
                        .scaledToFill()
                        .frame(width: size.width, height: size.height)
                        .overlay(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.2), .black.opacity(0.5)]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(20)
                }
                .frame(height: 200)
                .matchedGeometryEffect(id: todayImage.pictures, in: nameSpace)
                VStack(alignment: .leading, spacing: 5){
                    Text(todayImage.name)
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.white)
                    Text(todayImage.subTitle)
                        .font(.system(size: 20, weight: .light))
                        .foregroundColor(.white)
                }
                .matchedGeometryEffect(id: todayImage.name, in: nameSpace)
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
              
            }
        }
        .matchedGeometryEffect(id: todayImage.id, in: nameSpace)
    }
    
    // MARK: Detailview
    @ViewBuilder
    func DetailView (todayImage : ImageModel) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                ZStack(alignment : .bottomLeading){
                    GeometryReader{ proxy in
                        let size = proxy.size
                            Image(todayImage.pictures)
                                .resizable()
                                .scaledToFill()
//                                .aspectRatio(1, contentMode: .fill)
                                .frame(width: size.width, height: size.height)
                                .overlay(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.2), .black.opacity(0.6)]), startPoint: .top, endPoint: .bottom))
                                .cornerRadius(20)
                    }
                    .shadow(color: .black.opacity((offset.height > 10 || offset.height < 0) ?  0 : 0.8), radius: 20)
                    .frame(height: (offset.height > 10 || offset.height < 0) ?  200 : 300)
                    .matchedGeometryEffect(id: todayImage.pictures, in: nameSpace)
                    .padding(.horizontal, (offset.height > 10 || offset.height < 0) ?  10 : 0)
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text(todayImage.name)
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(.white)
                        Text(todayImage.subTitle)
                            .font(.system(size: 20, weight: .light))
                            .foregroundColor(.white)
                    }
                    .matchedGeometryEffect(id: todayImage.name, in: nameSpace)
                    .padding(.horizontal, (offset.height > 10 || offset.height < 0) ?  30 : 20)
                    .padding(.vertical, (offset.height > 10 || offset.height < 0) ?  30 : 20)
                }    .matchedGeometryEffect(id: todayImage.id, in: nameSpace)
                    .offset(offset)
                    .gesture(
                     DragGesture(minimumDistance: 0, coordinateSpace: .global)
                        .onChanged{ Drag in
                          
                            offset = Drag.translation
                        
                            print(offset.height)
                            print("Drag Location \(Drag.startLocation.y)")
        //                    switch offset.height {
        //                    case 10..<200:
        //                       animateView = false
        //                        showDetails = false
        //                    default:
        //                        print("You did great!\(offset.height)")
        //                    }
                            
                            if (offset.height > 0 ) || (offset.height < 0) {
                                print(offset.height)
                                animateView = false
                                 showDetails = false
                                animateContent = false
                            }
                        }
                        .onEnded({ value in
                            withAnimation(.spring(response: 0.6,dampingFraction: 0.7)){
                                if(offset.height == 0.0){
                                    return
                                } else{
                                offset = .zero
                                animateView = false
                                currentItem = nil
                                showDetails = false
                                    animateContent = false
                                }
                            }
                        })
                    )
                VStack{
                    Text(dummyText)
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .opacity(animateContent ?  1 : 0.0)
                        .padding(.bottom, 30)
                        .scaleEffect(animateContent ? 1 : 0.94, anchor: .top)
                }
                .padding()
                .offset(y: scrollOffset > 0 ? scrollOffset : 0)
            }
            .offset(y: scrollOffset > 0 ? -scrollOffset : 0)
            .offset(offset: $scrollOffset)
        }
        .coordinateSpace(name: "SCROLL")
        .onAppear{
            withAnimation(.interactiveSpring(response: 0.6,dampingFraction: 0.6,blendDuration: 0.7)){
                animateView = true
            }
            withAnimation(.interactiveSpring(response: 0.6,dampingFraction: 0.6,blendDuration: 0.7).delay(0.08)){
                animateContent = true
            }
        }
        .transition(.identity)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

// MARK : ScaledButtonStyle
struct ScaleButtonStyle : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.80 : 1)
            .animation(.easeInOut, value: configuration.isPressed)
    }
}

extension View{
    func safeArea ()-> UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return .zero
        }
        return safeArea
    }
    
    // MARK : ScrollView Offset
    func offset(offset: Binding<CGFloat>)->some View {
        return self
            .overlay {
                GeometryReader { proxy in
                    let minY = proxy.frame(in: .named("SCROLLED")).minY
                    
                    Color.clear
                        .preference(key: OffsetKey.self, value: minY )
                }
                .onPreferenceChange(OffsetKey.self) { value in
                    offset.wrappedValue = value
                }
            }
    }
}

// MARK : OFFSET KEY

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0.0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }

}





