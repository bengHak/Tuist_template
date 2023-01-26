//
//  Workspace.swift
//  tuist_tutorial_3Manifests
//
//  Created by 고병학 on 2023/01/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(
    name: "Application",
    projects: [
        "Projects/App",
        "Projects/TemplateFramework",
    ]
)
