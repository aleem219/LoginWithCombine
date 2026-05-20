//
// TabbarView.swift
// SwiftLoginUI //
// Created by Abdul Aleem on 04/04/26.
//

import SwiftUI

struct TabbarView: View {
    
    @Environment(LoginViewModel.self) private var vm
    @State private var selectedTab: TabItem = .home
    @State private var userViewModel = UserViewModel()
    @State private var path: [User] = []
    @State private var notificationViewModel = NotificationViewModel()
    
    
    var body: some View {
        
        
        @Bindable var vm = vm
        
        NavigationStack {
            ZStack(alignment: .bottom) {
                Color.theme.loginButton
                    .opacity(0.3)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    switch selectedTab {
                    case .home:
                        HomeView()
                    case .cart:
                        CartView()
                    case .favourite:
                        Text("Favorites")
                            .font(.largeTitle)
                    case .user:
                        UserView()
                            .environment(userViewModel)
                    }
                    Spacer()
                }
                .safeAreaInset(edge: .bottom) {
                    Color.clear.frame(height: 50)
                }
                
                CustomTabBar(selectedTab: $selectedTab)
                    .background(Color.theme.backGround)
            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    NavigationLink(destination: NotificationView()
//                        .environment(notificationViewModel) ) {
//                        Image(systemName: "bell.badge.circle")
//                            .font(.headline)
//                            .tint(Color.theme.loginButton.opacity(0.6))
//                    }
//                }
//            }
        }
    }
}

#Preview {
    TabbarView()
        .environment(LoginViewModel())
}
