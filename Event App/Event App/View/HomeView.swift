


import SwiftUI
import Kingfisher
import FirebaseAuth

struct HomeView : View {
    @State var searchKeyword:String = ""
    @State var categorySelected:Bool = false
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
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    HStack{
                        if let photoURL = Auth.auth().currentUser?.photoURL {
                            KFImage(photoURL)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .frame(width:45,height:45,alignment:.center)
                                .shadow(color:.black,radius: 5,x:5,y:5)
                        }
                        VStack(alignment: .leading) {
                            Text("Welcome Back")
                                .foregroundStyle(.white)
                                .font(.system(size:14))
                                .fontWeight(.medium)
                            Text("Patrick Swan")
                                .foregroundStyle(.white)
                                .font(.system(size:20))
                                .fontWeight(.bold)
                        }
                        Spacer()
                        Image(systemName: "bell.fill")
                            .foregroundStyle(.white)
                            .font(.system(size:25))
                    }.padding(.bottom, 40)
                }
            }// end of Toolbar
        }
        // end of NavigationStack
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}

