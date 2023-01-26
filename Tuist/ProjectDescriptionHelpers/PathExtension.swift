//
//  PathExtension.swift
//  ProjectDescriptionHelpers
//
//  Created by 고병학 on 2023/01/25.
//

import Foundation
import ProjectDescription

extension ProjectDescription.Path {
    public static func relativeToModule(_ pathString: String) -> Self {
        return .relativeToRoot("Projects/Modules/\(pathString)")
    }
    public static func relativeToFeature(_ pathString: String) -> Self {
        return .relativeToRoot("Projects/Features/\(pathString)")
    }
    public static func relativeToUserInterface(_ pathString: String) -> Self {
        return .relativeToRoot("Projects/UserInterface/\(pathString)")
    }
    public static func relativeToDomain(_ pathString: String) -> Self {
        return .relativeToRoot("Projects/Domain/\(pathString)")
    }
    public static func relativeToDataRepository(_ pathString: String) -> Self {
        return .relativeToRoot("Projects/DataRepository/\(pathString)")
    }
    public static func relativeToNetwork(_ pathString: String) -> Self {
        return .relativeToRoot("Projects/Network/\(pathString)")
    }
    public static func relativeToCarthage(_ pathString: String) -> Self {
        return .relativeToRoot("Tuist/Dependencies/Carthage/\(pathString)")
    }
    public static var app: Self {
        return .relativeToRoot("Projects/App")
    }
}

// MARK: Extension
extension Dep {
    static func module(name: String) -> Self {
        return .project(target: name, path: .relativeToModule(name))
    }
    static func feature(name: String) -> Self {
        return .project(target: name, path: .relativeToFeature(name))
    }
    static func feature(name: String, path: String) -> Self {
        return .project(target: name, path: .relativeToFeature(path))
    }
    static func userInterface(name: String) -> Self {
        return .project(target: name, path: .relativeToUserInterface(name))
    }
    static func domain(name: String) -> Self {
        return .project(target: name, path: .relativeToDomain(name))
    }
    static func dataRepository(name: String) -> Self {
        return .project(target: name, path: .relativeToDataRepository(name))
    }
    static func network(name: String) -> Self {
        return .project(target: name, path: .relativeToNetwork(name))
    }
}

// MARK: Project
extension Dep {
    public struct Project {
        public struct Feature {
            public struct Settings {}
            public struct Main {}
        }
        public struct Module {}
        public struct Network {}
        public struct UserInterface {}
    }
}


public extension Dep.Project.Feature {
    static let Features = Dep.feature(name: "Features")

    struct BaseDependency {
        public static let UserInterface  = Dep.feature(name: "FeatureBaseDependencyUserInterface", path: "BaseDependency/UserInterface")
        public static let Domain         = Dep.feature(name: "FeatureBaseDependencyDomain", path: "BaseDependency/Domain")
        public static let DataRepository = Dep.feature(name: "FeatureBaseDependencyDataRepository", path: "BaseDependency/DataRepository")
    }
}

public extension Dep.Project.Feature.Settings {
    static let UserInterface  = Dep.feature(name: "FeatureSettingsUserInterface", path: "FeatureSettings/UserInterface")
    static let Domain         = Dep.feature(name: "FeatureSettingsDomain", path: "FeatureSettings/Domain")
    static let DataRepository = Dep.feature(name: "FeatureSettingsDataRepository", path: "FeatureSettings/DataRepository")
    static let Pacakge: [Dep] = [UserInterface, Domain, DataRepository]
}

public extension Dep.Project.Feature.Main {
    static let UserInterface  = Dep.feature(name: "FeatureMainUserInterface", path: "FeatureMain/UserInterface")
    static let Domain         = Dep.feature(name: "FeatureMainDomain", path: "FeatureMain/Domain")
    static let DataRepository = Dep.feature(name: "FeatureMainDataRepository", path: "FeatureMain/DataRepository")
    static let Pacakge: [Dep] = [UserInterface, Domain, DataRepository]
}

public extension Dep.Project.UserInterface {
    static let DesignSystem = Dep.userInterface(name: "DesignSystem")
}

public extension Dep.Project.Module {
    static let AnalyticsKit                          = Dep.module(name: "AnalyticsKit")
    static let CoreKit                               = Dep.module(name: "CoreKit")
    static let DevelopTool                           = Dep.module(name: "DevelopTool")
    static let RxPackage                             = Dep.module(name: "RxPackage")
    static let ThirdPartyDynamicLibraryPluginManager = Dep.module(name: "ThirdPartyDynamicLibraryPluginManager")
    static let ThirdPartyLibraryManager              = Dep.module(name: "ThirdPartyLibraryManager")
    static let UtilityKit                            = Dep.module(name: "UtilityKit")
    static let RepositoryInjectManager               = Dep.module(name: "RepositoryInjectManager")
}

public extension Dep.Project.Network {
    static let APIs   = Dep.network(name: "NetworkAPIs")
    static let APIKit = Dep.network(name: "NetworkAPIKit")
    static let Common = Dep.network(name: "NetworkAPICommon")
    static let Home   = Dep.network(name: "NetworkAPIHome")
    static let Login  = Dep.network(name: "NetworkAPILogin")
}
