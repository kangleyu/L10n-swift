//
//  L10nFittingWidthTests.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 11.07.2018.
//  Copyright © 2018 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import XCTest
@testable import L10n_swift

final class L10nFittingWidthTests: L10nBaseTest {

    func testFittingWidthDevelopmentLanguage() {
        if let developmentLanguage = self.bundle.developmentLocalization {
            self.l10nInstance.language = developmentLanguage
            self.checkBaseEnglishFittingWidth()
        }
    }

    func testFittingWidthBaseLanguage() {
        self.l10nInstance.language = "Base"
        self.checkBaseEnglishFittingWidth()
    }

    func testFittingWidthSuportedLanguage() {
        self.l10nInstance.language = "pl"
        self.checkSuportedPolishFittingWidth()
    }

    func testFittingWidthSuportedLanguageWithRegion() {
        self.l10nInstance.language = "pl_PL"
        self.checkSuportedPolishFittingWidth()
    }

    func testFittingWidthUnsuportedLanguage() {
        self.l10nInstance.language = "es"
        self.checkBaseEnglishFittingWidth()
    }

    func testFittingWidthUndefinedLanguage() {
        self.l10nInstance.language = "🐒"
        self.checkUndefinedLanguageFittingWidth()
    }

    private func checkBaseEnglishFittingWidth() {
        self.checkStrings([
            (key: "language", fittingWidth: nil, expected: "Language"),
            (key: "language", fittingWidth: -10, expected: "Language"),
            (key: "language", fittingWidth: 0, expected: "Language"),
            (key: "language", fittingWidth: 100, expected: "Language"),
            (key: "fittingWidth", fittingWidth: nil, expected: "very long text"),
            (key: "fittingWidth", fittingWidth: -10, expected: "short"),
            (key: "fittingWidth", fittingWidth: 100, expected: "short"),
            (key: "fittingWidth", fittingWidth: 150, expected: "short"),
            (key: "fittingWidth", fittingWidth: 200, expected: "medium"),
            (key: "fittingWidth", fittingWidth: 250, expected: "medium"),
            (key: "fittingWidth", fittingWidth: 300, expected: "very long text"),
            (key: "fittingWidth", fittingWidth: 350, expected: "very long text"),
        ])
    }

    private func checkSuportedPolishFittingWidth() {
        self.checkStrings([
            (key: "language", fittingWidth: nil, expected: "Język"),
            (key: "language", fittingWidth: -10, expected: "Język"),
            (key: "language", fittingWidth: 0, expected: "Język"),
            (key: "language", fittingWidth: 100, expected: "Język"),
            (key: "fittingWidth", fittingWidth: nil, expected: "bardzo długi tekst"),
            (key: "fittingWidth", fittingWidth: -10, expected: "krótki"),
            (key: "fittingWidth", fittingWidth: 100, expected: "krótki"),
            (key: "fittingWidth", fittingWidth: 150, expected: "krótki"),
            (key: "fittingWidth", fittingWidth: 200, expected: "średni tekst"),
            (key: "fittingWidth", fittingWidth: 250, expected: "średni tekst"),
            (key: "fittingWidth", fittingWidth: 300, expected: "bardzo długi tekst"),
            (key: "fittingWidth", fittingWidth: 350, expected: "bardzo długi tekst"),
        ])
    }

    private func checkUndefinedLanguageFittingWidth() {
        self.checkStrings([
            (key: "language", fittingWidth: nil, expected: "language"),
            (key: "language", fittingWidth: -10, expected: "language"),
            (key: "language", fittingWidth: 0, expected: "language"),
            (key: "language", fittingWidth: 100, expected: "language"),
            (key: "fittingWidth", fittingWidth: nil, expected: "fittingWidth"),
            (key: "fittingWidth", fittingWidth: -10, expected: "fittingWidth"),
            (key: "fittingWidth", fittingWidth: 100, expected: "fittingWidth"),
            (key: "fittingWidth", fittingWidth: 150, expected: "fittingWidth"),
            (key: "fittingWidth", fittingWidth: 200, expected: "fittingWidth"),
            (key: "fittingWidth", fittingWidth: 250, expected: "fittingWidth"),
            (key: "fittingWidth", fittingWidth: 300, expected: "fittingWidth"),
            (key: "fittingWidth", fittingWidth: 350, expected: "fittingWidth"),
        ])
    }

    private func checkStrings(_ array: [(key: String, fittingWidth: Int?, expected: String)]) {
        array.forEach { key, fittingWidth, expected in
            XCTAssertEqual(expected, key.l10n(self.l10nInstance, fittingWidth: fittingWidth))
            XCTAssertEqual(expected, self.l10nInstance.string(for: key, fittingWidth: fittingWidth))
        }
    }
}
