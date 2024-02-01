


import SwiftUI
import Kingfisher
import FirebaseAuth

struct HomeView : View {
    @State var searchKeyword:String = ""
    @State var categorySelected:Bool = false
    
    var body : some View {
        NavigationStack{
            ZStack{
                Image("backgroundImage")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading, spacing:10){
                    Spacer()
                        .frame(height: 15)
                    HStack(spacing:10){
                        if let photoURL = Auth.auth().currentUser?.photoURL {
                            KFImage(photoURL)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .frame(width:45,height:45,alignment:.center)
                                .shadow(color:.black,radius: 5,x:5,y:5)
                        }
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
                    
                    
                } //end ofVStack
               .padding(.vertical)
                
            }//end of ZStack
        }
        // end of NavigationStack
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}

