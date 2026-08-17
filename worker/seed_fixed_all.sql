DELETE FROM fixed_questions;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '4',
        '\text{The modulus of the complex number } ( 6 + 3i ) \text{ is}', '\text{The modulus of the complex number } ( 6 + 3i ) \text{ is}', 'LaTeX("The modulus of the complex number $( 6 + 3i )$ is").parsingMode(.onlyEquations)', 'LaTeX("The modulus of the complex number $( 6 + 3i )$ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '9',
        '( \int \frac{1}{1+9x^2} dx ) \text{ is}', '( \int \frac{1}{1+9x^2} dx ) \text{ is}', 'LaTeX("$( \\int \\frac{1}{1+9x^2} dx )$ is").parsingMode(.onlyEquations)', 'LaTeX("$( \\int \\frac{1}{1+9x^2} dx )$ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '11',
        '\text{Given that } ( \cos 2x = 1 - 2\sin^2 x ), ( \int_0^\pi \sin^2 (\frac{x}{4}) dx ) \text{ is}', '\text{Given that } ( \cos 2x = 1 - 2 \sin^2 x ), ( \int_0^\pi \sin^2 (\frac{x}{4}) dx ) \text{ is}', 'LaTeX("Given that $( \\cos 2x = 1 - 2\\sin^2 x ), ( \\int_0^\\pi \\sin^2 (\\frac{x}{4}) dx )$ is").parsingMode(.onlyEquations)', 'LaTeX("Given that $( \\cos 2x = 1 - 2 \\sin^2 x ), ( \\int_0^\\pi \\sin^2 (\\frac{x}{4}) dx )$ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '21',
        '\text{The series } ( \sum_{n=0}^{\infty} \frac{5}{2^n} ) \text{ converges to the value}', '\text{The series } ( \sum_{(n=0)}^{\infty} \frac{5}{2^n} ) \text{ converges to the value}', 'LaTeX("The series $( \\sum_{n=0}^{\\infty} \\frac{5}{2^n} )$ converges to the value").parsingMode(.onlyEquations)', 'LaTeX("The series $( \\sum_{(n=0)}^{\\infty} \\frac{5}{2^n} )$ converges to the value").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '22',
        '\text{Which of the following series diverges?}', '\text{Which of the following series diverges?}', 'LaTeX("Which of the following series diverges?").parsingMode(.onlyEquations)', 'LaTeX("Which of the following series diverges?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '28',
        '\text{The value of } ( \sum_{n=0}^{\infty} x^n ) \text{ for } ( |x| < 1 ) \text{ is}', '\text{The value of } ( \sum_{(n=0)}^{\infty} x^n ) \text{ for } ( |x| < 1 ) \text{ is}', 'LaTeX("The value of $( \\sum_{n=0}^{\\infty} x^n )$ for $( |x| < 1 )$ is").parsingMode(.onlyEquations)', 'LaTeX("The value of $( \\sum_{(n=0)}^{\\infty} x^n )$ for $( |x| < 1 )$ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '29',
        '\text{The value of } ( \sum_{n=1}^{\infty} 2(\frac{1}{4})^{n-1} ) \text{ is}', '\text{The value of } ( \sum_{(n=1)}^{\infty} 2(\frac{1}{4})^{n-1} ) \text{ is}', 'LaTeX("The value of $( \\sum_{n=1}^{\\infty} 2(\\frac{1}{4})^{n-1} )$ is").parsingMode(.onlyEquations)', 'LaTeX("The value of $( \\sum_{(n=1)}^{\\infty} 2(\\frac{1}{4})^{n-1} )$ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '1',
        '\text{The modulus of the complex number } ( \frac{1}{2} - \frac{1}{2}i ) \text{ is}', '\text{The modulus of the complex number } ( \frac{1}{2} - \frac{1}{2}i ) \text{ is}', 'LaTeX("The modulus of the complex number $( \\frac{1}{2} - \\frac{1}{2}i )$ is").parsingMode(.onlyEquations)', 'LaTeX("The modulus of the complex number $( \\frac{1}{2} - \\frac{1}{2}i )$ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '6',
        '\text{The principal value of the argument of the complex number } ( -2 + 2i ) \text{ is}', '\text{The principal value of the argument of the complex number } ( -2 + 2i ) \text{ is}', 'LaTeX("The principal value of the argument of the complex number $( -2 + 2i )$ is").parsingMode(.onlyEquations)', 'LaTeX("The principal value of the argument of the complex number $( -2 + 2i )$ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '7',
        '\text{Given that } ( z = -1 + \sqrt{3}i ), \text{ then the exponential form of the complex number } ( z ) \text{ is}', '\text{Given that } ( z = -1 + \sqrt{3}i ), \text{ then the exponential form of the complex number } ( z ) \text{ is}', 'LaTeX("Given that $( z = -1 + \\sqrt{3}i ),$ then the exponential form of the complex number $( z )$ is").parsingMode(.onlyEquations)', 'LaTeX("Given that $( z = -1 + \\sqrt{3}i ),$ then the exponential form of the complex number $( z )$ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '10',
        '( \frac{d}{dx} \cos^{-1} [ \frac{x}{2} ] ) \text{ is equal to}', '( \frac{d}{dx} \cos^{(-$2)} [ \frac{x}{2} ] ) \text{ is equal to}', 'LaTeX("$( \\frac{d}{dx} \\cos^{-1} [ \\frac{x}{2} ] )$ is equal to").parsingMode(.onlyEquations)', 'LaTeX("$( \\frac{d}{dx} \\cos^{(-$2)} [ \\frac{x}{2} ] )$ is equal to").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '18',
        '\text{The value of } ( \sum_{n=0}^{\infty} x^n ) \text{ for } ( |x| < 1 ) \text{ is}', '\text{The value of } ( \sum_{(n=0)}^{\infty} x^n ) \text{ for } ( |x| < 1 ) \text{ is}', 'LaTeX("The value of $( \\sum_{n=0}^{\\infty} x^n )$ for $( |x| < 1 )$ is").parsingMode(.onlyEquations)', 'LaTeX("The value of $( \\sum_{(n=0)}^{\\infty} x^n )$ for $( |x| < 1 )$ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '20',
        '\text{For } ( -1 < 2n < 1 ), ( \sum_{r=0}^{\infty} (2n)^r = )', '\text{For } ( -1 < 2n < 1 ), ( \sum_{(r=0)}^{\infty} (2n)^r = )', 'LaTeX("For $( -1 < 2n < 1 ), ( \\sum_{r=0}^{\\infty} (2n)^r = )$").parsingMode(.onlyEquations)', 'LaTeX("For $( -1 < 2n < 1 ), ( \\sum_{(r=0)}^{\\infty} (2n)^r = )$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '22',
        '\text{Which of the following series are arithmetic series?}
