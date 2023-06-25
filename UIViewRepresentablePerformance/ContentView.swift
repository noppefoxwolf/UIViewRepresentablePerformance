//
//  ContentView.swift
//  UIViewRepresentablePerformance
//
//  Created by noppe on 2023/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            UIKitView1()
            UIKitView2()
            UIKitView3()
            UIKitView4()
            UIKitView5()
        }
    }
}

struct UIKitView1: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        UIView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        print("[UIKitView1] \(#function) once")
    }
}

struct UIKitView2: UIViewRepresentable {
    
    @Environment(\.openURL)
    var openURL
    
    func makeUIView(context: Context) -> some UIView {
        UIView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        print("[UIKitView2] \(#function) more")
    }
}

private struct ExtraActionKey: EnvironmentKey {
    static let defaultValue: () -> Void = {}
}

extension EnvironmentValues {
    var extraAction: () -> Void {
        get { self[ExtraActionKey.self] }
        set { self[ExtraActionKey.self] = newValue }
    }
}

struct UIKitView3: UIViewRepresentable {
    @Environment(\.extraAction)
    var extraActiob
    
    func makeUIView(context: Context) -> some UIView {
        UIView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        print("[UIKitView3] \(#function) more")
    }
}

class WorkaroundExtraAction {
    let action: () -> Void = {}
}

private struct WorkaroundExtraActionKey: EnvironmentKey {
    static let defaultValue: WorkaroundExtraAction = .init()
}

extension EnvironmentValues {
    var workaroundExtraAction: WorkaroundExtraAction {
        get { self[WorkaroundExtraActionKey.self] }
        set { self[WorkaroundExtraActionKey.self] = newValue }
    }
}

struct UIKitView4: UIViewRepresentable {
    @Environment(\.workaroundExtraAction)
    var workaroundExtraAction
    
    func makeUIView(context: Context) -> some UIView {
        UIView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        print("[UIKitView4] \(#function) once")
    }
}

private struct WorkaroundOpenURLActionKey: EnvironmentKey {
    static let defaultValue: OpenURLAction = OpenURLAction(handler: { _ in .discarded })
}

extension EnvironmentValues {
    var workaroundOpenURLAction: OpenURLAction {
        get { self[WorkaroundOpenURLActionKey.self] }
        set { self[WorkaroundOpenURLActionKey.self] = newValue }
    }
}

struct UIKitView5: UIViewRepresentable {
    @Environment(\.workaroundOpenURLAction)
    var workaroundOpenURLAction
    
    func makeUIView(context: Context) -> some UIView {
        UIView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        print("[UIKitView5] \(#function) once")
    }
}
