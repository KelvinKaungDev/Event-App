


import SwiftUI
import Kingfisher
import FirebaseAuth

struct HomeView : View {
    
    @State private var navPath: [String] = []
    @State var searchKeyword:String = ""
    @State var categorySelected:Bool = false
    @ObservedObject private var userViewModel = UserViewModel()
    @State private var storedUserId: String = ""
    @State private var homeViewUsername: String = ""
    
    @State var isLoading = false
    let columns = [
        GridItem(.adaptive(minimum: 165))
    ]
    
    @State var events: [Events]?
    
    @State private var searchTerm = ""
    @ObservedObject private var eventvm = EventViewModel()
    
    @State var currentEvent: Events?
    
    var filteredEvents: [Events] {
        guard !searchTerm.isEmpty else {return events ?? []}
        return events!.filter {$0.name.localizedCaseInsensitiveContains(searchTerm)}
    }
    var nonPendingEvents: [Events] {
        filteredEvents.filter { !$0.isPending }
    }

    
    
    init(){
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .black
    }
    
    var body : some View {
        NavigationStack(path: $navPath){
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
                    .zIndex(-2)

                }
                
                allEventsView
                    .zIndex(0)
                
                    
                                    
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
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                            
                            
                        }// end of VStack
                        .padding(.horizontal,4)
                        Spacer()
                    } .padding()
                }
                
            }



            .navigationDestination(for: String.self) { value in
                if let selectedEvent = events?.first(where: { $0.id == value }) {
                    EventDetailsView(event: .constant(selectedEvent), path: $navPath)
                }
                if value.starts(with: "registerEvent-") {
                        let eventId = value.replacingOccurrences(of: "registerEvent-", with: "")
                        if let selectedEvent = events?.first(where: { $0.id == eventId }) {
                            RegisterEventView(path: $navPath, event: selectedEvent)
                        }
                    }
                if value == "success"{
                    RegisteredSuccessView(path: $navPath)
                }
            }
            .navigationBarBackButtonHidden()

        }
        .onAppear(perform: {
            // Fetch event data
            isLoading = true
            fetchEventData()
        })
        .task {
            // Get user data
            if let userId = UserDefaults.standard.string(forKey: "UserID"){
                print("UserID in UserDefaults: \(userId)")
                storedUserId = userId
                userViewModel.fetchSingleUser(userId: userId) { result in
                    switch result {
                    case .success(let user):
//                        DispatchQueue.main.async {
                        self.homeViewUsername = user.username
//                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }else{
                print("No UserID found in UserDefaults.")
                storedUserId = ""
            }
        }
        

    }
}

extension HomeView{
    private var allEventsView: some View{
        ScrollView(.vertical,showsIndicators: false) {
            ZStack{
                if isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .tint(.white)
                        .padding()
                        .foregroundStyle(.white)
                } else{
                    LazyVGrid(columns: columns, spacing: 120) {
                        ForEach(nonPendingEvents.indices, id: \.self) { index in
//                            if event.isPending == false{
//                                eventCard(event: event)
//                            }
                            let event = nonPendingEvents[index]
                            eventCard(event: event)
                        }
                    }
                }
                
            }
            .padding(.bottom,70)
            .padding(.top,60)
            
        }
        .searchable(text: $searchTerm, placement: .navigationBarDrawer, prompt: "Search Events")

    }
    
    func fetchEventData(){
        eventvm.fetchEvents { result in
            isLoading = false
            switch result{
            case .success(let events):
                self.events = events
            case .failure(let error):
                print(error)
            }
        
        }
    }
    
    
}

extension HomeView{
    @ViewBuilder
    func eventCard(event: Events) -> some View{
        NavigationLink(value: event.id, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                    .shadow(color:.gray,radius: 5,x:5,y:5)
                VStack {
                    Image("swiftuihackathon")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 165, height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .offset(y:-20)
                    
                    // Text Overlay
                    
                    VStack(alignment:.leading,spacing:10){
                        Text("\(event.name)")
                            .font(.system(size:20))
                            .foregroundColor(.black)
                            .bold()
                            .lineLimit(3)
                            .offset(y:-10)
                        
                        Text("\(event.location)")
                            .font(.system(size:16))
                            .foregroundColor(.black)
                            .lineLimit(1)
                        
                        Text("\(K.dateformatter(date: K.stringToDate(from: event.date)))")
                            .font(.system(size:16))
                            .foregroundColor(.black)
                            .lineLimit(1)
                        
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.leading)
                    .padding()
                }
            } // end of ZStack
            .frame(width: 165, height: 200)
        })

        
        
    }
}

#Preview {
    HomeView()
}

