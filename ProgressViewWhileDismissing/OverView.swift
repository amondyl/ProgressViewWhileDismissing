//
//  OverView.swift
//  ProgressViewWhileDismissing
//
//  Created by Klaus Menning on 12.02.23.
//

import SwiftUI

struct SingerOverView: View {
    @EnvironmentObject var myStates: MyStates
    var body: some View {
        ZStack{
            NavigationView {
                List(getSingerIdentifiable()) { singerId in
                        NavigationLink(destination: AlbumOverView(albumIds: getAlbumIdentifiable (singer: singerId.name)))
                        {Text(singerId.name)}.isDetailLink(false).navigationBarTitle(Text("Singer"), displayMode: .inline)

                }.navigationBarItems(trailing: HomeButtonView() ) //end List
            }.navigationViewStyle(StackNavigationViewStyle()).onAppear(){
                myStates.inProgress = false
            }
            CustomProgressView(color: .red).padding(.bottom,50).isHidden(!myStates.inProgress)
        }
   
    }
}

struct AlbumOverView: View {
    @EnvironmentObject var myStates: MyStates
    var albumIds: [AlbumIdentifiable]
    var body: some View {
        ZStack{
            VStack{
                ForEach(albumIds) { id in
                    /*@START_MENU_TOKEN@*/Text(id.title)/*@END_MENU_TOKEN@*/
                    Divider()
                }
            }
            CustomProgressView(color: .red).padding(.bottom,50).isHidden(!myStates.inProgress)
        }.navigationBarItems(trailing: HomeButtonView() ) //end List
            .onAppear(){
                myStates.inProgress = false
            }
    }
}
struct CustomProgressView: View {
    var color: Color = .blue
    var scaleSize: CGFloat = 1.0
    
    var body: some View {
        ProgressView("Processing")
            .scaleEffect(scaleSize, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: color))
    }
}

struct OverView_Previews: PreviewProvider {
    static var previews: some View {
        SingerOverView()
    }
}
