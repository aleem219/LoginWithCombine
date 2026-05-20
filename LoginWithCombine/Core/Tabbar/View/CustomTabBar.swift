//
//  CustomTabBar.swift
//  SwiftLoginUI
//
//  Created by Abdul Aleem on 04/04/26.
//

import SwiftUI

// MARK: - Tab Enum
enum TabItem: String, CaseIterable {
    case home
    case cart
    case favourite
    case user
    
    var icon: String {
        switch self {
        case .home: return "house"
        case .cart: return "cart.fill"
        case .favourite: return "heart"
        case .user: return "person.crop.circle"
        }
    }
    
    var label: String {
        switch self {
        case .home: return "Home"
        case .cart: return "Cart"
        case .favourite: return "Favourite"
        case .user: return "User"
        }
    }
}

// MARK: - Custom Tab Bar
struct CustomTabBar: View {
    
    @Binding var selectedTab: TabItem
    
    var body: some View {
        HStack {
            ForEach(TabItem.allCases, id: \.self) { tab in
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedTab = tab
                    }
                } label: {
                    ZStack {
                        if selectedTab == tab {
                            Capsule()
                                .fill(Color.theme.loginButton.opacity(0.2))
                                .frame(width: 70, height: 45)
                        }
                        
                        VStack(spacing: 3) {
                            Image(systemName: tab.icon)
                                .font(.title3)
                            Text(tab.label)
                                .font(.caption2)
                        }
                        .foregroundColor(
                            selectedTab == tab ? Color.theme.loginButton : .gray
                        )
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
        .frame(height: 55)
        .background(Color.theme.backGround)
        .overlay(
            Rectangle()
                .frame(height: 0.5)
                .foregroundColor(.gray.opacity(0.3)),
            alignment: .top
        )
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(.home))
}