I. ( \sum_{r=1}^n (7+3r) )
II. ( \sum_{r=1}^n \log_{10} 3^{(r+1)} )
III. ( \sum_{r=1}^n \log_{10} (r+1) )', '\text{Which of the following series are arithmetic series?}
I. ( \sum_{(r=1)}^n (7+3r) )
II. ( \sum_{(r=1)}^n \log_{10} 3^{(r+1)} )
III. ( \sum_{(r=1)}^n \log_{10} (r+1) )', 'LaTeX("Which of the following series are arithmetic series?\n$I. ( \\sum_{r=1}^n (7+3r) )$\n$II. ( \\sum_{r=1}^n \\log_{10} 3^{(r+1)} )$\n$III. ( \\sum_{r=1}^n \\log_{10} (r+1) )$").parsingMode(.onlyEquations)', 'LaTeX("Which of the following series are arithmetic series?\n$I. ( \\sum_{(r=1)}^n (7+3r) )$\n$II. ( \\sum_{(r=1)}^n \\log_{10} 3^{(r+1)} )$\n$III. ( \\sum_{(r=1)}^n \\log_{10} (r+1) )$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '24',
        '\text{Given that } ( S_n = \sum_{l=1}^n [ \frac{1}{l} - \frac{1}{l+1} ] ), ( \lim_{n \to \infty} S_n ) \text{ is}', '\text{Given that } ( S_n = \sum_{(l=1)}^n [ \frac{1}{l} - \frac{1}{l+1} ] ), ( \lim_{(n \to \infty)} S_n ) \text{ is}', 'LaTeX("Given that $( S_n = \\sum_{l=1}^n [ \\frac{1}{l} - \\frac{1}{l+1} ] ), ( \\lim_{n \\to \\infty} S_n )$ is").parsingMode(.onlyEquations)', 'LaTeX("Given that $( S_n = \\sum_{(l=1)}^n [ \\frac{1}{l} - \\frac{1}{l+1} ] ), ( \\lim_{(n \\to \\infty)} S_n )$ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '35',
        '\text{Which of the following statements is true?}', '\text{Which of the following statements is true?}', 'LaTeX("Which of the following statements is true?").parsingMode(.onlyEquations)', 'LaTeX("Which of the following statements is true?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '39',
        '\text{The displacement, } ( x ), \text{ of a particle at time } ( t ) \text{ is given by the differential equation } ( \frac{d^2x}{dt^2} + 2\frac{dx}{dt} - 5x = 4e^t ). \text{ The particular integral } ( x = )', '\text{The displacement, } ( x ), \text{ of a particle at time } ( t ) \text{ is given by the differential equation } ( \frac{d^2x}{dt^2} + 2 \frac{dx}{dt} - 5x = 4e^t ). \text{ The particular integral } ( x = )', 'LaTeX("The displacement, $( x ),$ of a particle at time $( t )$ is given by the differential equation $( \\frac{d^2x}{dt^2} + 2\\frac{dx}{dt} - 5x = 4e^t ).$ The particular integral $( x = )$").parsingMode(.onlyEquations)', 'LaTeX("The displacement, $( x ),$ of a particle at time $( t )$ is given by the differential equation $( \\frac{d^2x}{dt^2} + 2 \\frac{dx}{dt} - 5x = 4e^t ).$ The particular integral $( x = )$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2026, 'May', 1, '4',
        '\text{The modulus of the complex number } ( 6 + 3i ) \text{ is}', '\text{The modulus of the complex number } ( 6 + 3i ) \text{ is}', 'LaTeX("The modulus of the complex number $( 6 + 3i )$ is").parsingMode(.onlyEquations)', 'LaTeX("The modulus of the complex number $( 6 + 3i )$ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2026 IS NULL OR q.year = 2026)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2026, 'May', 1, '9',
        '( \int \frac{1}{1+9x^2} dx ) \text{ is}', '( \int \frac{1}{1+9x^2} dx ) \text{ is}', 'LaTeX("$( \\int \\frac{1}{1+9x^2} dx )$ is").parsingMode(.onlyEquations)', 'LaTeX("$( \\int \\frac{1}{1+9x^2} dx )$ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2026 IS NULL OR q.year = 2026)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2026, 'May', 1, '11',
        '\text{Given that } ( \cos 2x = 1 - 2\sin^2 x ) \text{, } ( \int_0^{\pi} \sin^2 (\frac{x}{4}) dx ) \text{ is}', '\text{Given that } ( \cos 2x = 1 - 2 \sin^2 x ) \text{, } ( \int_0^{\pi} \sin^2 (\frac{x}{4}) dx ) \text{ is}', 'LaTeX("Given that $( \\cos 2x = 1 - 2\\sin^2 x )$, $( \\int_0^{\\pi} \\sin^2 (\\frac{x}{4}) dx )$ is").parsingMode(.onlyEquations)', 'LaTeX("Given that $( \\cos 2x = 1 - 2 \\sin^2 x )$, $( \\int_0^{\\pi} \\sin^2 (\\frac{x}{4}) dx )$ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2026 IS NULL OR q.year = 2026)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2026, 'May', 1, '21',
        '\text{The sum } ( S_n ) \text{ in terms of } ( n ) \text{ for the series } ( \sum_{r=1}^n (r^3 + 2r - 3) ) \text{ is}', '\text{The sum } ( S_n ) \text{ in terms of } ( n ) \text{ for the series } ( \sum_{(r=1)}^n (r^3 + 2r - 3) ) \text{ is}', 'LaTeX("The sum $( S_n )$ in terms of $( n )$ for the series $( \\sum_{r=1}^n (r^3 + 2r - 3) )$ is").parsingMode(.onlyEquations)', 'LaTeX("The sum $( S_n )$ in terms of $( n )$ for the series $( \\sum_{(r=1)}^n (r^3 + 2r - 3) )$ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2026 IS NULL OR q.year = 2026)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2026, 'May', 1, '22',
        '\text{Which of the following series are arithmetic series?}
\text{I. } ( \sum_{r=1}^n (7 + 3r) )
\text{II. } ( \sum_{r=1}^n \log_{10} 3^{(r+1)} )
\text{III. } ( \sum_{r=1}^n \log_{10} (r+1) )', '\text{Which of the following series are arithmetic series?}
\text{I. } ( \sum_{(r=1)}^n (7 + 3r) )
\text{II. } ( \sum_{(r=1)}^n \log_{10} 3^{(r+1)} )
\text{III. } ( \sum_{(r=1)}^n \log_{10} (r+1) )', 'LaTeX("Which of the following series are arithmetic series?\nI. $( \\sum_{r=1}^n (7 + 3r) )$\nII. $( \\sum_{r=1}^n \\log_{10} 3^{(r+1)} )$\nIII. $( \\sum_{r=1}^n \\log_{10} (r+1) )$").parsingMode(.onlyEquations)', 'LaTeX("Which of the following series are arithmetic series?\nI. $( \\sum_{(r=1)}^n (7 + 3r) )$\nII. $( \\sum_{(r=1)}^n \\log_{10} 3^{(r+1)} )$\nIII. $( \\sum_{(r=1)}^n \\log_{10} (r+1) )$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2026 IS NULL OR q.year = 2026)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2026, 'May', 1, '45',
        '\text{The displacement x of a particle at time t is given by the differential equation is } ( \frac{d^2x}{dt^2} + 2\frac{dx}{dt} - 5x = 4e^t ) \text{. A particular integral for the solution of this differential equation is}', '\text{The displacement x of a particle at time t is given by the differential equation is } ( \frac{d^2x}{dt^2} + 2 \frac{dx}{dt} - 5x = 4e^t ) \text{. A particular integral for the solution of this differential equation is}', 'LaTeX("The displacement x of a particle at time t is given by the differential equation is $( \\frac{d^2x}{dt^2} + 2\\frac{dx}{dt} - 5x = 4e^t )$. A particular integral for the solution of this differential equation is").parsingMode(.onlyEquations)', 'LaTeX("The displacement x of a particle at time t is given by the differential equation is $( \\frac{d^2x}{dt^2} + 2 \\frac{dx}{dt} - 5x = 4e^t )$. A particular integral for the solution of this differential equation is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2026 IS NULL OR q.year = 2026)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '42',
        '\text{An investment costs }  \1000  \text{ and generates cash flow of }  \80  \text{ over an indefinite period.}
\text{The internal rate of return is}', '\text{An investment costs }  \1000  \text{ and generates cash flow of }  \80  \text{ over an indefinite period.}
\text{The internal rate of return is}', 'LaTeX("An investment costs  $\\$1000$  and generates cash flow of  $\\$80$  over an indefinite period.\nThe internal rate of return is").parsingMode(.onlyEquations)', 'LaTeX("An investment costs  $\\$1000$  and generates cash flow of  $\\$80$  over an indefinite period.\nThe internal rate of return is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%MOB%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2019, 'May', 1, '19',
        '\text{If } ( Z \sim N(0, 1) ) \text{, then } ( P(-1 < Z < 2) ) \text{ is given by}', '\text{If } ( Z \sim N(0, 1) ) \text{, then } ( P(-1 < Z < 2) ) \text{ is given by}', 'LaTeX("If $( Z \\sim N(0, 1) )$, then $( P(-1 < Z < 2) )$ is given by").parsingMode(.onlyEquations)', 'LaTeX("If $( Z \\sim N(0, 1) )$, then $( P(-1 < Z < 2) )$ is given by").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%AppliedMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2019 IS NULL OR q.year = 2019)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '18',
        '\text{For a standard normal distribution curve, what approximate percentage of the area under the curve is covered by } ( \mu \pm 2\sigma ) \text{?}', '\text{For a standard normal distribution curve, what approximate percentage of the area under the curve is covered by } ( \mu \pm 2 \sigma ) \text{?}', 'LaTeX("For a standard normal distribution curve, what approximate percentage of the area under the curve is covered by $( \\mu \\pm 2\\sigma )$?").parsingMode(.onlyEquations)', 'LaTeX("For a standard normal distribution curve, what approximate percentage of the area under the curve is covered by $( \\mu \\pm 2 \\sigma )$?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%AppliedMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2020, 'May', 1, '14',
        '\text{If } ( m ) \text{ is the mass of an object and } ( E ) \text{ its kinetic energy, then its linear momentum is}', '\text{If } ( m ) \text{ is the mass of an object and } ( E ) \text{ its kinetic energy, then its linear momentum is}', 'LaTeX("If $( m )$ is the mass of an object and $( E )$ its kinetic energy, then its linear momentum is").parsingMode(.onlyEquations)', 'LaTeX("If $( m )$ is the mass of an object and $( E )$ its kinetic energy, then its linear momentum is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2020 IS NULL OR q.year = 2020)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2020, 'May', 1, '27',
        '\text{Two progressive waves with a phase difference of } ( \pi ) \text{ undergo superposition. If each of these waves has an amplitude of } ( 5\text{ cm} ) \text{, what is their resulting amplitude?}', '\text{Two progressive waves with a phase difference of } ( \pi ) \text{ undergo superposition. If each of these waves has an amplitude of } ( 5\text{ cm} ) \text{, what is their resulting amplitude?}', 'LaTeX("Two progressive waves with a phase difference of $( \\pi )$ undergo superposition. If each of these waves has an amplitude of $( 5$ cm$)$, what is their resulting amplitude?").parsingMode(.onlyEquations)', 'LaTeX("Two progressive waves with a phase difference of $( \\pi )$ undergo superposition. If each of these waves has an amplitude of $( 5$ cm$)$, what is their resulting amplitude?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2020 IS NULL OR q.year = 2020)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2022, 'May', 1, '24',
        '\text{For a pipe with open ends and length } ( l ) \text{, which of the following diagrams of stationary waves indicates that the length of the tube is } ( 1\lambda ) \text{?}', '\text{For a pipe with open ends and length } ( l ) \text{, which of the following diagrams of stationary waves indicates that the length of the tube is } ( 1 \lambda ) \text{?}', 'LaTeX("For a pipe with open ends and length $( l )$, which of the following diagrams of stationary waves indicates that the length of the tube is $( 1\\lambda )$?").parsingMode(.onlyEquations)', 'LaTeX("For a pipe with open ends and length $( l )$, which of the following diagrams of stationary waves indicates that the length of the tube is $( 1 \\lambda )$?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2022 IS NULL OR q.year = 2022)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2022, 'May', 1, '27',
        '\text{Two progressive waves with a phase difference of } ( \pi ) \text{ undergo superposition. If each of these waves has an amplitude of 5 cm, what is their resulting amplitude?}', '\text{Two progressive waves with a phase difference of } ( \pi ) \text{ undergo superposition. If each of these waves has an amplitude of 5 cm, what is their resulting amplitude?}', 'LaTeX("Two progressive waves with a phase difference of $( \\pi )$ undergo superposition. If each of these waves has an amplitude of 5 cm, what is their resulting amplitude?").parsingMode(.onlyEquations)', 'LaTeX("Two progressive waves with a phase difference of $( \\pi )$ undergo superposition. If each of these waves has an amplitude of 5 cm, what is their resulting amplitude?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2022 IS NULL OR q.year = 2022)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2022, 'May', 1, '28',
        '\text{What is the phase difference between the two points, A and B, on the following graph?}', '\text{What is the phase difference between the two points, A and B, on the following graph?}', 'LaTeX("What is the phase difference between the two points, A and B, on the following graph?").parsingMode(.onlyEquations)', 'LaTeX("What is the phase difference between the two points, A and B, on the following graph?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2022 IS NULL OR q.year = 2022)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '10',
        '\text{What is the magnetic flux density at the centre of a long solenoid, given that the number of turns per unit length is 12 turns per centimetre and the current passing is } ( 3 \text{ A} \text{?} )
\text{(Assume } ( \mu_o = 4\pi \times 10^{-7} \text{ H m}^{-1} ) \text{.)}', '\text{What is the magnetic flux density at the centre of a long solenoid, given that the number of turns per unit length is 12 turns per centimetre and the current passing is } ( 3 \text{ A} \text{?} )
\text{(Assume } ( \mu_o = 4 \pi \times 10^{-7} \text{ H m}^{-1} ) \text{.)}', 'LaTeX("What is the magnetic flux density at the centre of a long solenoid, given that the number of turns per unit length is 12 turns per centimetre and the current passing is $( 3$ A?$)$\n(Assume $( \\mu_o = 4\\pi \\times 10^{-7}$ H m$^{-1} )$.)").parsingMode(.onlyEquations)', 'LaTeX("What is the magnetic flux density at the centre of a long solenoid, given that the number of turns per unit length is 12 turns per centimetre and the current passing is $( 3$ A?$)$\n(Assume $( \\mu_o = 4 \\pi \\times 10^{-7}$ H m$^{-1} )$.)").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '45',
        '\text{A } ( 5\text{-kg} ) \text{ mass hangs from a uniform steel wire and the resulting stress in the wire is } ( \sigma ) \text{. Hanging a } ( 10\text{-kg} ) \text{ mass from a steel wire of twice the diameter would result in a stress of}', '\text{A } ( 5\text{-kg} ) \text{ mass hangs from a uniform steel wire and the resulting stress in the wire is } ( \sigma ) \text{. Hanging a } ( 10\text{-kg} ) \text{ mass from a steel wire of twice the diameter would result in a stress of}', 'LaTeX("A $( 5$-kg$)$ mass hangs from a uniform steel wire and the resulting stress in the wire is $( \\sigma )$. Hanging a $( 10$-kg$)$ mass from a steel wire of twice the diameter would result in a stress of").parsingMode(.onlyEquations)', 'LaTeX("A $( 5$-kg$)$ mass hangs from a uniform steel wire and the resulting stress in the wire is $( \\sigma )$. Hanging a $( 10$-kg$)$ mass from a steel wire of twice the diameter would result in a stress of").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '10',
        '\text{What is the magnetic flux density at the centre of a long solenoid, given that the number of turns per unit length is 12 turns per centimetre and the current passing through the solenoid is 3 A?}
\text{(Assume } ( \mu_o = 4\pi \times 10^{-7} \text{ H m}^{-1} ) \text{.)}', '\text{What is the magnetic flux density at the centre of a long solenoid, given that the number of turns per unit length is 12 turns per centimetre and the current passing through the solenoid is 3 A?}
\text{(Assume } ( \mu_o = 4 \pi \times 10^{-7} \text{ H m}^{-1} ) \text{.)}', 'LaTeX("What is the magnetic flux density at the centre of a long solenoid, given that the number of turns per unit length is 12 turns per centimetre and the current passing through the solenoid is 3 A?\n(Assume $( \\mu_o = 4\\pi \\times 10^{-7}$ H m$^{-1} )$.)").parsingMode(.onlyEquations)', 'LaTeX("What is the magnetic flux density at the centre of a long solenoid, given that the number of turns per unit length is 12 turns per centimetre and the current passing through the solenoid is 3 A?\n(Assume $( \\mu_o = 4 \\pi \\times 10^{-7}$ H m$^{-1} )$.)").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2022, 'May', 1, '35',
        '\text{What is the product of the following (unbalanced) equation?}
( \text{Al}_2\text{O}_3\cdot\text{H}_2\text{O (s)} + \text{H}_2\text{O (l)} + \text{OH}^-\text{ (aq)} \rightarrow )', '\text{What is the product of the following (unbalanced) equation?}
( \text{Al}_2\text{O}_3 \cdot\text{H}_2\text{O (s)} + \text{H}_2\text{O (l)} + \text{OH}^-\text{ (aq)} \rightarrow )', 'LaTeX("What is the product of the following (unbalanced) equation?\n$($Al$_2$O$_3\\cdot$H$_2$O (s)$+$H$_2$O (l)$+$OH$^-$ (aq)$\\rightarrow )$").parsingMode(.onlyEquations)', 'LaTeX("What is the product of the following (unbalanced) equation?\n$($Al$_2$O$_3 \\cdot$H$_2$O (s)$+$H$_2$O (l)$+$OH$^-$ (aq)$\\rightarrow )$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2022 IS NULL OR q.year = 2022)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '5',
        '3\sqrt{20} - \sqrt{45} + \sqrt{80} \text{ can be simplified as}', '3 \sqrt{20} - \sqrt{45} + \sqrt{80} \text{ can be simplified as}', 'LaTeX("$3\\sqrt{20} - \\sqrt{45} + \\sqrt{80}$ can be simplified as").parsingMode(.onlyEquations)', 'LaTeX("$3 \\sqrt{20} - \\sqrt{45} + \\sqrt{80}$ can be simplified as").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '6',
        '\text{Using summation notation, the series}
  3 - 9 + 27 - 81 + \dots - 729 
 \text{may be represented by}', '\text{Using summation notation, the series}
  3 - 9 + 27 - 81 + \dots - 729 
 \text{may be represented by}', 'LaTeX("Using summation notation, the series\n$3 - 9 + 27 - 81 + \\dots - 729$\nmay be represented by").parsingMode(.onlyEquations)', 'LaTeX("Using summation notation, the series\n$3 - 9 + 27 - 81 + \\dots - 729$\nmay be represented by").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '19',
        '\frac{\sin^2 x - \cos^2 x}{\tan^2 x - 1} =', '\frac{\sin^2 x - \cos^2 x}{\tan^2 x - 1} =', 'LaTeX("$\\frac{\\sin^2 x - \\cos^2 x}{\\tan^2 x - 1} =$").parsingMode(.onlyEquations)', 'LaTeX("$\\frac{\\sin^2 x - \\cos^2 x}{\\tan^2 x - 1} =$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '20',
        '\text{The general solution for } \sin 2\theta = \sin \frac{\pi}{6} \text{, where } n \in \mathbb{Z} \text{, is}', '\text{The general solution for } \sin 2 \theta = \sin \frac{\pi}{6} \text{, where } n \in \mathbb{Z} \text{, is}', 'LaTeX("The general solution for $\\sin 2\\theta = \\sin \\frac{\\pi}{6}$, where $n \\in \\mathbb{Z}$, is").parsingMode(.onlyEquations)', 'LaTeX("The general solution for $\\sin 2 \\theta = \\sin \\frac{\\pi}{6}$, where $n \\in \\mathbb{Z}$, is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '26',
        '\text{Given that the position vectors of the points P and Q are } \begin{pmatrix} 2 \ -1 \ 8 \end{pmatrix} \text{ and } \begin{pmatrix} -1 \ 4 \ 4 \end{pmatrix} \text{ respectively, the length of the vector PQ is}', '\text{Given that the position vectors of the points P and Q are } \begin{pmatrix} 2 \ -1 \ 8 \end{pmatrix} \text{ and } \begin{pmatrix} -1 \ 4 \ 4 \end{pmatrix} \text{ respectively, the length of the vector PQ is}', 'LaTeX("Given that the position vectors of the points P and Q are $\\begin{pmatrix} 2 \\ -1 \\ 8 \\end{pmatrix}$ and $\\begin{pmatrix} -1 \\ 4 \\ 4 \\end{pmatrix}$ respectively, the length of the vector PQ is").parsingMode(.onlyEquations)', 'LaTeX("Given that the position vectors of the points P and Q are $\\begin{pmatrix} 2 \\ -1 \\ 8 \\end{pmatrix}$ and $\\begin{pmatrix} -1 \\ 4 \\ 4 \\end{pmatrix}$ respectively, the length of the vector PQ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '27',
        '\text{The vector } \mathbf{u} \text{ has magnitude } 4\sqrt{5} \text{ units and is parallel to the vector } \mathbf{v} = \mathbf{i} - 2\mathbf{j} \text{. A unit vector parallel to } \mathbf{u} \text{ is}', '\text{The vector } \mathbf{u} \text{ has magnitude } 4 \sqrt{5} \text{ units and is parallel to the vector } \mathbf{v} = \mathbf{i} - 2\mathbf{j} \text{. A unit vector parallel to } \mathbf{u} \text{ is}', 'LaTeX("The vector $\\mathbf{u}$ has magnitude $4\\sqrt{5}$ units and is parallel to the vector $\\mathbf{v} = \\mathbf{i} - 2\\mathbf{j}$. A unit vector parallel to $\\mathbf{u}$ is").parsingMode(.onlyEquations)', 'LaTeX("The vector $\\mathbf{u}$ has magnitude $4 \\sqrt{5}$ units and is parallel to the vector $\\mathbf{v} = \\mathbf{i} - 2\\mathbf{j}$. A unit vector parallel to $\\mathbf{u}$ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '35',
        '\lim_{x \to 3} \frac{x^2 - 9}{x - 3} \text{ is}', '\lim_{(x \to 3)} \frac{x^2 - 9}{x - 3} \text{ is}', 'LaTeX("$\\lim_{x \\to 3} \\frac{x^2 - 9}{x - 3}$ is").parsingMode(.onlyEquations)', 'LaTeX("$\\lim_{(x \\to 3)} \\frac{x^2 - 9}{x - 3}$ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '37',
        '\text{Given that } y = (2x - 1)^4 , \frac{d^2y}{dx^2} =', '\text{Given that } y = (2x - 1)^4 , \frac{d^2y}{dx^2} =', 'LaTeX("Given that $y = (2x - 1)^4$, $\\frac{d^2y}{dx^2} =$").parsingMode(.onlyEquations)', 'LaTeX("Given that $y = (2x - 1)^4$, $\\frac{d^2y}{dx^2} =$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '43',
        '\text{The volume of the solid generated when the region enclosed by the curve } y = x^2 \text{, the } y \text{-axis and the line } y = 4 \text{ is rotated 360}^\circ \text{ about the } y \text{-axis is}', '\text{The volume of the solid generated when the region enclosed by the curve } y = x^2 \text{, the } y \text{-axis and the line } y = 4 \text{ is rotated 360}^\circ \text{ about the } y \text{-axis is}', 'LaTeX("The volume of the solid generated when the region enclosed by the curve $y = x^2$, the $y$-axis and the line $y = 4$ is rotated 360^\\circ about the $y$-axis is").parsingMode(.onlyEquations)', 'LaTeX("The volume of the solid generated when the region enclosed by the curve $y = x^2$, the $y$-axis and the line $y = 4$ is rotated 360^\\circ about the $y$-axis is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '1',
        '\frac{\sqrt{x}-\sqrt{y}}{\sqrt{x}+\sqrt{y}} \text{ may be expressed as}', '\frac{\sqrt{x}-\sqrt{y}}{\sqrt{x}+\sqrt{y}} \text{ may be expressed as}', 'LaTeX("$\\frac{\\sqrt{x}-\\sqrt{y}}{\\sqrt{x}+\\sqrt{y}}$ may be expressed as").parsingMode(.onlyEquations)', 'LaTeX("$\\frac{\\sqrt{x}-\\sqrt{y}}{\\sqrt{x}+\\sqrt{y}}$ may be expressed as").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '2',
        '\text{Using summation notation, the series } 3 - 9 + 27 - 81 + \dots - 729 \text{ may be represented by}', '\text{Using summation notation, the series } 3 - 9 + 27 - 81 + \dots - 729 \text{ may be represented by}', 'LaTeX("Using summation notation, the series $3 - 9 + 27 - 81 + \\dots - 729$ may be represented by").parsingMode(.onlyEquations)', 'LaTeX("Using summation notation, the series $3 - 9 + 27 - 81 + \\dots - 729$ may be represented by").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '26',
        '\text{The general solution of } \cos 2\theta = \cos \frac{\pi}{3} \text{ is } \theta =', '\text{The general solution of } \cos 2 \theta = \cos \frac{\pi}{3} \text{ is } \theta =', 'LaTeX("The general solution of $\\cos 2\\theta = \\cos \\frac{\\pi}{3}$ is $\\theta =$").parsingMode(.onlyEquations)', 'LaTeX("The general solution of $\\cos 2 \\theta = \\cos \\frac{\\pi}{3}$ is $\\theta =$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '34',
        '\text{A dial on a plane preparing for landing registers the number } 200 + 5 \left\{ \frac{\sin h}{h} \right\} \text{ where } h \text{ is the height above the ground. Just as the plane lands the dial reads}', '\text{A dial on a plane preparing for landing registers the number } 200 + 5 \left\{ \frac{\sin h}{h} \right\} \text{ where } h \text{ is the height above the ground. Just as the plane lands the dial reads}', 'LaTeX("A dial on a plane preparing for landing registers the number $200 + 5 \\left\\{ \\frac{\\sin h}{h} \\right\\}$ where $h$ is the height above the ground. Just as the plane lands the dial reads").parsingMode(.onlyEquations)', 'LaTeX("A dial on a plane preparing for landing registers the number $200 + 5 \\left\\{ \\frac{\\sin h}{h} \\right\\}$ where $h$ is the height above the ground. Just as the plane lands the dial reads").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '36',
        '\lim_{x \to 0} \frac{\sin 3x}{2x} =', '\lim_{(x \to 0)} \frac{\sin 3x}{2x} =', 'LaTeX("$\\lim_{x \\to 0} \\frac{\\sin 3x}{2x} =$").parsingMode(.onlyEquations)', 'LaTeX("$\\lim_{(x \\to 0)} \\frac{\\sin 3x}{2x} =$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '43',
        '\text{The portion of the curve } y = 2x \text{ between } x = a \text{ and } x = b \text{ is rotated } 360^\circ \, (2\pi \, \text{radians}) \text{ about the } x \text{-axis. The volume, } v \text{, of the solid generated is BEST represented as}', '\text{The portion of the curve } y = 2x \text{ between } x = a \text{ and } x = b \text{ is rotated } 360^\circ \, (2 \pi \, \text{radians}) \text{ about the } x \text{-axis. The volume, } v \text{, of the solid generated is BEST represented as}', 'LaTeX("The portion of the curve $y = 2x$ between $x = a$ and $x = b$ is rotated $360^\\circ \\, (2\\pi \\,$radians$)$ about the $x$-axis. The volume, $v$, of the solid generated is BEST represented as").parsingMode(.onlyEquations)', 'LaTeX("The portion of the curve $y = 2x$ between $x = a$ and $x = b$ is rotated $360^\\circ \\, (2 \\pi \\,$radians$)$ about the $x$-axis. The volume, $v$, of the solid generated is BEST represented as").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2023, 'May', 1, '3',
        '\frac{\sqrt{x}-\sqrt{y}}{\sqrt{x}+\sqrt{y}} \text{ may be expressed as}', '\frac{\sqrt{x}-\sqrt{y}}{\sqrt{x}+\sqrt{y}} \text{ may be expressed as}', 'LaTeX("$\\frac{\\sqrt{x}-\\sqrt{y}}{\\sqrt{x}+\\sqrt{y}}$ may be expressed as").parsingMode(.onlyEquations)', 'LaTeX("$\\frac{\\sqrt{x}-\\sqrt{y}}{\\sqrt{x}+\\sqrt{y}}$ may be expressed as").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2023, 'May', 1, '6',
        'P(x) = x^2 - hx - 12h^2 \text{ and } P(\alpha) = 0 \text{. What are the values of } h \text{, in terms of } \alpha \text{?}', 'P(x) = x^2 - hx - 12h^2 \text{ and } P(\alpha) = 0 \text{. What are the values of } h \text{, in terms of } \alpha \text{?}', 'LaTeX("$P(x) = x^2 - hx - 12h^2$ and $P(\\alpha) = 0$. What are the values of $h$, in terms of $\\alpha$?").parsingMode(.onlyEquations)', 'LaTeX("$P(x) = x^2 - hx - 12h^2$ and $P(\\alpha) = 0$. What are the values of $h$, in terms of $\\alpha$?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2023, 'May', 1, '25',
        '\text{Expressed as the product of two trigonometric functions, } \sin \theta + \sin 3\theta =', '\text{Expressed as the product of two trigonometric functions, } \sin \theta + \sin 3 \theta =', 'LaTeX("Expressed as the product of two trigonometric functions, $\\sin \\theta + \\sin 3\\theta =$").parsingMode(.onlyEquations)', 'LaTeX("Expressed as the product of two trigonometric functions, $\\sin \\theta + \\sin 3 \\theta =$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2023, 'May', 1, '27',
        '\text{The vector } \mathbf{u} \text{ has magnitude } 4\sqrt{5} \text{ units and is parallel to the vector } \mathbf{v} = \mathbf{i} - 2\mathbf{j} \text{. A unit vector parallel to } \mathbf{u} \text{ is}', '\text{The vector } \mathbf{u} \text{ has magnitude } 4 \sqrt{5} \text{ units and is parallel to the vector } \mathbf{v} = \mathbf{i} - 2\mathbf{j} \text{. A unit vector parallel to } \mathbf{u} \text{ is}', 'LaTeX("The vector $\\mathbf{u}$ has magnitude $4\\sqrt{5}$ units and is parallel to the vector $\\mathbf{v} = \\mathbf{i} - 2\\mathbf{j}$. A unit vector parallel to $\\mathbf{u}$ is").parsingMode(.onlyEquations)', 'LaTeX("The vector $\\mathbf{u}$ has magnitude $4 \\sqrt{5}$ units and is parallel to the vector $\\mathbf{v} = \\mathbf{i} - 2\\mathbf{j}$. A unit vector parallel to $\\mathbf{u}$ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2023, 'May', 1, '30',
        '\text{Given that the position vectors of the points P and Q are } \begin{pmatrix} 2 \ -1 \ 8 \end{pmatrix} \text{ and } \begin{pmatrix} -1 \ 4 \ 4 \end{pmatrix} \text{ respectively, then the length of the vector PQ is}', '\text{Given that the position vectors of the points P and Q are } \begin{pmatrix} 2 \ -1 \ 8 \end{pmatrix} \text{ and } \begin{pmatrix} -1 \ 4 \ 4 \end{pmatrix} \text{ respectively, then the length of the vector PQ is}', 'LaTeX("Given that the position vectors of the points P and Q are $\\begin{pmatrix} 2 \\ -1 \\ 8 \\end{pmatrix}$ and $\\begin{pmatrix} -1 \\ 4 \\ 4 \\end{pmatrix}$ respectively, then the length of the vector PQ is").parsingMode(.onlyEquations)', 'LaTeX("Given that the position vectors of the points P and Q are $\\begin{pmatrix} 2 \\ -1 \\ 8 \\end{pmatrix}$ and $\\begin{pmatrix} -1 \\ 4 \\ 4 \\end{pmatrix}$ respectively, then the length of the vector PQ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2023, 'May', 1, '35',
        '\lim_{x \to 3} \frac{x^2 - 9}{x - 3} \text{ is}', '\lim_{(x \to 3)} \frac{x^2 - 9}{x - 3} \text{ is}', 'LaTeX("$\\lim_{x \\to 3} \\frac{x^2 - 9}{x - 3}$ is").parsingMode(.onlyEquations)', 'LaTeX("$\\lim_{(x \\to 3)} \\frac{x^2 - 9}{x - 3}$ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2023, 'May', 1, '43',
        '\text{The portion of the curve } y = 2x \text{ between } x = a \text{ and } x = b \text{ is rotated } 360^\circ \, (2\pi \, \text{radians}) \text{ about the } x \text{-axis. The volume, } v \text{, of the solid generated is BEST represented as}', '\text{The portion of the curve } y = 2x \text{ between } x = a \text{ and } x = b \text{ is rotated } 360^\circ \, (2 \pi \, \text{radians}) \text{ about the } x \text{-axis. The volume, } v \text{, of the solid generated is BEST represented as}', 'LaTeX("The portion of the curve $y = 2x$ between $x = a$ and $x = b$ is rotated $360^\\circ \\, (2\\pi \\,$radians$)$ about the $x$-axis. The volume, $v$, of the solid generated is BEST represented as").parsingMode(.onlyEquations)', 'LaTeX("The portion of the curve $y = 2x$ between $x = a$ and $x = b$ is rotated $360^\\circ \\, (2 \\pi \\,$radians$)$ about the $x$-axis. The volume, $v$, of the solid generated is BEST represented as").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2023, 'May', 1, '44',
        '\text{The radius of a circle is increasing at a rate of } 0.1\,\text{cm}\,\text{s}^{-1} \text{. At the instant when the radius is 3 cm, the rate of increase of the area, in } \text{cm}^2\,\text{s}^{-1} \text{, is}', '\text{The radius of a circle is increasing at a rate of } 0.1\,\text{cm}\,\text{s}^{-1} \text{. At the instant when the radius is 3 cm, the rate of increase of the area, in } \text{cm}^2\,\text{s}^{-1} \text{, is}', 'LaTeX("The radius of a circle is increasing at a rate of $0.1\\,$cm$\\,$s$^{-1}$. At the instant when the radius is 3 cm, the rate of increase of the area, in cm$^2\\,$s$^{-1}$, is").parsingMode(.onlyEquations)', 'LaTeX("The radius of a circle is increasing at a rate of $0.1\\,$cm$\\,$s$^{-1}$. At the instant when the radius is 3 cm, the rate of increase of the area, in cm$^2\\,$s$^{-1}$, is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2022, 'May', 1, '1',
        '\frac{\sqrt{x} - \sqrt{y}}{\sqrt{x} + \sqrt{y}} \text{ may be expressed as}', '\frac{\sqrt{x} - \sqrt{y}}{\sqrt{x} + \sqrt{y}} \text{ may be expressed as}', 'LaTeX("$\\frac{\\sqrt{x} - \\sqrt{y}}{\\sqrt{x} + \\sqrt{y}}$ may be expressed as").parsingMode(.onlyEquations)', 'LaTeX("$\\frac{\\sqrt{x} - \\sqrt{y}}{\\sqrt{x} + \\sqrt{y}}$ may be expressed as").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2022 IS NULL OR q.year = 2022)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2022, 'May', 1, '4',
        '3\sqrt{20} - \sqrt{45} + \sqrt{80} \text{ can be simplified as}', '3 \sqrt{20} - \sqrt{45} + \sqrt{80} \text{ can be simplified as}', 'LaTeX("$3\\sqrt{20} - \\sqrt{45} + \\sqrt{80}$ can be simplified as").parsingMode(.onlyEquations)', 'LaTeX("$3 \\sqrt{20} - \\sqrt{45} + \\sqrt{80}$ can be simplified as").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2022 IS NULL OR q.year = 2022)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2022, 'May', 1, '8',
        'P(x) = x^2 - hx - 12h^2 \text{ and } P(\alpha) = 0 \text{. What are the values of } h \text{, in terms of } \alpha \text{?}', 'P(x) = x^2 - hx - 12h^2 \text{ and } P(\alpha) = 0 \text{. What are the values of } h \text{, in terms of } \alpha \text{?}', 'LaTeX("$P(x) = x^2 - hx - 12h^2$ and $P(\\alpha) = 0$. What are the values of $h$, in terms of $\\alpha$?").parsingMode(.onlyEquations)', 'LaTeX("$P(x) = x^2 - hx - 12h^2$ and $P(\\alpha) = 0$. What are the values of $h$, in terms of $\\alpha$?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2022 IS NULL OR q.year = 2022)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2022, 'May', 1, '21',
        '\text{Given that the position vectors of the points P and Q are } \begin{pmatrix} 2 \ -1 \ 8 \end{pmatrix} \text{ and } \begin{pmatrix} -1 \ 4 \ 4 \end{pmatrix} \text{ respectively, the length of the vector PQ is}', '\text{Given that the position vectors of the points P and Q are } \begin{pmatrix} 2 \ -1 \ 8 \end{pmatrix} \text{ and } \begin{pmatrix} -1 \ 4 \ 4 \end{pmatrix} \text{ respectively, the length of the vector PQ is}', 'LaTeX("Given that the position vectors of the points P and Q are $\\begin{pmatrix} 2 \\ -1 \\ 8 \\end{pmatrix}$ and $\\begin{pmatrix} -1 \\ 4 \\ 4 \\end{pmatrix}$ respectively, the length of the vector PQ is").parsingMode(.onlyEquations)', 'LaTeX("Given that the position vectors of the points P and Q are $\\begin{pmatrix} 2 \\ -1 \\ 8 \\end{pmatrix}$ and $\\begin{pmatrix} -1 \\ 4 \\ 4 \\end{pmatrix}$ respectively, the length of the vector PQ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2022 IS NULL OR q.year = 2022)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2022, 'May', 1, '24',
        '\text{The vector } \mathbf{u} \text{ has magnitude } 4\sqrt{5} \text{ units and is parallel to the vector } \mathbf{v} = \mathbf{i} - 2\mathbf{j} \text{. A unit vector parallel to } \mathbf{u} \text{ is}', '\text{The vector } \mathbf{u} \text{ has magnitude } 4 \sqrt{5} \text{ units and is parallel to the vector } \mathbf{v} = \mathbf{i} - 2\mathbf{j} \text{. A unit vector parallel to } \mathbf{u} \text{ is}', 'LaTeX("The vector $\\mathbf{u}$ has magnitude $4\\sqrt{5}$ units and is parallel to the vector $\\mathbf{v} = \\mathbf{i} - 2\\mathbf{j}$. A unit vector parallel to $\\mathbf{u}$ is").parsingMode(.onlyEquations)', 'LaTeX("The vector $\\mathbf{u}$ has magnitude $4 \\sqrt{5}$ units and is parallel to the vector $\\mathbf{v} = \\mathbf{i} - 2\\mathbf{j}$. A unit vector parallel to $\\mathbf{u}$ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2022 IS NULL OR q.year = 2022)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2022, 'May', 1, '31',
        '\text{Given that } y = (2x - 1)^4, \frac{d^2y}{dx^2} =', '\text{Given that } y = (2x - 1)^4, \frac{d^2y}{dx^2} =', 'LaTeX("Given that $y = (2x - 1)^4, \\frac{d^2y}{dx^2} =$").parsingMode(.onlyEquations)', 'LaTeX("Given that $y = (2x - 1)^4, \\frac{d^2y}{dx^2} =$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2022 IS NULL OR q.year = 2022)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2022, 'May', 1, '35',
        '\lim_{x \to 4} \frac{x^2 - 2x - 24}{x^2 - 5x - 36} =', '\lim_{(x \to 4)} \frac{x^2 - 2x - 24}{x^2 - 5x - 36} =', 'LaTeX("$\\lim_{x \\to 4} \\frac{x^2 - 2x - 24}{x^2 - 5x - 36} =$").parsingMode(.onlyEquations)', 'LaTeX("$\\lim_{(x \\to 4)} \\frac{x^2 - 2x - 24}{x^2 - 5x - 36} =$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2022 IS NULL OR q.year = 2022)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2022, 'May', 1, '36',
        '\text{The volume of the solid generated when the area enclosed by the curve } y = x^2 \text{, the } y \text{-axis and the line } y = 4 \text{ is rotated } 360^\circ \text{ about the } y\text{-axis is}', '\text{The volume of the solid generated when the area enclosed by the curve } y = x^2 \text{, the } y \text{-axis and the line } y = 4 \text{ is rotated } 360^\circ \text{ about the } y\text{-axis is}', 'LaTeX("The volume of the solid generated when the area enclosed by the curve $y = x^2$, the $y$-axis and the line $y = 4$ is rotated $360^\\circ$ about the $y$-axis is").parsingMode(.onlyEquations)', 'LaTeX("The volume of the solid generated when the area enclosed by the curve $y = x^2$, the $y$-axis and the line $y = 4$ is rotated $360^\\circ$ about the $y$-axis is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2022 IS NULL OR q.year = 2022)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2022, 'May', 1, '43',
        '\text{The portion of the curve } y = 2x \text{ between } x = a \text{ and } x = b \text{ is rotated } 360^\circ \, (2\pi \, \text{radians}) \text{ about the } x\text{-axis. The volume, } v\text{, of the solid generated is BEST represented as}', '\text{The portion of the curve } y = 2x \text{ between } x = a \text{ and } x = b \text{ is rotated } 360^\circ \, (2 \pi \, \text{radians}) \text{ about the } x\text{-axis. The volume, } v\text{, of the solid generated is BEST represented as}', 'LaTeX("The portion of the curve $y = 2x$ between $x = a$ and $x = b$ is rotated $360^\\circ \\, (2\\pi \\,$radians$)$ about the $x$-axis. The volume, $v$, of the solid generated is BEST represented as").parsingMode(.onlyEquations)', 'LaTeX("The portion of the curve $y = 2x$ between $x = a$ and $x = b$ is rotated $360^\\circ \\, (2 \\pi \\,$radians$)$ about the $x$-axis. The volume, $v$, of the solid generated is BEST represented as").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2022 IS NULL OR q.year = 2022)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '4',
        '4\sqrt{x} + \frac{4\sqrt{3x}}{\sqrt{48}} =', '4 \sqrt{x} + \frac{4 \sqrt{3x}}{\sqrt{48}} =', 'LaTeX("$4\\sqrt{x} + \\frac{4\\sqrt{3x}}{\\sqrt{48}} =$").parsingMode(.onlyEquations)', 'LaTeX("$4 \\sqrt{x} + \\frac{4 \\sqrt{3x}}{\\sqrt{48}} =$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '10',
        '\log_8 18 + 3\log_8 2 - 2\log_8 3 =', '\log_8 18 + 3 \log_8 2 - 2 \log_8 3 =', 'LaTeX("$\\log_8 18 + 3\\log_8 2 - 2\\log_8 3 =$").parsingMode(.onlyEquations)', 'LaTeX("$\\log_8 18 + 3 \\log_8 2 - 2 \\log_8 3 =$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '15',
        '\text{Given that } \alpha, 2\alpha \text{ and } 3\alpha \text{ are the roots of the equation } x^3 + kx^2 + 48 = 0 \text{, the value of the constant } k \text{ is}', '\text{Given that } \alpha, 2 \alpha \text{ and } 3 \alpha \text{ are the roots of the equation } x^3 + kx^2 + 48 = 0 \text{, the value of the constant } k \text{ is}', 'LaTeX("Given that $\\alpha, 2\\alpha$ and $3\\alpha$ are the roots of the equation $x^3 + kx^2 + 48 = 0$, the value of the constant $k$ is").parsingMode(.onlyEquations)', 'LaTeX("Given that $\\alpha, 2 \\alpha$ and $3 \\alpha$ are the roots of the equation $x^3 + kx^2 + 48 = 0$, the value of the constant $k$ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '16',
        '\text{What value of } \theta, 0 \le \theta \le \pi \text{, satisfies the equation } 2\cos^2 \theta + 3\cos \theta - 2 = 0 \text{?}', '\text{What value of } \theta, 0 \le \theta \le \pi \text{, satisfies the equation } 2 \cos^2 \theta + 3 \cos \theta - 2 = 0 \text{?}', 'LaTeX("What value of $\\theta, 0 \\le \\theta \\le \\pi$, satisfies the equation $2\\cos^2 \\theta + 3\\cos \\theta - 2 = 0$?").parsingMode(.onlyEquations)', 'LaTeX("What value of $\\theta, 0 \\le \\theta \\le \\pi$, satisfies the equation $2 \\cos^2 \\theta + 3 \\cos \\theta - 2 = 0$?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '22',
        '\text{Given that } f(\theta) = \cos \theta + 3\sin \theta, r > 0 \text{ and } 0 < \theta < \frac{\pi}{2}, f(\theta) \text{ can be expressed as}', '\text{Given that } f(\theta) = \cos \theta + 3 \sin \theta, r > 0 \text{ and } 0 < \theta < \frac{\pi}{2}, f(\theta) \text{ can be expressed as}', 'LaTeX("Given that $f(\\theta) = \\cos \\theta + 3\\sin \\theta, r > 0$ and $0 < \\theta < \\frac{\\pi}{2}, f(\\theta)$ can be expressed as").parsingMode(.onlyEquations)', 'LaTeX("Given that $f(\\theta) = \\cos \\theta + 3 \\sin \\theta, r > 0$ and $0 < \\theta < \\frac{\\pi}{2}, f(\\theta)$ can be expressed as").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '24',
        '\text{The curve whose Cartesian equation is } \frac{(x-3)^2}{16} + \frac{(y+4)^2}{9} = 1 \text{ may be represented by the parametric equations}', '\text{The curve whose Cartesian equation is } \frac{(x-3)^2}{16} + \frac{(y+4)^2}{9} = 1 \text{ may be represented by the parametric equations}', 'LaTeX("The curve whose Cartesian equation is $\\frac{(x-3)^2}{16} + \\frac{(y+4)^2}{9} = 1$ may be represented by the parametric equations").parsingMode(.onlyEquations)', 'LaTeX("The curve whose Cartesian equation is $\\frac{(x-3)^2}{16} + \\frac{(y+4)^2}{9} = 1$ may be represented by the parametric equations").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '25',
        '\text{Expressed as the product of two trigonometric functions, } \sin \theta + \sin 3\theta =', '\text{Expressed as the product of two trigonometric functions, } \sin \theta + \sin 3 \theta =', 'LaTeX("Expressed as the product of two trigonometric functions, $\\sin \\theta + \\sin 3\\theta =$").parsingMode(.onlyEquations)', 'LaTeX("Expressed as the product of two trigonometric functions, $\\sin \\theta + \\sin 3 \\theta =$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '28',
        '\text{A curve } C \text{ is given by the parametric equations } x = 4\sin \theta, y = 3\cos \theta \text{. The Cartesian equation of } C \text{ is}', '\text{A curve } C \text{ is given by the parametric equations } x = 4 \sin \theta, y = 3 \cos \theta \text{. The Cartesian equation of } C \text{ is}', 'LaTeX("A curve $C$ is given by the parametric equations $x = 4\\sin \\theta, y = 3\\cos \\theta$. The Cartesian equation of $C$ is").parsingMode(.onlyEquations)', 'LaTeX("A curve $C$ is given by the parametric equations $x = 4 \\sin \\theta, y = 3 \\cos \\theta$. The Cartesian equation of $C$ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '30',
        '\text{The general solution of } \cos 2\theta = \cos \frac{\pi}{3} \text{ is } \theta =', '\text{The general solution of } \cos 2 \theta = \cos \frac{\pi}{3} \text{ is } \theta =', 'LaTeX("The general solution of $\\cos 2\\theta = \\cos \\frac{\\pi}{3}$ is $\\theta =$").parsingMode(.onlyEquations)', 'LaTeX("The general solution of $\\cos 2 \\theta = \\cos \\frac{\\pi}{3}$ is $\\theta =$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '33',
        '\text{Given } y = 3x^2 - 4\cos 5x, \text{ then } \frac{d^2y}{dx^2} \text{ is equal to}', '\text{Given } y = 3x^2 - 4 \cos 5x, \text{ then } \frac{d^2y}{dx^2} \text{ is equal to}', 'LaTeX("Given $y = 3x^2 - 4\\cos 5x,$ then $\\frac{d^2y}{dx^2}$ is equal to").parsingMode(.onlyEquations)', 'LaTeX("Given $y = 3x^2 - 4 \\cos 5x,$ then $\\frac{d^2y}{dx^2}$ is equal to").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '34',
        '\text{A dial on a plane preparing for landing registers the number } 200 + 5 \left[ \frac{\sin h}{h} \right] \text{, where } h \text{ is the height above the ground. Just as the plane lands the dial reads}', '\text{A dial on a plane preparing for landing registers the number } 200 + 5 \left[ \frac{\sin h}{h} \right] \text{, where } h \text{ is the height above the ground. Just as the plane lands the dial reads}', 'LaTeX("A dial on a plane preparing for landing registers the number $200 + 5 \\left[ \\frac{\\sin h}{h} \\right]$, where $h$ is the height above the ground. Just as the plane lands the dial reads").parsingMode(.onlyEquations)', 'LaTeX("A dial on a plane preparing for landing registers the number $200 + 5 \\left[ \\frac{\\sin h}{h} \\right]$, where $h$ is the height above the ground. Just as the plane lands the dial reads").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '35',
        '\lim_{x \rightarrow 1} \frac{x^2 - 3x + 2}{x^2 - 4x + 3} =', '\lim_{(x \rightarrow 1)} \frac{x^2 - 3x + 2}{x^2 - 4x + 3} =', 'LaTeX("$\\lim_{x \\rightarrow 1} \\frac{x^2 - 3x + 2}{x^2 - 4x + 3} =$").parsingMode(.onlyEquations)', 'LaTeX("$\\lim_{(x \\rightarrow 1)} \\frac{x^2 - 3x + 2}{x^2 - 4x + 3} =$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '37',
        '\text{The radius of a circle is increasing at a rate of } 0.1\,\text{cm}\,\text{s}^{-1} \text{. At the instant when the radius is 3 cm, the rate of increase of the area, in } \text{cm}^2\,\text{s}^{-1} \text{, is}', '\text{The radius of a circle is increasing at a rate of } 0.1\,\text{cm}\,\text{s}^{-1} \text{. At the instant when the radius is 3 cm, the rate of increase of the area, in } \text{cm}^2\,\text{s}^{-1} \text{, is}', 'LaTeX("The radius of a circle is increasing at a rate of $0.1\\,$cm$\\,$s$^{-1}$. At the instant when the radius is 3 cm, the rate of increase of the area, in cm$^2\\,$s$^{-1}$, is").parsingMode(.onlyEquations)', 'LaTeX("The radius of a circle is increasing at a rate of $0.1\\,$cm$\\,$s$^{-1}$. At the instant when the radius is 3 cm, the rate of increase of the area, in cm$^2\\,$s$^{-1}$, is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '41',
        '\text{Given that } 2\sin^2 x = 1 - \cos 2x \text{, then } \int \sin^2 \frac{x}{4} \, dx =', '\text{Given that } 2 \sin^2 x = 1 - \cos 2x \text{, then } \int \sin^2 \frac{x}{4} \, dx =', 'LaTeX("Given that $2\\sin^2 x = 1 - \\cos 2x$, then $\\int \\sin^2 \\frac{x}{4} \\, dx =$").parsingMode(.onlyEquations)', 'LaTeX("Given that $2 \\sin^2 x = 1 - \\cos 2x$, then $\\int \\sin^2 \\frac{x}{4} \\, dx =$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '43',
        '\text{The portion of the curve } y = 2x \text{ between } x = a \text{ and } x = b \text{ is rotated } 360^\circ \text{ (} 2\pi \text{ radians) about the x-axis. The volume, } v \text{, of the solid generated is BEST represented as}', '\text{The portion of the curve } y = 2x \text{ between } x = a \text{ and } x = b \text{ is rotated } 360^\circ \text{ (} 2 \pi \text{ radians) about the x-axis. The volume, } v \text{, of the solid generated is BEST represented as}', 'LaTeX("The portion of the curve $y = 2x$ between $x = a$ and $x = b$ is rotated 360^\\circ ( 2\\pi radians) about the x-axis. The volume, $v$, of the solid generated is BEST represented as").parsingMode(.onlyEquations)', 'LaTeX("The portion of the curve $y = 2x$ between $x = a$ and $x = b$ is rotated 360^\\circ ( 2 \\pi radians) about the x-axis. The volume, $v$, of the solid generated is BEST represented as").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '45',
        '\int_{0}^{\frac{\pi}{2}} 2\cos 5x \, dx \text{ is}', '\int_{0}^{\frac{\pi}{2}} 2 \cos 5x \, dx \text{ is}', 'LaTeX("$\\int_{0}^{\\frac{\\pi}{2}} 2\\cos 5x \\, dx$ is").parsingMode(.onlyEquations)', 'LaTeX("$\\int_{0}^{\\frac{\\pi}{2}} 2 \\cos 5x \\, dx$ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2026, 'May', 2, '2',
        '4', '4', 'Use the substitution  $u = \cos^{-1} \frac{1}{2}x$  to show that  $\int_0^1 \frac{\cos^{-1} \frac{1}{2}x}{\sqrt{4 - x^2}} \, dx = \frac{5\pi^2}{72}$.', 'Use the substitution  $u = \cos^{(-$2)} \frac{1}{2}x$  to show that  $\int_0^1 \frac{\cos^{(-$2)} \frac{1}{2}x}{\sqrt{4 - x^2}} \, dx = \frac{5 \pi^2}{72}$.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 2 AND q.number = 2
      AND (2026 IS NULL OR q.year = 2026)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2026, 'May', 2, '3',
        '3', '3', 'Hence, use the method of differences to show that  $\sum_{r=1}^n \frac{4}{(2r+1)(2r+3)} = 2 \left( \frac{1}{3} - \frac{1}{2n+3} \right)$.', 'Hence, use the method of differences to show that  $\sum_{(r=1)}^n \frac{4}{(2r+1)(2r+3)} = 2 \left( \frac{1}{3} - \frac{1}{2n+3} \right)$.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 2 AND q.number = 2
      AND (2026 IS NULL OR q.year = 2026)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2026, 'May', 2, '3',
        '2', '2', 'Hence, calculate  $\sum_{r=1}^{\infty} \frac{4}{(2r+1)(2r+3)}$.', 'Hence, calculate  $\sum_{(r=1)}^{\infty} \frac{4}{(2r+1)(2r+3)}$.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 2 AND q.number = 2
      AND (2026 IS NULL OR q.year = 2026)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2024, 'May', 2, '1',
        '2', '2', 'Differentiate  $\cos^{-1} (3x - 2)$, expressing your answer in its simplest form.', 'Differentiate  $\cos^{(-$2)} (3x - 2)$, expressing your answer in its simplest form.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 2 AND q.number = 2
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2024, 'May', 2, '4',
        '2', '2', 'Calculate  $\sum_{r=11}^{27} r$.', 'Calculate  $\sum_{(r=11)}^{27} r$.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 2 AND q.number = 2
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2023, 'May', 2, '4',
        '3', '3', 'Show that  $\theta_{n+1} = \sin^{-1} \left( \frac{2}{8 - \theta_n^2} \right)$  is a suitable iteration for the approximation of the roots of the equation  $\csc \theta = 4 - \frac{1}{2} \theta^2$.', 'Show that  $\theta_{n+1} = \sin^{(-$2)} \left( \frac{2}{8 - \theta_n^2} \right)$  is a suitable iteration for the approximation of the roots of the equation  $\csc \theta = 4 - \frac{1}{2} \theta^2$.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 2 AND q.number = 2
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2026, 'May', 2, '3',
        '2', '2', 'Derive the identity for  $\cos 2\theta$  in terms of  $\cos \theta$  only.', 'Derive the identity for  $\cos 2 \theta$  in terms of  $\cos \theta$  only.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 2 AND q.number = 2
      AND (2026 IS NULL OR q.year = 2026)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2026, 'May', 2, '3',
        '3', '3', 'Hence, solve  $\cos 2\theta - 3 \cos \theta = 1$  for  $0 \leq \theta \leq 2\pi$.', 'Hence, solve  $\cos 2 \theta - 3 \cos \theta = 1$  for  $0 \leq \theta \leq 2 \pi$.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 2 AND q.number = 2
      AND (2026 IS NULL OR q.year = 2026)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2026, 'May', 2, '5',
        '2', '2', 'a) Determine the value of  $\lim_{x \to -5^+} f(x)$
b) Determine the value of  $\lim_{x \to 5} f(x)$.', 'a) Determine the value of  $\lim_{(x \to -5^+)} f(x)$
b) Determine the value of  $\lim_{(x \to 5)} f(x)$.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 2 AND q.number = 2
      AND (2026 IS NULL OR q.year = 2026)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2026, 'May', 2, '5',
        '2', '2', 'State the value of  $k$  such that  $\lim_{x \to k} f(x) = -2$.', 'State the value of  $k$  such that  $\lim_{(x \to k)} f(x) = -2$.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 2 AND q.number = 2
      AND (2026 IS NULL OR q.year = 2026)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2026, 'May', 2, '5',
        '2', '2', 'a) Determine  $g(1)$
b) Determine  $\lim_{x \to 1} g(x)$.', 'a) Determine  $g(1)$
b) Determine  $\lim_{(x \to 1)} g(x)$.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 2 AND q.number = 2
      AND (2026 IS NULL OR q.year = 2026)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2025, 'May', 2, '4',
        '3', '3', 'Show that  $\frac{1 - \cos 2\alpha}{\sin 2\alpha} \equiv \tan \alpha.$', 'Show that  $\frac{1 - \cos 2 \alpha}{\sin 2 \alpha} \equiv \tan \alpha.$',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 2 AND q.number = 2
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2025, 'May', 2, '5',
        '2', '2', 'Evaluate  $\lim_{x \to 0} \frac{\sin 3x}{2x}.$', 'Evaluate  $\lim_{(x \to 0)} \frac{\sin 3x}{2x}.$',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 2 AND q.number = 2
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2025, 'May', 2, '5',
        '4', '4', 'Water is flowing into an empty right circular cone at a constant rate of  $8\,$cm$^3$  per minute. The depth of the liquid in the cone at time,  $t,$  in minutes, is  $x\,$cm$.$
