


import SwiftUI
import Kingfisher
import FirebaseAuth

struct HomeView : View {
    
    @State var searchKeyword:String = ""
    @State var categorySelected:Bool = false
    @ObservedObject private var userViewModel = UserViewModel()
    @State private var storedUserId: String = ""
    @State private var homeViewUsername: String = ""
    
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
                            Text("\(homeViewUsername)")
                                .foregroundStyle(.white)
                                .font(.system(size: 20))
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
        .onAppear(perform: {
            if let userId = UserDefaults.standard.string(forKey: "UserID"){
                print("UserID in UserDefaults: \(userId)")
                storedUserId = userId
                userViewModel.fetchSingleUser(userId: userId) { result in
                    switch result {
                    case .success(let user):
                        DispatchQueue.main.async {
                            self.homeViewUsername = user.username
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
            }else{
                print("No UserID found in UserDefaults.")
                storedUserId = ""
            }
        })
        // end of NavigationStack
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}

