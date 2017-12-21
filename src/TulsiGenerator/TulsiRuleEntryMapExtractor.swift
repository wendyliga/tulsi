//
//  TulsiRuleEntryMapExtractor.swift
//  TulsiGenerator
//
//  Created by Brandon Kase on 10/27/17.
//  Copyright © 2017 The Tulsi Authors. All rights reserved.
//

import Foundation

enum BundleLoadError: Error {
    case cannotFindTulsiAspectsDirectory(description: String)
}
public enum TulsiRuleEntryMapExtractor {
    public static func extract(config: TulsiGeneratorConfig, workspace: URL) throws -> RuleEntryMap {
        let bundle = Bundle.main
        let extractor = BazelWorkspaceInfoExtractor(
            bazelURL: config.bazelURL,
            workspaceRootURL: workspace,
            localizedMessageLogger: LocalizedMessageLogger(bundle: bundle))
        
        return try extractor.ruleEntriesForLabels(
            config.buildTargetLabels,
            startupOptions: config.options[.BazelBuildStartupOptionsDebug],
            buildOptions: config.options[.BazelBuildOptionsDebug],
            bepOption: config.options[.BEPSupportEnabled]
        )
    }
}

