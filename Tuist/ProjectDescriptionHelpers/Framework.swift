//
//  Framework.swift
//  ProjectDescriptionHelpers
//
//  Created by 고병학 on 2023/01/25.
//

import ProjectDescription

public struct FrameworkFactory {
    
    public struct Dependency {
        
        let frameworkDependencies: [TargetDependency]
        let unitTestsDependencies: [TargetDependency]
        
        public init(
            frameworkDependencies: [TargetDependency],
            unitTestsDependencies: [TargetDependency]
        ) {
            
            self.frameworkDependencies = frameworkDependencies
            self.unitTestsDependencies = unitTestsDependencies
        }
    }
    
    public struct Payload {
        
        let name: String
        let platform: Platform
        
        public init(
            name: String,
            platform: Platform
        ) {
            self.name = name
            self.platform = platform
        }
    }
    
    private let dependency: Dependency
    
    public init(dependency: Dependency) {
        self.dependency = dependency
    }
    
    public func build(payload: Payload) -> [Target] {
        
        let sourceTarget = Target(
            name: payload.name,
            platform: payload.platform,
            product: .framework,
            bundleId: payload.name,
            deploymentTarget: deploymentTarget,
            infoPlist: .default,
            sources: ["\(payload.name)/Sources/**"],
            resources: [],
            scripts: [.SwiftLintString],
            dependencies: self.dependency.frameworkDependencies
        )
        
        let testTarget = Target(
            name: "\(payload.name)Tests",
            platform: payload.platform,
            product: .unitTests,
            bundleId: payload.name + "Tests",
            deploymentTarget: deploymentTarget,
            infoPlist: .default,
            sources: ["\(payload.name)/Tests/**"],
            resources: [],
            dependencies: [
                .target(name: payload.name),
                .SPM.Quick,
                .SPM.Nimble
            ] + self.dependency.unitTestsDependencies
        )
        
        return [sourceTarget, testTarget]
    }
}
