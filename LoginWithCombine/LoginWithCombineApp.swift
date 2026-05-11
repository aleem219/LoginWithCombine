//
//  LoginWithCombineApp.swift
//  SwiftLoginUI
//
//  Created by Abdul Aleem on 02/04/26.
//

import SwiftUI



@main
struct LoginWithCombineApp: App {
    @State private var vm = LoginViewModel()
    @State private var userViewModel = UserViewModel()
    @State private var userDetailViewModel = UserDetailViewModel()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if vm.isLoggedIn {
                    NavigationStack {
                        TabbarView()
                    }
                    .environment(userViewModel)
                    .environment(userDetailViewModel)
                } else {
                    NavigationStack {
                        LoginView()
                    }
                }
            }
            .environment(vm)
        }
    }
}