The angle,  $\alpha,$  between the perpendicular height,  $h,$  of the cone and the slant height is
$\tan^{-1} \frac{\sqrt{3}}{3}$  and the volume of the cone can be calculated as  $V = \frac{1}{3} \pi r^2 h.$
(i) Show that the volume,  $V\,$cm$^3,$  of water in the cone when the depth is  $x\,$cm  can be
expressed as  $V = \frac{1}{9} \pi x^3.$', 'Water is flowing into an empty right circular cone at a constant rate of  $8\,$cm$^3$  per minute. The depth of the liquid in the cone at time,  $t,$  in minutes, is  $x\,$cm$.$
The angle,  $\alpha,$  between the perpendicular height,  $h,$  of the cone and the slant height is
$\tan^{(-$2)} \frac{\sqrt{3}}{3}$  and the volume of the cone can be calculated as  $V = \frac{1}{3} \pi r^2 h.$
(i) Show that the volume,  $V\,$cm$^3,$  of water in the cone when the depth is  $x\,$cm  can be
expressed as  $V = \frac{1}{9} \pi x^3.$',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 2 AND q.number = 2
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2023, 'May', 2, '3',
        '3', '3', 'Solve the equation  $2 \cos^2 x - 3 \sin x = 3$  for  $0 < x < 2\pi$.', 'Solve the equation  $2 \cos^2 x - 3 \sin x = 3$  for  $0 < x < 2 \pi$.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 2 AND q.number = 2
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2023, 'May', 2, '5',
        '2', '2', 'Determine  $\lim_{x \rightarrow \infty} \frac{2x^3 - 4x + 1}{3x^4 + x^2 - 2}$.', 'Determine  $\lim_{(x \rightarrow \infty)} \frac{2x^3 - 4x + 1}{3x^4 + x^2 - 2}$.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 2 AND q.number = 2
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2023, 'May', 2, '6',
        '4', '4', 'The diagram below shows the curves  $y = \cos x$  and  $y = \sin x$.  Determine the area bounded by the curves between  $x = \frac{\pi}{4}$  and  $x = \frac{3\pi}{2}$.', 'The diagram below shows the curves  $y = \cos x$  and  $y = \sin x$.  Determine the area bounded by the curves between  $x = \frac{\pi}{4}$  and  $x = \frac{3 \pi}{2}$.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%PureMathematics%') AND q.paper = 2 AND q.number = 2
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2024, 'May', 2, '6',
        '3', '3', 'A car which has a mass of 1500 kg travels along a straight horizontal road at a constant speed of  $27 \,$ms$^{-1}$. The car then travels at a constant speed up a hill inclined at an angle  $\theta = \sin^{-1}(0.2)$. Determine the power of the engine if the speed of the car is  $15 \,$ms$^{-1}$  and the resistance to motion is 600 N.', 'A car which has a mass of 1500 kg travels along a straight horizontal road at a constant speed of  $27 \,$ms$^{-1}$. The car then travels at a constant speed up a hill inclined at an angle  $\theta = \sin^{(-$2)}(0.2)$. Determine the power of the engine if the speed of the car is  $15 \,$ms$^{-1}$  and the resistance to motion is 600 N.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%AppliedMathematics%') AND q.paper = 2 AND q.number = 2
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2025, 'May', 2, '6',
        '2', '2', 'Every hour, a conveyor belt carries 50 000 packages 75 metres up a slope whose inclination is  $\sin^{-1}(\frac{1}{10})$. Each package weighs 45 N and the power absorbed by friction in driving the conveyor belt is 2000 W. Calculate the work done to lift the 50 000 packages.', 'Every hour, a conveyor belt carries 50 000 packages 75 metres up a slope whose inclination is  $\sin^{(-$2)}(\frac{1}{10})$. Each package weighs 45 N and the power absorbed by friction in driving the conveyor belt is 2000 W. Calculate the work done to lift the 50 000 packages.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%AppliedMathematics%') AND q.paper = 2 AND q.number = 2
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2025, 'May', 2, '6',
        '2', '2', 'Every hour, a conveyor belt carries 50 000 packages 75 metres up a slope whose inclination is  $\sin^{-1}(\frac{1}{10})$. Each package weighs 45 N and the power absorbed by friction in driving the conveyor belt is 2000 W. Calculate the power required to lift the packages.', 'Every hour, a conveyor belt carries 50 000 packages 75 metres up a slope whose inclination is  $\sin^{(-$2)}(\frac{1}{10})$. Each package weighs 45 N and the power absorbed by friction in driving the conveyor belt is 2000 W. Calculate the power required to lift the packages.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%AppliedMathematics%') AND q.paper = 2 AND q.number = 2
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2025, 'May', 2, '6',
        '3', '3', 'Every hour, a conveyor belt carries 50 000 packages 75 metres up a slope whose inclination is  $\sin^{-1}(\frac{1}{10})$. Each package weighs 45 N and the power absorbed by friction in driving the conveyor belt is 2000 W. Hence, show that the total power output of the motor is 6687.5 W.', 'Every hour, a conveyor belt carries 50 000 packages 75 metres up a slope whose inclination is  $\sin^{(-$2)}(\frac{1}{10})$. Each package weighs 45 N and the power absorbed by friction in driving the conveyor belt is 2000 W. Hence, show that the total power output of the motor is 6687.5 W.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%AppliedMathematics%') AND q.paper = 2 AND q.number = 2
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2026, 'May', 2, '2',
        '2', '2', 'Figure 2 shows a single cycle of an a.c. voltage,  $V_{$supply$}$, represented by the equations  $V_{$supply$} = V_p \sin \omega t = V_p \sin 2\pi ft$. State the meaning of EACH symbol in the table below and use Figure 2 to determine each value.', 'Figure 2 shows a single cycle of an a.c. voltage,  $V_{$supply$}$, represented by the equations  $V_{$supply$} = V_p \sin \omega t = V_p \sin 2 \pi ft$. State the meaning of EACH symbol in the table below and use Figure 2 to determine each value.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 2 AND q.number = 2
      AND (2026 IS NULL OR q.year = 2026)
    LIMIT 1;