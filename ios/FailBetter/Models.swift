// Models.swift — CAPE Review App data models
import Foundation

// MARK: - Subject

struct Subject: Codable, Identifiable {
    let id: Int
    let name: String
    let year: Int?
    let p1Count: Int?
    let p2Count: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, year
        case p1Count = "p1_count"
        case p2Count = "p2_count"
    }
}

// MARK: - Choice (Paper 1 MCQ option)

struct Choice: Codable, Identifiable {
    let id: Int
    let label: String        // "A" | "B" | "C" | "D"
    let answerRaw: String    // plain text / LaTeX string from the DB
    let answerCode: String   // Swift-ready validated string (same in most cases)
    let diagramKey: String?  // present if this choice has its own diagram

    enum CodingKeys: String, CodingKey {
        case id, label
        case answerRaw  = "answer_raw"
        case answerCode = "answer_code"
        case diagramKey = "diagram_key"
    }
}

// MARK: - Review (single review history row)

struct ReviewEntry: Codable, Identifiable {
    var id: String { "\(reviewer)-\(createdAt)" } // synthesised
    let reviewer: String
    let status: String      // "correct" | "needs_fix"
    let note: String?
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case reviewer, status, note
        case createdAt = "created_at"
    }
}

// MARK: - Question

struct Question: Codable, Identifiable {
    let id: Int
    let paper: Int                          // 1 or 2
    let subjectName: String
    let number: Int
    let part: String?                       // P2 only: "a", "b", …
    let subpart: String?                    // P2 only: "i", "ii", …
    let section: String?
    let topic: String?
    let difficulty: String?
    let marks: Double?                      // P2 only
    let correctChoice: String?             // P1 only: "A" | "B" | "C" | "D"
    let questionRaw: String                // plain text from spreadsheet (style/reference only)
    let questionCode: String               // Validated Question Code — the LaTeX string to render
    let questionDiagramKey: String?
    let diagramPresent: Bool
    let year: Int?
    let month: String?
    let reviewCount: Int
    let latestReviewStatus: String         // "unreviewed" | "correct" | "needs_fix"
    let hasConflictingReviews: Bool

    // Populated only by GET /questions/:id
    let choices: [Choice]?
    let reviews: [ReviewEntry]?

    enum CodingKeys: String, CodingKey {
        case id, paper, number, part, subpart, section, topic, difficulty, marks, year, month
        case subjectName          = "subject_name"
        case correctChoice        = "correct_choice"
        case questionRaw          = "question_raw"
        case questionCode         = "question_code"
        case questionDiagramKey   = "question_diagram_key"
        case diagramPresent       = "diagram_present"
        case reviewCount          = "review_count"
        case latestReviewStatus   = "latest_review_status"
        case hasConflictingReviews = "has_conflicting_reviews"
        case choices, reviews
    }

    // Convert the DB integer flag (0/1) to Bool
    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        id                   = try c.decode(Int.self,    forKey: .id)
        paper                = try c.decode(Int.self,    forKey: .paper)
        subjectName          = try c.decode(String.self, forKey: .subjectName)
        number               = try c.decode(Int.self,    forKey: .number)
        part                 = try c.decodeIfPresent(String.self, forKey: .part)
        subpart              = try c.decodeIfPresent(String.self, forKey: .subpart)
        section              = try c.decodeIfPresent(String.self, forKey: .section)
        topic                = try c.decodeIfPresent(String.self, forKey: .topic)
        difficulty           = try c.decodeIfPresent(String.self, forKey: .difficulty)
        marks                = try c.decodeIfPresent(Double.self, forKey: .marks)
        correctChoice        = try c.decodeIfPresent(String.self, forKey: .correctChoice)
        questionRaw          = try c.decode(String.self, forKey: .questionRaw)
        questionCode         = try c.decode(String.self, forKey: .questionCode)
        questionDiagramKey   = try c.decodeIfPresent(String.self, forKey: .questionDiagramKey)
        year                 = try c.decodeIfPresent(Int.self,    forKey: .year)
        month                = try c.decodeIfPresent(String.self, forKey: .month)
        reviewCount          = try c.decode(Int.self,    forKey: .reviewCount)
        latestReviewStatus   = try c.decode(String.self, forKey: .latestReviewStatus)
        choices              = try c.decodeIfPresent([Choice].self,      forKey: .choices)
        reviews              = try c.decodeIfPresent([ReviewEntry].self, forKey: .reviews)

        // Stored as INTEGER 0/1 in D1
        let dpInt  = try c.decodeIfPresent(Int.self, forKey: .diagramPresent) ?? 0
        let hcrInt = try c.decodeIfPresent(Int.self, forKey: .hasConflictingReviews) ?? 0
        diagramPresent         = dpInt  != 0
        hasConflictingReviews  = hcrInt != 0
    }
}

// MARK: - Stats

struct SubjectStats: Codable, Identifiable {
    var id: String { "\(subject)-\(paper)-\(year ?? 0)" }
    let subject: String
    let paper: Int
    let year: Int?
    let total: Int
    let reviewed: Int
    let unreviewed: Int
    let conflicts: Int

    var reviewPct: Double {
        total == 0 ? 0 : Double(reviewed) / Double(total) * 100
    }
}

// MARK: - Review status helpers

extension Question {
    var statusColour: String {
        switch latestReviewStatus {
        case "correct":   return "green"
        case "needs_fix": return "red"
        default:          return "gray"
        }
    }

    /// Human-readable question header, e.g. "Q3(a)(i)"
    var questionLabel: String {
        var s = "Q\(number)"
        if let p = part    { s += "(\(p))" }
        if let sp = subpart { s += "(\(sp))" }
        return s
    }
}
