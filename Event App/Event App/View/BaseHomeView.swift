


import SwiftUI

struct BaseHomeView : View {
    @State var searchKeyword:String = ""
    @State var categorySelected:Bool = false
    
    var body : some View {
        NavigationStack{
                ZStack{
                    Image("backgroundImage")
                        .edgesIgnoringSafeArea(.top)
                        .overlay(
                            VStack(alignment: .leading, spacing:10){
                                Spacer()
                                    .frame(height: 15)
                                HStack(spacing:10){
                                    Image("profilePic")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(Circle())
                                        .frame(width:45,height:45,alignment:.center)
                                        .shadow(color:.black,radius: 5,x:5,y:5)
                                    VStack(alignment:.leading){
                                        Text("Welcome Back")
                                            .foregroundStyle(.white)
                                            .font(.system(size:14))
                                            .fontWeight(.medium)
                                        Text("Patrick Swan")
                                            .foregroundStyle(.white)
                                            .font(.system(size:20))
                                            .fontWeight(.bold)
                                        
                                    }// end of VStack
                                    .padding(.horizontal,4)
                                    Spacer()
                                    Image(systemName: "bell.fill")
                                        .foregroundStyle(.white)
                                        .font(.system(size:25))
                                    
                                } .padding()
                                SearchBarItemView(searchKeyword: $searchKeyword)
                                    .padding(.vertical)
                                
                                AllCategoryView()
                                
                                Text("Upcoming Events")
                                    .font(.system(size:30))
                                    .fontWeight(.bold)
                                    .padding(.horizontal)
                                    .foregroundStyle(.white)
                                Spacer()
                                
                                AllEventsViews()
                                
                            }
                            .padding(.vertical)
                        )
                    
                }
                .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        
        
    }
}

#Preview {
    HomeView()
}

