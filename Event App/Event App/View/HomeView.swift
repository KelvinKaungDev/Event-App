


import SwiftUI
import Kingfisher
import FirebaseAuth

struct HomeView : View {
    
    @State var searchKeyword:String = ""
    @State var categorySelected:Bool = false
    @ObservedObject private var userViewModel = UserViewModel()
    @State private var storedUserId: String = ""
    @State private var homeViewUsername: String = ""
    init(){
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .black
    }
    
    var body : some View {
        NavigationStack{
            ZStack{
                GeometryReader{ geometry in
                    Path { path in
                        //Top left
                        path.move(to: CGPoint(x: 0, y: 0))
                        path.addLine(to: CGPoint(x: 0, y: 340))
                        path.addLine(to: CGPoint(x: geometry.size.width, y: 340))
                        path.addLine(to: CGPoint(x: geometry.size.width, y: 0))
                        path.addLine(to: CGPoint(x: 0, y: 0))
                    }
                    .fill(
                        LinearGradient(
                            colors: [Color("red_primary"),
                                     Color("red_secondary"),
                                     Color("red_secondary")],
                            startPoint: .top,
                            endPoint: .bottom)
                    )
                    .edgesIgnoringSafeArea(.top)
                }
                AllEventsViews()
                                    
            }//end of ZStack
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    HStack{
                        if let photoURL = Auth.auth().currentUser?.photoURL {
                            KFImage(photoURL)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                                .cornerRadius(20)
                                .padding([.bottom, .trailing], 4)
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
                }
                
            }
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
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    HomeView()
}

