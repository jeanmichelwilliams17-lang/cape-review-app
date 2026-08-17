// Models.swift — CAPE Review App data models
import Foundation

// MARK: - Subject

struct Subject: Codable, Identifiable {
    let dbId: Int
    let name: String
    let year: Int?
    let p1Count: Int?
    let p2Count: Int?

    var id: String {
        "\(dbId)-\(name)-\(year ?? 0)"
    }

    enum CodingKeys: String, CodingKey {
        case dbId = "id"
        case name, year
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
        id = try c.decode(Int.self, forKey: .id)
        paper = (try? c.decodeIfPresent(Int.self, forKey: .paper)) ?? 1
        subjectName = (try? c.decodeIfPresent(String.self, forKey: .subjectName)) ?? ""
        number = (try? c.decodeIfPresent(Int.self, forKey: .number)) ?? 0

        // Part: String or Int
        if let s = try? c.decodeIfPresent(String.self, forKey: .part) {
            part = s
        } else if let i = try? c.decodeIfPresent(Int.self, forKey: .part) {
            part = String(i)
        } else {
            part = nil
        }

        // Subpart: String or Int
        if let s = try? c.decodeIfPresent(String.self, forKey: .subpart) {
            subpart = s
        } else if let i = try? c.decodeIfPresent(Int.self, forKey: .subpart) {
            subpart = String(i)
        } else {
            subpart = nil
        }

        section = try? c.decodeIfPresent(String.self, forKey: .section)
        topic = try? c.decodeIfPresent(String.self, forKey: .topic)

        // Difficulty: String or Int
        if let s = try? c.decodeIfPresent(String.self, forKey: .difficulty) {
            difficulty = s
        } else if let i = try? c.decodeIfPresent(Int.self, forKey: .difficulty) {
            difficulty = String(i)
        } else {
            difficulty = nil
        }

        // Marks: Double or Int
        if let doubleVal = try? c.decodeIfPresent(Double.self, forKey: .marks) {
            marks = doubleVal
        } else if let intVal = try? c.decodeIfPresent(Int.self, forKey: .marks) {
            marks = Double(intVal)
        } else {
            marks = nil
        }

        correctChoice = try? c.decodeIfPresent(String.self, forKey: .correctChoice)
        questionRaw = (try? c.decodeIfPresent(String.self, forKey: .questionRaw)) ?? ""
        questionCode = (try? c.decodeIfPresent(String.self, forKey: .questionCode)) ?? questionRaw
        questionDiagramKey = try? c.decodeIfPresent(String.self, forKey: .questionDiagramKey)
        year = try? c.decodeIfPresent(Int.self, forKey: .year)
        month = try? c.decodeIfPresent(String.self, forKey: .month)
        reviewCount = (try? c.decodeIfPresent(Int.self, forKey: .reviewCount)) ?? 0
        latestReviewStatus = (try? c.decodeIfPresent(String.self, forKey: .latestReviewStatus)) ?? "unreviewed"
        choices = try? c.decodeIfPresent([Choice].self, forKey: .choices)
        reviews = try? c.decodeIfPresent([ReviewEntry].self, forKey: .reviews)

        // DiagramPresent: Bool or Int
        if let b = try? c.decodeIfPresent(Bool.self, forKey: .diagramPresent) {
            diagramPresent = b
        } else if let i = try? c.decodeIfPresent(Int.self, forKey: .diagramPresent) {
            diagramPresent = (i != 0)
        } else {
            diagramPresent = false
        }

        // HasConflictingReviews: Bool or Int
        if let b = try? c.decodeIfPresent(Bool.self, forKey: .hasConflictingReviews) {
            hasConflictingReviews = b
        } else if let i = try? c.decodeIfPresent(Int.self, forKey: .hasConflictingReviews) {
            hasConflictingReviews = (i != 0)
        } else {
            hasConflictingReviews = false
        }
    }
}

// MARK: - FixedQuestion Model

struct FixedQuestion: Identifiable, Codable {
    let id: Int
    let originalQuestionId: Int?
    let subjectName: String
    let paper: Int
    let year: Int?
    let month: String?
    let number: Int
    let part: String?
    let subpart: String?
    let originalQuestionRaw: String
    let fixedQuestionRaw: String
    let originalQuestionCode: String?
    let fixedQuestionCode: String?
    let fixType: String
    let status: String

    enum CodingKeys: String, CodingKey {
        case id, paper, year, month, number, part, subpart, status
        case originalQuestionId   = "original_question_id"
        case subjectName          = "subject_name"
        case originalQuestionRaw  = "original_question_raw"
        case fixedQuestionRaw     = "fixed_question_raw"
        case originalQuestionCode = "original_question_code"
        case fixedQuestionCode    = "fixed_question_code"
        case fixType              = "fix_type"
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
