//
//  SPM.swift
//  Config
//
//  Created by 고병학 on 2023/01/25.
//

import ProjectDescription

extension TargetDependency {
    public struct SPM {}
}

extension TargetDependency.SPM {
    // RIBs
    public static let RIBs = Self.external("RIBs")

    // Rx
    public static let ReactorKit = Self.external("ReactorKit")
    public static let RxSwift = Self.external("RxSwift")
    public static let RxDataSources = Self.external("RxDataSources")

    // Utils
    public static let Then = Self.external("Then")
    public static let Swinject = Self.external("Swinject")
    public static let SwiftKeychainWrapper = Self.external("SwiftKeychainWrapper")

    // UI
    public static let SnapKit = Self.external("SnapKit")

    // Networking
    public static let Kingfisher = Self.external("Kingfisher")
    public static let Moya = Self.external("Moya")
    public static let RxMoya = Self.external("RxMoya")

    // Testing
    public static let Quick = Self.external("Quick")
    public static let Nimble = Self.external("Nimble")

    private static func external(_ name: String) -> TargetDependency {
        return TargetDependency.external(name: name)
    }
}
