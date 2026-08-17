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
        q.id, s.name, 1, 2024, 'May', 1, '23',
        '\text{The coefficient of the } ( x^4 ) \text{ term in the expansion of } ( (3x + 2y)^7 ) \text{ is}', '\text{The coefficient of the } ( x^4 ) \text{ term in the expansion of } ( (3x + 2y)^7 ) \text{ is}', 'LaTeX("The coefficient of the $( x^4 )$ term in the expansion of $( (3x + 2y)^7 )$ is").parsingMode(.onlyEquations)', 'LaTeX("The coefficient of the $( x^4 )$ term in the expansion of $( (3x + 2y)^7 )$ is").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2024, 'May', 1, '32',
        '\text{What is the probability that in 5 tosses of a fair die exactly three 5s will occur?}', '\text{What is the probability that in 5 tosses of a fair die exactly three 5s will occur?}', 'LaTeX("What is the probability that in 5 tosses of a fair die exactly three 5s will occur?").parsingMode(.onlyEquations)', 'LaTeX("What is the probability that in 5 tosses of a fair die exactly three 5s will occur?").parsingMode(.onlyEquations)',
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
        '( \frac{d}{dx} \cos^{-1} [ \frac{x}{2} ] ) \text{ is equal to}', '( \frac{d}{dx} \cos^{(-1)} [ \frac{x}{2} ] ) \text{ is equal to}', 'LaTeX("$( \\frac{d}{dx} \\cos^{-1} [ \\frac{x}{2} ] )$ is equal to").parsingMode(.onlyEquations)', 'LaTeX("$( \\frac{d}{dx} \\cos^{(-1)} [ \\frac{x}{2} ] )$ is equal to").parsingMode(.onlyEquations)',
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
        '\text{Given that } ( S_n = \sum_{l=1}^n [ \frac{1}{l} - \frac{1}{l+1} ] ), ( \lim_{n \to \infty} S_n ) \text{ is}', '\text{Given that } ( S_n = \sum_{l=1}^n [ \frac{1}{l} - \frac{1}{l+1} ] ), ( \lim_{(n \to \infty)} S_n ) \text{ is}', 'LaTeX("Given that $( S_n = \\sum_{l=1}^n [ \\frac{1}{l} - \\frac{1}{l+1} ] ), ( \\lim_{n \\to \\infty} S_n )$ is").parsingMode(.onlyEquations)', 'LaTeX("Given that $( S_n = \\sum_{l=1}^n [ \\frac{1}{l} - \\frac{1}{l+1} ] ), ( \\lim_{(n \\to \\infty)} S_n )$ is").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2020, 'May', 1, '15',
        '\text{Item 15 refers to the following table which shows data from the balance of payments figures of a Caribbean territory.

What is the balance on the current account?}', '\text{Item 15 refers to the following table which shows data from the balance of payments figures of a Caribbean territory.

What is the balance on the current account?}', 'LaTeX("Item 15 refers to the following table which shows data from the balance of payments figures of a Caribbean territory.\n\nWhat is the balance on the current account?").parsingMode(.onlyEquations)', 'LaTeX("Item 15 refers to the following table which shows data from the balance of payments figures of a Caribbean territory.\n\nWhat is the balance on the current account?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Economics%') AND q.paper = 1 AND q.number = 1
      AND (2020 IS NULL OR q.year = 2020)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2022, 'May', 1, '15',
        '\text{Item 15 refers to the following table which shows data from the balance of payments figures of a Caribbean territory.

What is the balance on the current account?}', '\text{Item 15 refers to the following table which shows data from the balance of payments figures of a Caribbean territory.

What is the balance on the current account?}', 'LaTeX("Item 15 refers to the following table which shows data from the balance of payments figures of a Caribbean territory.\n\nWhat is the balance on the current account?").parsingMode(.onlyEquations)', 'LaTeX("Item 15 refers to the following table which shows data from the balance of payments figures of a Caribbean territory.\n\nWhat is the balance on the current account?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Economics%') AND q.paper = 1 AND q.number = 1
      AND (2022 IS NULL OR q.year = 2022)
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
        q.id, s.name, 1, 2020, 'May', 1, '1',
        '\text{If } ( x = 3\text{ mg} ) \text{ and } ( y = 9\text{ kg} ) \text{ then}', '\text{If } ( x = 3 \text{ mg} ) \text{ and } ( y = 9 \text{ kg} ) \text{ then}', 'LaTeX("If $( x = 3$ mg$)$ and $( y = 9$ kg$)$ then").parsingMode(.onlyEquations)', 'LaTeX("If $( x = 3$ mg$)$ and $( y = 9$ kg$)$ then").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2020, 'May', 1, '3',
        '\text{During training, a boy runs a circular } ( 400\text{ m} ) \text{ track at a constant speed of } ( 5\text{ m s}^{-1} ) \text{. What is his angular velocity?}', '\text{During training, a boy runs a circular } ( 400 \text{ m} ) \text{ track at a constant speed of } ( 5 \text{ m s}^{-1} ) \text{. What is his angular velocity?}', 'LaTeX("During training, a boy runs a circular $( 400$ m$)$ track at a constant speed of $( 5$ m s$^{-1} )$. What is his angular velocity?").parsingMode(.onlyEquations)', 'LaTeX("During training, a boy runs a circular $( 400$ m$)$ track at a constant speed of $( 5$ m s$^{-1} )$. What is his angular velocity?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2020, 'May', 1, '4',
        '\text{A student measures the circumference of a circular room of radius } ( 5.00\text{ m} ) \text{ and obtains the result of } ( 31.41\text{ m} ) \text{.}
\text{Which of the following statements is correct?}', '\text{A student measures the circumference of a circular room of radius } ( 5.00 \text{ m} ) \text{ and obtains the result of } ( 31.41 \text{ m} ) \text{.}
\text{Which of the following statements is correct?}', 'LaTeX("A student measures the circumference of a circular room of radius $( 5.00$ m$)$ and obtains the result of $( 31.41$ m$)$.\nWhich of the following statements is correct?").parsingMode(.onlyEquations)', 'LaTeX("A student measures the circumference of a circular room of radius $( 5.00$ m$)$ and obtains the result of $( 31.41$ m$)$.\nWhich of the following statements is correct?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2020, 'May', 1, '5',
        '\text{Which of the following units gives the dimensions of the universal gravitational constant, } ( G ) \text{?}', '\text{Which of the following units gives the dimensions of the universal gravitational constant, } ( G ) \text{?}', 'LaTeX("Which of the following units gives the dimensions of the universal gravitational constant, $( G )$?").parsingMode(.onlyEquations)', 'LaTeX("Which of the following units gives the dimensions of the universal gravitational constant, $( G )$?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2020, 'May', 1, '6',
        '\text{A tennis ball is given a horizontal velocity of } ( 8\text{ m s}^{-1} ) \text{ when it is hit at a height } ( 1.8\text{ m} ) \text{ above the ground. The ball is in the air for}', '\text{A tennis ball is given a horizontal velocity of } ( 8 \text{ m s}^{-1} ) \text{ when it is hit at a height } ( 1.8 \text{ m} ) \text{ above the ground. The ball is in the air for}', 'LaTeX("A tennis ball is given a horizontal velocity of $( 8$ m s$^{-1} )$ when it is hit at a height $( 1.8$ m$)$ above the ground. The ball is in the air for").parsingMode(.onlyEquations)', 'LaTeX("A tennis ball is given a horizontal velocity of $( 8$ m s$^{-1} )$ when it is hit at a height $( 1.8$ m$)$ above the ground. The ball is in the air for").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2020, 'May', 1, '10',
        '\text{A train travels with a velocity of } ( 5\text{ m s}^{-1} ) \text{ and then accelerates uniformly for a distance of } ( 50\text{ m} ) \text{. If the train reaches a velocity of } ( 15\text{ m s}^{-1} ) \text{, what is the acceleration of the train?}', '\text{A train travels with a velocity of } ( 5 \text{ m s}^{-1} ) \text{ and then accelerates uniformly for a distance of } ( 50 \text{ m} ) \text{. If the train reaches a velocity of } ( 15 \text{ m s}^{-1} ) \text{, what is the acceleration of the train?}', 'LaTeX("A train travels with a velocity of $( 5$ m s$^{-1} )$ and then accelerates uniformly for a distance of $( 50$ m$)$. If the train reaches a velocity of $( 15$ m s$^{-1} )$, what is the acceleration of the train?").parsingMode(.onlyEquations)', 'LaTeX("A train travels with a velocity of $( 5$ m s$^{-1} )$ and then accelerates uniformly for a distance of $( 50$ m$)$. If the train reaches a velocity of $( 15$ m s$^{-1} )$, what is the acceleration of the train?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2020, 'May', 1, '18',
        '\text{The power of a lens of focal length } ( 15\text{ cm} ) \text{ is}', '\text{The power of a lens of focal length } ( 15 \text{ cm} ) \text{ is}', 'LaTeX("The power of a lens of focal length $( 15$ cm$)$ is").parsingMode(.onlyEquations)', 'LaTeX("The power of a lens of focal length $( 15$ cm$)$ is").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2020, 'May', 1, '20',
        '\text{A beam of monochromatic light is incident normally on a diffraction grating having 500 lines per millimetre. If the second order of diffraction is found at } ( 30^\circ ) \text{ to the normal, what is the wavelength of light used?}', '\text{A beam of monochromatic light is incident normally on a diffraction grating having 500 lines per millimetre. If the second order of diffraction is found at } ( 30^\circ ) \text{ to the normal, what is the wavelength of light used?}', 'LaTeX("A beam of monochromatic light is incident normally on a diffraction grating having 500 lines per millimetre. If the second order of diffraction is found at $( 30^\\circ )$ to the normal, what is the wavelength of light used?").parsingMode(.onlyEquations)', 'LaTeX("A beam of monochromatic light is incident normally on a diffraction grating having 500 lines per millimetre. If the second order of diffraction is found at $( 30^\\circ )$ to the normal, what is the wavelength of light used?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2020, 'May', 1, '23',
        '\text{Item 23 refers to the following diagram which represents the waveform produced when a speaker is held over one open end of a pipe of length } ( 85\text{ cm} ) \text{.}
\text{If the speed of sound is } ( 340\text{ m s}^{-1} ) \text{, what is the waveform''s fundamental frequency?}', '\text{Item 23 refers to the following diagram which represents the waveform produced when a speaker is held over one open end of a pipe of length } ( 85 \text{ cm} ) \text{.}
\text{If the speed of sound is } ( 340 \text{ m s}^{-1} ) \text{, what is the waveform''s fundamental frequency?}', 'LaTeX("Item 23 refers to the following diagram which represents the waveform produced when a speaker is held over one open end of a pipe of length $( 85$ cm$)$.\nIf the speed of sound is $( 340$ m s$^{-1} )$, what is the waveform''s fundamental frequency?").parsingMode(.onlyEquations)', 'LaTeX("Item 23 refers to the following diagram which represents the waveform produced when a speaker is held over one open end of a pipe of length $( 85$ cm$)$.\nIf the speed of sound is $( 340$ m s$^{-1} )$, what is the waveform''s fundamental frequency?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2020, 'May', 1, '24',
        '\text{A student''s range of hearing is from } ( 40\text{ Hz} ) \text{ to } ( 15\text{ kHZ} ) \text{. What is the SHORTEST wavelength of sound she can hear if the speed of sound in air is } ( 330\text{ m s}^{-1} ) \text{?}', '\text{A student''s range of hearing is from } ( 40 \text{ Hz} ) \text{ to } ( 15 \text{ kHZ} ) \text{. What is the SHORTEST wavelength of sound she can hear if the speed of sound in air is } ( 330 \text{ m s}^{-1} ) \text{?}', 'LaTeX("A student''s range of hearing is from $( 40$ Hz$)$ to $( 15$ kHZ$)$. What is the SHORTEST wavelength of sound she can hear if the speed of sound in air is $( 330$ m s$^{-1} )$?").parsingMode(.onlyEquations)', 'LaTeX("A student''s range of hearing is from $( 40$ Hz$)$ to $( 15$ kHZ$)$. What is the SHORTEST wavelength of sound she can hear if the speed of sound in air is $( 330$ m s$^{-1} )$?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2020, 'May', 1, '25',
        '\text{Item 25 refers to the following two graphs which display the variation of displacement, with time and distance respectively, for the motion of a wave.}
\text{What is the velocity of the wave?}', '\text{Item 25 refers to the following two graphs which display the variation of displacement, with time and distance respectively, for the motion of a wave.}
\text{What is the velocity of the wave?}', 'LaTeX("Item 25 refers to the following two graphs which display the variation of displacement, with time and distance respectively, for the motion of a wave.\nWhat is the velocity of the wave?").parsingMode(.onlyEquations)', 'LaTeX("Item 25 refers to the following two graphs which display the variation of displacement, with time and distance respectively, for the motion of a wave.\nWhat is the velocity of the wave?").parsingMode(.onlyEquations)',
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
        '\text{Two progressive waves with a phase difference of } ( \pi ) \text{ undergo superposition. If each of these waves has an amplitude of } ( 5\text{ cm} ) \text{, what is their resulting amplitude?}', '\text{Two progressive waves with a phase difference of } ( \pi ) \text{ undergo superposition. If each of these waves has an amplitude of } ( 5 \text{ cm} ) \text{, what is their resulting amplitude?}', 'LaTeX("Two progressive waves with a phase difference of $( \\pi )$ undergo superposition. If each of these waves has an amplitude of $( 5$ cm$)$, what is their resulting amplitude?").parsingMode(.onlyEquations)', 'LaTeX("Two progressive waves with a phase difference of $( \\pi )$ undergo superposition. If each of these waves has an amplitude of $( 5$ cm$)$, what is their resulting amplitude?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2020, 'May', 1, '28',
        '\text{A ship sends down a pulse of sound to measure the depth of the sea. The echo is detected } ( 0.1\text{ s} ) \text{ later. Assuming that sound waves travel five times faster in sea water than in the air, how deep is the sea at this point?}
\text{(Speed of sound in air } = 330\text{ m s}^{-1} )', '\text{A ship sends down a pulse of sound to measure the depth of the sea. The echo is detected } ( 0.1 \text{ s} ) \text{ later. Assuming that sound waves travel five times faster in sea water than in the air, how deep is the sea at this point?}
\text{(Speed of sound in air } = 330 \text{ m s}^{-1} )', 'LaTeX("A ship sends down a pulse of sound to measure the depth of the sea. The echo is detected $( 0.1$ s$)$ later. Assuming that sound waves travel five times faster in sea water than in the air, how deep is the sea at this point?\n(Speed of sound in air $= 330$ m s$^{-1} )$").parsingMode(.onlyEquations)', 'LaTeX("A ship sends down a pulse of sound to measure the depth of the sea. The echo is detected $( 0.1$ s$)$ later. Assuming that sound waves travel five times faster in sea water than in the air, how deep is the sea at this point?\n(Speed of sound in air $= 330$ m s$^{-1} )$").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2020, 'May', 1, '32',
        '\text{An immersion heater rated at } ( 150\text{ W} ) \text{ is fitted into a large block of ice at } ( 0\text{ }^\circ\text{C} ) \text{. The specific latent heat of fusion of the ice is } ( 3 \times 10^5\text{ J kg}^{-1} ) \text{. How long will it take to melt } ( 10\text{ g} ) \text{ of ice?}', '\text{An immersion heater rated at } ( 150 \text{ W} ) \text{ is fitted into a large block of ice at } ( 0 \text{ }^\circ\text{C} ) \text{. The specific latent heat of fusion of the ice is } ( 3 \times 10^5 \text{ J kg}^{-1} ) \text{. How long will it take to melt } ( 10 \text{ g} ) \text{ of ice?}', 'LaTeX("An immersion heater rated at $( 150$ W$)$ is fitted into a large block of ice at $( 0$ $^\\circ$C$)$. The specific latent heat of fusion of the ice is $( 3 \\times 10^5$ J kg$^{-1} )$. How long will it take to melt $( 10$ g$)$ of ice?").parsingMode(.onlyEquations)', 'LaTeX("An immersion heater rated at $( 150$ W$)$ is fitted into a large block of ice at $( 0$ $^\\circ$C$)$. The specific latent heat of fusion of the ice is $( 3 \\times 10^5$ J kg$^{-1} )$. How long will it take to melt $( 10$ g$)$ of ice?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2020, 'May', 1, '33',
        '\text{An uncalibrated mercury-in-glass thermometer when placed in a cup of water indicates the top of the mercury stem to be } ( 14\text{ cm} ) \text{ above the bulb. On placing the thermometer in pure melting ice, the height is } ( 4\text{ cm} ) \text{ and in steam above pure boiling water, the height is } ( 28\text{ cm} ) \text{. What is the temperature of the water in the cup?}', '\text{An uncalibrated mercury-in-glass thermometer when placed in a cup of water indicates the top of the mercury stem to be } ( 14 \text{ cm} ) \text{ above the bulb. On placing the thermometer in pure melting ice, the height is } ( 4 \text{ cm} ) \text{ and in steam above pure boiling water, the height is } ( 28 \text{ cm} ) \text{. What is the temperature of the water in the cup?}', 'LaTeX("An uncalibrated mercury-in-glass thermometer when placed in a cup of water indicates the top of the mercury stem to be $( 14$ cm$)$ above the bulb. On placing the thermometer in pure melting ice, the height is $( 4$ cm$)$ and in steam above pure boiling water, the height is $( 28$ cm$)$. What is the temperature of the water in the cup?").parsingMode(.onlyEquations)', 'LaTeX("An uncalibrated mercury-in-glass thermometer when placed in a cup of water indicates the top of the mercury stem to be $( 14$ cm$)$ above the bulb. On placing the thermometer in pure melting ice, the height is $( 4$ cm$)$ and in steam above pure boiling water, the height is $( 28$ cm$)$. What is the temperature of the water in the cup?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2020, 'May', 1, '36',
        '\text{The specific latent heat of a substance is defined as the energy required to change the phase of}', '\text{The specific latent heat of a substance is defined as the energy required to change the phase of}', 'LaTeX("The specific latent heat of a substance is defined as the energy required to change the phase of").parsingMode(.onlyEquations)', 'LaTeX("The specific latent heat of a substance is defined as the energy required to change the phase of").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2020, 'May', 1, '37',
        '\text{Helium gas is kept in a container at a pressure of } ( 1.7 \times 10^5\text{ Pa} ) \text{. If the density of helium is } ( 0.92\text{ kg m}^{-3} ) \text{, what is the root mean square speed of the helium atoms?}', '\text{Helium gas is kept in a container at a pressure of } ( 1.7 \times 10^5 \text{ Pa} ) \text{. If the density of helium is } ( 0.92 \text{ kg m}^{-3} ) \text{, what is the root mean square speed of the helium atoms?}', 'LaTeX("Helium gas is kept in a container at a pressure of $( 1.7 \\times 10^5$ Pa$)$. If the density of helium is $( 0.92$ kg m$^{-3} )$, what is the root mean square speed of the helium atoms?").parsingMode(.onlyEquations)', 'LaTeX("Helium gas is kept in a container at a pressure of $( 1.7 \\times 10^5$ Pa$)$. If the density of helium is $( 0.92$ kg m$^{-3} )$, what is the root mean square speed of the helium atoms?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2020, 'May', 1, '39',
        '\text{Water falls from a height of } ( 500\text{ m} ) \text{. What is the rise in temperature of the water at the bottom, if all the energy gained is converted to internal energy in the water?}', '\text{Water falls from a height of } ( 500 \text{ m} ) \text{. What is the rise in temperature of the water at the bottom, if all the energy gained is converted to internal energy in the water?}', 'LaTeX("Water falls from a height of $( 500$ m$)$. What is the rise in temperature of the water at the bottom, if all the energy gained is converted to internal energy in the water?").parsingMode(.onlyEquations)', 'LaTeX("Water falls from a height of $( 500$ m$)$. What is the rise in temperature of the water at the bottom, if all the energy gained is converted to internal energy in the water?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2020, 'May', 1, '40',
        '\text{Item 40 refers to the following force-extension graph of a wire.}
\text{How much work is done in stretching the wire from an extension of } ( 1\text{ mm} ) \text{ to } ( 2\text{ mm} ) \text{?}', '\text{Item 40 refers to the following force-extension graph of a wire.}
\text{How much work is done in stretching the wire from an extension of } ( 1 \text{ mm} ) \text{ to } ( 2 \text{ mm} ) \text{?}', 'LaTeX("Item 40 refers to the following force-extension graph of a wire.\nHow much work is done in stretching the wire from an extension of $( 1$ mm$)$ to $( 2$ mm$)$?").parsingMode(.onlyEquations)', 'LaTeX("Item 40 refers to the following force-extension graph of a wire.\nHow much work is done in stretching the wire from an extension of $( 1$ mm$)$ to $( 2$ mm$)$?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2020, 'May', 1, '41',
        '\text{A cylindrical container of } ( 0.05\text{ m}^3 ) \text{ holds } ( 24\text{ g} ) \text{ of oxygen at } ( 47\text{ }^\circ\text{C} ) \text{. The relative molar mass of oxygen is 32. What is the pressure exerted on the cylinder?}', '\text{A cylindrical container of } ( 0.05 \text{ m}^3 ) \text{ holds } ( 24 \text{ g} ) \text{ of oxygen at } ( 47 \text{ }^\circ\text{C} ) \text{. The relative molar mass of oxygen is 32. What is the pressure exerted on the cylinder?}', 'LaTeX("A cylindrical container of $( 0.05$ m$^3 )$ holds $( 24$ g$)$ of oxygen at $( 47$ $^\\circ$C$)$. The relative molar mass of oxygen is 32. What is the pressure exerted on the cylinder?").parsingMode(.onlyEquations)', 'LaTeX("A cylindrical container of $( 0.05$ m$^3 )$ holds $( 24$ g$)$ of oxygen at $( 47$ $^\\circ$C$)$. The relative molar mass of oxygen is 32. What is the pressure exerted on the cylinder?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2020, 'May', 1, '42',
        '\text{Item 42 refers to the following force-extension graph of two different wires.}
\text{What is the difference in energy stored between the two wires when extended } ( 6\text{ mm} ) \text{?}', '\text{Item 42 refers to the following force-extension graph of two different wires.}
\text{What is the difference in energy stored between the two wires when extended } ( 6 \text{ mm} ) \text{?}', 'LaTeX("Item 42 refers to the following force-extension graph of two different wires.\nWhat is the difference in energy stored between the two wires when extended $( 6$ mm$)$?").parsingMode(.onlyEquations)', 'LaTeX("Item 42 refers to the following force-extension graph of two different wires.\nWhat is the difference in energy stored between the two wires when extended $( 6$ mm$)$?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '3',
        '\text{Item 3 refers to the following diagram.}
\text{A block weighing 60 N hangs from a cord. It is pulled aside, as shown, by a horizontal force, F, of 42 N. What is the tension, T, in the cord?}', '\text{Item 3 refers to the following diagram.}
\text{A block weighing 60 N hangs from a cord. It is pulled aside, as shown, by a horizontal force, F, of 42 N. What is the tension, T, in the cord?}', 'LaTeX("Item 3 refers to the following diagram.\nA block weighing 60 N hangs from a cord. It is pulled aside, as shown, by a horizontal force, F, of 42 N. What is the tension, T, in the cord?").parsingMode(.onlyEquations)', 'LaTeX("Item 3 refers to the following diagram.\nA block weighing 60 N hangs from a cord. It is pulled aside, as shown, by a horizontal force, F, of 42 N. What is the tension, T, in the cord?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '4',
        '\text{A student measures the circumference of a circular room of radius } ( 5.00\text{ m} ) \text{ and obtains the result of } ( 31.41\text{ m} ) \text{.}
\text{Which of the following statements is correct?}', '\text{A student measures the circumference of a circular room of radius } ( 5.00 \text{ m} ) \text{ and obtains the result of } ( 31.41 \text{ m} ) \text{.}
\text{Which of the following statements is correct?}', 'LaTeX("A student measures the circumference of a circular room of radius $( 5.00$ m$)$ and obtains the result of $( 31.41$ m$)$.\nWhich of the following statements is correct?").parsingMode(.onlyEquations)', 'LaTeX("A student measures the circumference of a circular room of radius $( 5.00$ m$)$ and obtains the result of $( 31.41$ m$)$.\nWhich of the following statements is correct?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '5',
        '\text{Which of the following units gives the dimensions of the universal gravitational constant, } ( G ) \text{?}', '\text{Which of the following units gives the dimensions of the universal gravitational constant, } ( G ) \text{?}', 'LaTeX("Which of the following units gives the dimensions of the universal gravitational constant, $( G )$?").parsingMode(.onlyEquations)', 'LaTeX("Which of the following units gives the dimensions of the universal gravitational constant, $( G )$?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '6',
        '\text{If } ( hf = \frac{1}{2} mv^2 ) \text{ where } ( f ) \text{ is frequency, } ( m ) \text{ is mass and } ( v ) \text{ is velocity, which of the following must be the unit of h if the equation is to be homogeneous?}', '\text{If } ( hf = \frac{1}{2} mv^2 ) \text{ where } ( f ) \text{ is frequency, } ( m ) \text{ is mass and } ( v ) \text{ is velocity, which of the following must be the unit of h if the equation is to be homogeneous?}', 'LaTeX("If $( hf = \\frac{1}{2} mv^2 )$ where $( f )$ is frequency, $( m )$ is mass and $( v )$ is velocity, which of the following must be the unit of h if the equation is to be homogeneous?").parsingMode(.onlyEquations)', 'LaTeX("If $( hf = \\frac{1}{2} mv^2 )$ where $( f )$ is frequency, $( m )$ is mass and $( v )$ is velocity, which of the following must be the unit of h if the equation is to be homogeneous?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '8',
        '\text{A force of 200 N acts on a trolley of mass 2 kg causing it to move off from rest and reach a speed of } ( 14\text{ m s}^{-1} ) \text{. The rate of change of momentum of the trolley is}', '\text{A force of 200 N acts on a trolley of mass 2 kg causing it to move off from rest and reach a speed of } ( 14 \text{ m s}^{-1} ) \text{. The rate of change of momentum of the trolley is}', 'LaTeX("A force of 200 N acts on a trolley of mass 2 kg causing it to move off from rest and reach a speed of $( 14$ m s$^{-1} )$. The rate of change of momentum of the trolley is").parsingMode(.onlyEquations)', 'LaTeX("A force of 200 N acts on a trolley of mass 2 kg causing it to move off from rest and reach a speed of $( 14$ m s$^{-1} )$. The rate of change of momentum of the trolley is").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '10',
        '\text{A train travels with a velocity of } ( 5\text{ m s}^{-1} ) \text{ and then accelerates uniformly for a distance of } ( 50\text{ m} ) \text{. If the train reaches a velocity of } ( 15\text{ m s}^{-1} ) \text{, what is the acceleration of the train?}', '\text{A train travels with a velocity of } ( 5 \text{ m s}^{-1} ) \text{ and then accelerates uniformly for a distance of } ( 50 \text{ m} ) \text{. If the train reaches a velocity of } ( 15 \text{ m s}^{-1} ) \text{, what is the acceleration of the train?}', 'LaTeX("A train travels with a velocity of $( 5$ m s$^{-1} )$ and then accelerates uniformly for a distance of $( 50$ m$)$. If the train reaches a velocity of $( 15$ m s$^{-1} )$, what is the acceleration of the train?").parsingMode(.onlyEquations)', 'LaTeX("A train travels with a velocity of $( 5$ m s$^{-1} )$ and then accelerates uniformly for a distance of $( 50$ m$)$. If the train reaches a velocity of $( 15$ m s$^{-1} )$, what is the acceleration of the train?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '11',
        '\text{A stone of mass 250 g is projected horizontally at } ( 30\text{ m s}^{-1} ) \text{ from the top of a cliff of height 60 m. What is the velocity with which it strikes the ground?}', '\text{A stone of mass 250 g is projected horizontally at } ( 30 \text{ m s}^{-1} ) \text{ from the top of a cliff of height 60 m. What is the velocity with which it strikes the ground?}', 'LaTeX("A stone of mass 250 g is projected horizontally at $( 30$ m s$^{-1} )$ from the top of a cliff of height 60 m. What is the velocity with which it strikes the ground?").parsingMode(.onlyEquations)', 'LaTeX("A stone of mass 250 g is projected horizontally at $( 30$ m s$^{-1} )$ from the top of a cliff of height 60 m. What is the velocity with which it strikes the ground?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '15',
        '\text{Item 15 refers to the following diagram which shows a uniform plank balanced by forces.}
\text{The weight, W, of the plank is}', '\text{Item 15 refers to the following diagram which shows a uniform plank balanced by forces.}
\text{The weight, W, of the plank is}', 'LaTeX("Item 15 refers to the following diagram which shows a uniform plank balanced by forces.\nThe weight, W, of the plank is").parsingMode(.onlyEquations)', 'LaTeX("Item 15 refers to the following diagram which shows a uniform plank balanced by forces.\nThe weight, W, of the plank is").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '18',
        '\text{The power of a lens of focal length 15 cm is}', '\text{The power of a lens of focal length 15 cm is}', 'LaTeX("The power of a lens of focal length 15 cm is").parsingMode(.onlyEquations)', 'LaTeX("The power of a lens of focal length 15 cm is").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '20',
        '\text{A beam of monochromatic light is incident normally on a diffraction grating having 500 lines per millimetre. If the second order of diffraction is found at } ( 30^\circ ) \text{ to the normal, what is the wavelength of light used?}', '\text{A beam of monochromatic light is incident normally on a diffraction grating having 500 lines per millimetre. If the second order of diffraction is found at } ( 30^\circ ) \text{ to the normal, what is the wavelength of light used?}', 'LaTeX("A beam of monochromatic light is incident normally on a diffraction grating having 500 lines per millimetre. If the second order of diffraction is found at $( 30^\\circ )$ to the normal, what is the wavelength of light used?").parsingMode(.onlyEquations)', 'LaTeX("A beam of monochromatic light is incident normally on a diffraction grating having 500 lines per millimetre. If the second order of diffraction is found at $( 30^\\circ )$ to the normal, what is the wavelength of light used?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '21',
        '\text{A student''s range of hearing is from 40 Hz to 15 kHZ. What is the SHORTEST wavelength of sound she can hear if the speed of sound in air is } ( 330\text{ m s}^{-1} ) \text{?}', '\text{A student''s range of hearing is from 40 Hz to 15 kHZ. What is the SHORTEST wavelength of sound she can hear if the speed of sound in air is } ( 330 \text{ m s}^{-1} ) \text{?}', 'LaTeX("A student''s range of hearing is from 40 Hz to 15 kHZ. What is the SHORTEST wavelength of sound she can hear if the speed of sound in air is $( 330$ m s$^{-1} )$?").parsingMode(.onlyEquations)', 'LaTeX("A student''s range of hearing is from 40 Hz to 15 kHZ. What is the SHORTEST wavelength of sound she can hear if the speed of sound in air is $( 330$ m s$^{-1} )$?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '23',
        '\text{Item 23 refers to the following diagram which represents the waveform produced when a speaker is held over one open end of a pipe of length 85 cm.}
\text{If the speed of sound is } ( 340\text{ m s}^{-1} ) \text{, what is the waveform''s fundamental frequency?}', '\text{Item 23 refers to the following diagram which represents the waveform produced when a speaker is held over one open end of a pipe of length 85 cm.}
\text{If the speed of sound is } ( 340 \text{ m s}^{-1} ) \text{, what is the waveform''s fundamental frequency?}', 'LaTeX("Item 23 refers to the following diagram which represents the waveform produced when a speaker is held over one open end of a pipe of length 85 cm.\nIf the speed of sound is $( 340$ m s$^{-1} )$, what is the waveform''s fundamental frequency?").parsingMode(.onlyEquations)', 'LaTeX("Item 23 refers to the following diagram which represents the waveform produced when a speaker is held over one open end of a pipe of length 85 cm.\nIf the speed of sound is $( 340$ m s$^{-1} )$, what is the waveform''s fundamental frequency?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '32',
        '\text{The readings on a resistance thermometer are as follows:}
\text{Ice point } ( 27.5\text{ }\Omega )
\text{Steam point } ( 73.8\text{ }\Omega )
\text{Unknown point } ( 41.2\text{ }\Omega )
\text{On the scale of the resistance thermometer, the unknown temperature is}', '\text{The readings on a resistance thermometer are as follows:}
\text{Ice point } ( 27.5 \text{ }\Omega )
\text{Steam point } ( 73.8 \text{ }\Omega )
\text{Unknown point } ( 41.2 \text{ }\Omega )
\text{On the scale of the resistance thermometer, the unknown temperature is}', 'LaTeX("The readings on a resistance thermometer are as follows:\nIce point $( 27.5$ $\\Omega )$\nSteam point $( 73.8$ $\\Omega )$\nUnknown point $( 41.2$ $\\Omega )$\nOn the scale of the resistance thermometer, the unknown temperature is").parsingMode(.onlyEquations)', 'LaTeX("The readings on a resistance thermometer are as follows:\nIce point $( 27.5$ $\\Omega )$\nSteam point $( 73.8$ $\\Omega )$\nUnknown point $( 41.2$ $\\Omega )$\nOn the scale of the resistance thermometer, the unknown temperature is").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '33',
        '\text{An immersion heater rated 150 W is fitted into a large block of ice at } ( 0\text{ }^\circ\text{C} ) \text{. The specific latent heat of fusion of the ice is } ( 3 \times 10^5\text{ J kg}^{-1} ) \text{. How long does it take to melt 10 g of ice?}', '\text{An immersion heater rated 150 W is fitted into a large block of ice at } ( 0 \text{ }^\circ\text{C} ) \text{. The specific latent heat of fusion of the ice is } ( 3 \times 10^5 \text{ J kg}^{-1} ) \text{. How long does it take to melt 10 g of ice?}', 'LaTeX("An immersion heater rated 150 W is fitted into a large block of ice at $( 0$ $^\\circ$C$)$. The specific latent heat of fusion of the ice is $( 3 \\times 10^5$ J kg$^{-1} )$. How long does it take to melt 10 g of ice?").parsingMode(.onlyEquations)', 'LaTeX("An immersion heater rated 150 W is fitted into a large block of ice at $( 0$ $^\\circ$C$)$. The specific latent heat of fusion of the ice is $( 3 \\times 10^5$ J kg$^{-1} )$. How long does it take to melt 10 g of ice?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '40',
        '\text{The mean kinetic energy per molecule in a sample of a monoatomic gas is } ( 8.28 \times 10^{-21}\text{ J} ) \text{. What is the temperature of the gas?}', '\text{The mean kinetic energy per molecule in a sample of a monoatomic gas is } ( 8.28 \times 10^{-21}\text{ J} ) \text{. What is the temperature of the gas?}', 'LaTeX("The mean kinetic energy per molecule in a sample of a monoatomic gas is $( 8.28 \\times 10^{-21}$ J$)$. What is the temperature of the gas?").parsingMode(.onlyEquations)', 'LaTeX("The mean kinetic energy per molecule in a sample of a monoatomic gas is $( 8.28 \\times 10^{-21}$ J$)$. What is the temperature of the gas?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '41',
        '\text{A cylindrical container of } ( 0.05\text{ m}^3 ) \text{ holds 24 g of oxygen at } ( 47\text{ }^\circ\text{C} ) \text{. The relative molar mass of oxygen is 32. What is the pressure exerted on the cylinder?}', '\text{A cylindrical container of } ( 0.05 \text{ m}^3 ) \text{ holds 24 g of oxygen at } ( 47 \text{ }^\circ\text{C} ) \text{. The relative molar mass of oxygen is 32. What is the pressure exerted on the cylinder?}', 'LaTeX("A cylindrical container of $( 0.05$ m$^3 )$ holds 24 g of oxygen at $( 47$ $^\\circ$C$)$. The relative molar mass of oxygen is 32. What is the pressure exerted on the cylinder?").parsingMode(.onlyEquations)', 'LaTeX("A cylindrical container of $( 0.05$ m$^3 )$ holds 24 g of oxygen at $( 47$ $^\\circ$C$)$. The relative molar mass of oxygen is 32. What is the pressure exerted on the cylinder?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2024, 'May', 1, '2',
        '\text{Item 2 refers to the following circuit diagram.}
\text{A thermistor is used in the circuit as shown above. It is found that there is a current of } ( 80\text{ mA} ) \text{ from the supply. What is the current through the thermistor?}', '\text{Item 2 refers to the following circuit diagram.}
\text{A thermistor is used in the circuit as shown above. It is found that there is a current of } ( 80 \text{ mA} ) \text{ from the supply. What is the current through the thermistor?}', 'LaTeX("Item 2 refers to the following circuit diagram.\nA thermistor is used in the circuit as shown above. It is found that there is a current of $( 80$ mA$)$ from the supply. What is the current through the thermistor?").parsingMode(.onlyEquations)', 'LaTeX("Item 2 refers to the following circuit diagram.\nA thermistor is used in the circuit as shown above. It is found that there is a current of $( 80$ mA$)$ from the supply. What is the current through the thermistor?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '4',
        '\text{Item 4 refers to the following diagram of a circuit containing a battery with e.m.f } ( 3.0\text{ V} ) \text{ and internal resistance } ( 2.0\text{ }\Omega ).
\text{What will the voltmeter read when the value on the resistance, R, is set at } ( 8.0\text{ }\Omega )?', '\text{Item 4 refers to the following diagram of a circuit containing a battery with e.m.f } ( 3.0 \text{ V} ) \text{ and internal resistance } ( 2.0 \text{ }\Omega ).
\text{What will the voltmeter read when the value on the resistance, R, is set at } ( 8.0 \text{ }\Omega )?', 'LaTeX("Item 4 refers to the following diagram of a circuit containing a battery with e.m.f $( 3.0$ V$)$ and internal resistance $( 2.0$ $\\Omega ).$\nWhat will the voltmeter read when the value on the resistance, R, is set at $( 8.0$ $\\Omega )?$").parsingMode(.onlyEquations)', 'LaTeX("Item 4 refers to the following diagram of a circuit containing a battery with e.m.f $( 3.0$ V$)$ and internal resistance $( 2.0$ $\\Omega ).$\nWhat will the voltmeter read when the value on the resistance, R, is set at $( 8.0$ $\\Omega )?$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '5',
        '\text{Item 5 refers to the following circuit diagram.}
\text{In the potential divider shown, the point X is to have a potential of } ( + 6.0\text{ V} ). \text{ The resistance of R is}', '\text{Item 5 refers to the following circuit diagram.}
\text{In the potential divider shown, the point X is to have a potential of } ( + 6.0 \text{ V} ). \text{ The resistance of R is}', 'LaTeX("Item 5 refers to the following circuit diagram.\nIn the potential divider shown, the point X is to have a potential of $( + 6.0$ V$).$ The resistance of R is").parsingMode(.onlyEquations)', 'LaTeX("Item 5 refers to the following circuit diagram.\nIn the potential divider shown, the point X is to have a potential of $( + 6.0$ V$).$ The resistance of R is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '6',
        '\text{A beta particle passes a point } ( 100\text{ nm} ) \text{ away from an alpha particle. What is the magnitude of the electrostatic force between the particles at that point?}', '\text{A beta particle passes a point } ( 100 \text{ nm} ) \text{ away from an alpha particle. What is the magnitude of the electrostatic force between the particles at that point?}', 'LaTeX("A beta particle passes a point $( 100$ nm$)$ away from an alpha particle. What is the magnitude of the electrostatic force between the particles at that point?").parsingMode(.onlyEquations)', 'LaTeX("A beta particle passes a point $( 100$ nm$)$ away from an alpha particle. What is the magnitude of the electrostatic force between the particles at that point?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '9',
        '\text{One farad is equivalent to}', '\text{One farad is equivalent to}', 'LaTeX("One farad is equivalent to").parsingMode(.onlyEquations)', 'LaTeX("One farad is equivalent to").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '13',
        '\text{A conductor of mass } ( 2.0 \times 10^{-3}\text{ kg} ), \text{ carrying a current of } ( 2.0\text{ A} ), \text{ is balanced by a magnetic field at right angles to it. If the length of the conductor is } ( 8.0\text{ cm} ), \text{ the magnetic field strength is}', '\text{A conductor of mass } ( 2.0 \times 10^{-3}\text{ kg} ), \text{ carrying a current of } ( 2.0 \text{ A} ), \text{ is balanced by a magnetic field at right angles to it. If the length of the conductor is } ( 8.0 \text{ cm} ), \text{ the magnetic field strength is}', 'LaTeX("A conductor of mass $( 2.0 \\times 10^{-3}$ kg$),$ carrying a current of $( 2.0$ A$),$ is balanced by a magnetic field at right angles to it. If the length of the conductor is $( 8.0$ cm$),$ the magnetic field strength is").parsingMode(.onlyEquations)', 'LaTeX("A conductor of mass $( 2.0 \\times 10^{-3}$ kg$),$ carrying a current of $( 2.0$ A$),$ is balanced by a magnetic field at right angles to it. If the length of the conductor is $( 8.0$ cm$),$ the magnetic field strength is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '14',
        '\text{A straight wire } ( 1\text{ m} ) \text{ long is placed at an angle of } ( 30^\circ ) \text{ in a magnetic field of flux density } ( 0.2\text{ T} ). \text{ It experiences a force of } ( 0.5\text{ N} ). \text{ What is the current in the wire?}', '\text{A straight wire } ( 1 \text{ m} ) \text{ long is placed at an angle of } ( 30^\circ ) \text{ in a magnetic field of flux density } ( 0.2 \text{ T} ). \text{ It experiences a force of } ( 0.5 \text{ N} ). \text{ What is the current in the wire?}', 'LaTeX("A straight wire $( 1$ m$)$ long is placed at an angle of $( 30^\\circ )$ in a magnetic field of flux density $( 0.2$ T$).$ It experiences a force of $( 0.5$ N$).$ What is the current in the wire?").parsingMode(.onlyEquations)', 'LaTeX("A straight wire $( 1$ m$)$ long is placed at an angle of $( 30^\\circ )$ in a magnetic field of flux density $( 0.2$ T$).$ It experiences a force of $( 0.5$ N$).$ What is the current in the wire?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '16',
        '\text{Item 16 refers to the following circuit diagram.}
\text{The battery has negligible internal resistance. Which pair of resistance values would make the voltage between X and Y equal to } ( 1.5\text{ V} )?', '\text{Item 16 refers to the following circuit diagram.}
\text{The battery has negligible internal resistance. Which pair of resistance values would make the voltage between X and Y equal to } ( 1.5 \text{ V} )?', 'LaTeX("Item 16 refers to the following circuit diagram.\nThe battery has negligible internal resistance. Which pair of resistance values would make the voltage between X and Y equal to $( 1.5$ V$)?$").parsingMode(.onlyEquations)', 'LaTeX("Item 16 refers to the following circuit diagram.\nThe battery has negligible internal resistance. Which pair of resistance values would make the voltage between X and Y equal to $( 1.5$ V$)?$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '23',
        '\text{Item 23 refers to the following diagram which shows a summing amplifier.}
\text{What would be the output, } ( V_0 ), \text{ given that } ( V_1 = V_3 = 1\text{ V} ) \text{ and } ( V_2 = 0 )?', '\text{Item 23 refers to the following diagram which shows a summing amplifier.}
\text{What would be the output, } ( V_0 ), \text{ given that } ( V_1 = V_3 = 1 \text{ V} ) \text{ and } ( V_2 = 0 )?', 'LaTeX("Item 23 refers to the following diagram which shows a summing amplifier.\nWhat would be the output, $( V_0 ),$ given that $( V_1 = V_3 = 1$ V$)$ and $( V_2 = 0 )?$").parsingMode(.onlyEquations)', 'LaTeX("Item 23 refers to the following diagram which shows a summing amplifier.\nWhat would be the output, $( V_0 ),$ given that $( V_1 = V_3 = 1$ V$)$ and $( V_2 = 0 )?$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '24',
        '\text{Item 24 refers to the following op-amp voltage comparator.}
\text{The supply voltage to the op-amp is } ( + 9\text{ V} ). \text{ If the open loop gain is } ( 10^5 ) \text{ and } ( V_2 = 0 ), \text{ what is the maximum input voltage swing, } ( V_1 ), \text{ for linear amplification?}', '\text{Item 24 refers to the following op-amp voltage comparator.}
\text{The supply voltage to the op-amp is } ( + 9 \text{ V} ). \text{ If the open loop gain is } ( 10^5 ) \text{ and } ( V_2 = 0 ), \text{ what is the maximum input voltage swing, } ( V_1 ), \text{ for linear amplification?}', 'LaTeX("Item 24 refers to the following op-amp voltage comparator.\nThe supply voltage to the op-amp is $( + 9$ V$).$ If the open loop gain is $( 10^5 )$ and $( V_2 = 0 ),$ what is the maximum input voltage swing, $( V_1 ),$ for linear amplification?").parsingMode(.onlyEquations)', 'LaTeX("Item 24 refers to the following op-amp voltage comparator.\nThe supply voltage to the op-amp is $( + 9$ V$).$ If the open loop gain is $( 10^5 )$ and $( V_2 = 0 ),$ what is the maximum input voltage swing, $( V_1 ),$ for linear amplification?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '25',
        '\text{An operational amplifier circuit has a gain of } ( 10^3 ) \text{ and a bandwidth of } ( 10^3\text{ Hz} ). \text{ What is the approximate bandwidth when the gain is reduced to 10?}', '\text{An operational amplifier circuit has a gain of } ( 10^3 ) \text{ and a bandwidth of } ( 10^3 \text{ Hz} ). \text{ What is the approximate bandwidth when the gain is reduced to 10?}', 'LaTeX("An operational amplifier circuit has a gain of $( 10^3 )$ and a bandwidth of $( 10^3$ Hz$).$ What is the approximate bandwidth when the gain is reduced to 10?").parsingMode(.onlyEquations)', 'LaTeX("An operational amplifier circuit has a gain of $( 10^3 )$ and a bandwidth of $( 10^3$ Hz$).$ What is the approximate bandwidth when the gain is reduced to 10?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '31',
        '\text{What is the de Broglie wavelength of an Olympic sprinter of mass 60 kg when running at a speed of } ( 10\text{ m s}^{-1} )?', '\text{What is the de Broglie wavelength of an Olympic sprinter of mass 60 kg when running at a speed of } ( 10 \text{ m s}^{-1} )?', 'LaTeX("What is the de Broglie wavelength of an Olympic sprinter of mass 60 kg when running at a speed of $( 10$ m s$^{-1} )?$").parsingMode(.onlyEquations)', 'LaTeX("What is the de Broglie wavelength of an Olympic sprinter of mass 60 kg when running at a speed of $( 10$ m s$^{-1} )?$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '32',
        '\text{Item 32 refers to the following diagram which shows some of the energy levels for electrons in an isolated lithium atom. The energy levels are given in electron-volts.}
\text{The outer electron of a lithium atom is in the } ( -8.68\text{ eV} ) \text{ level. How much energy is required to ionize the atom?}', '\text{Item 32 refers to the following diagram which shows some of the energy levels for electrons in an isolated lithium atom. The energy levels are given in electron-volts.}
\text{The outer electron of a lithium atom is in the } ( -8.68 \text{ eV} ) \text{ level. How much energy is required to ionize the atom?}', 'LaTeX("Item 32 refers to the following diagram which shows some of the energy levels for electrons in an isolated lithium atom. The energy levels are given in electron-volts.\nThe outer electron of a lithium atom is in the $( -8.68$ eV$)$ level. How much energy is required to ionize the atom?").parsingMode(.onlyEquations)', 'LaTeX("Item 32 refers to the following diagram which shows some of the energy levels for electrons in an isolated lithium atom. The energy levels are given in electron-volts.\nThe outer electron of a lithium atom is in the $( -8.68$ eV$)$ level. How much energy is required to ionize the atom?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '34',
        '\text{A metal surface has a work function of } ( 3.8\text{ eV} ). \text{ What is the threshold wavelength for this metal?}', '\text{A metal surface has a work function of } ( 3.8 \text{ eV} ). \text{ What is the threshold wavelength for this metal?}', 'LaTeX("A metal surface has a work function of $( 3.8$ eV$).$ What is the threshold wavelength for this metal?").parsingMode(.onlyEquations)', 'LaTeX("A metal surface has a work function of $( 3.8$ eV$).$ What is the threshold wavelength for this metal?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '35',
        '\text{The kinetic energy of a photoelectron is given as } ( 7\text{ eV} ). \text{ The velocity of the electron is}', '\text{The kinetic energy of a photoelectron is given as } ( 7 \text{ eV} ). \text{ The velocity of the electron is}', 'LaTeX("The kinetic energy of a photoelectron is given as $( 7$ eV$).$ The velocity of the electron is").parsingMode(.onlyEquations)', 'LaTeX("The kinetic energy of a photoelectron is given as $( 7$ eV$).$ The velocity of the electron is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '38',
        '\text{How much energy would be released in a nuclear fission reaction if the mass defect is } ( 0.00687\text{ u} )?', '\text{How much energy would be released in a nuclear fission reaction if the mass defect is } ( 0.00687 \text{ u} )?', 'LaTeX("How much energy would be released in a nuclear fission reaction if the mass defect is $( 0.00687$ u$)?$").parsingMode(.onlyEquations)', 'LaTeX("How much energy would be released in a nuclear fission reaction if the mass defect is $( 0.00687$ u$)?$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '43',
        '\text{What is the half-life for a radioactive isotope containing } ( 10^{20} ) \text{ atoms with a decay constant of } ( 1.60 \times 10^{-5}\text{ hour}^{-1} )?', '\text{What is the half-life for a radioactive isotope containing } ( 10^{20} ) \text{ atoms with a decay constant of } ( 1.60 \times 10^{-5}\text{ hour}^{-1} )?', 'LaTeX("What is the half-life for a radioactive isotope containing $( 10^{20} )$ atoms with a decay constant of $( 1.60 \\times 10^{-5}$ hour$^{-1} )?$").parsingMode(.onlyEquations)', 'LaTeX("What is the half-life for a radioactive isotope containing $( 10^{20} )$ atoms with a decay constant of $( 1.60 \\times 10^{-5}$ hour$^{-1} )?$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2024, 'May', 1, '44',
        '\text{A sample of radioactive material initially contains } ( 2.0 \times 10^{18} ) \text{ atoms. The material decays by \alpha-emission and has a half-life of } ( 3.0 \times 10^{10}\text{ s} ). \text{ The initial activity of the sample is}', '\text{A sample of radioactive material initially contains } ( 2.0 \times 10^{18} ) \text{ atoms. The material decays by \alpha-emission and has a half-life of } ( 3.0 \times 10^{10}\text{ s} ). \text{ The initial activity of the sample is}', 'LaTeX("A sample of radioactive material initially contains $( 2.0 \\times 10^{18} )$ atoms. The material decays by \\alpha-emission and has a half-life of $( 3.0 \\times 10^{10}$ s$).$ The initial activity of the sample is").parsingMode(.onlyEquations)', 'LaTeX("A sample of radioactive material initially contains $( 2.0 \\times 10^{18} )$ atoms. The material decays by \\alpha-emission and has a half-life of $( 3.0 \\times 10^{10}$ s$).$ The initial activity of the sample is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Physics%') AND q.paper = 1 AND q.number = 1
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '1',
        '\text{Item 1 refers to the following diagram showing two vectors.}
\text{Which of the following vectors BEST represents the resultant of the two vectors shown above?}', '\text{Item 1 refers to the following diagram showing two vectors.}
\text{Which of the following vectors BEST represents the resultant of the two vectors shown above?}', 'LaTeX("Item 1 refers to the following diagram showing two vectors.\nWhich of the following vectors BEST represents the resultant of the two vectors shown above?").parsingMode(.onlyEquations)', 'LaTeX("Item 1 refers to the following diagram showing two vectors.\nWhich of the following vectors BEST represents the resultant of the two vectors shown above?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '3',
        '\text{An object falls freely under gravity, } ( g ) \text{, from a height of } ( 12.5\text{ m} ) \text{. Which of the following equations can be used to determine the time, } ( t ) \text{, taken for the object to reach the ground?}', '\text{An object falls freely under gravity, } ( g ) \text{, from a height of } ( 12.5 \text{ m} ) \text{. Which of the following equations can be used to determine the time, } ( t ) \text{, taken for the object to reach the ground?}', 'LaTeX("An object falls freely under gravity, $( g )$, from a height of $( 12.5$ m$)$. Which of the following equations can be used to determine the time, $( t )$, taken for the object to reach the ground?").parsingMode(.onlyEquations)', 'LaTeX("An object falls freely under gravity, $( g )$, from a height of $( 12.5$ m$)$. Which of the following equations can be used to determine the time, $( t )$, taken for the object to reach the ground?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '5',
        '\text{A mass of } ( 6.4\text{ }\mu\text{g} ) \text{ is equal to}', '\text{A mass of } ( 6.4 \text{ }\mu\text{g} ) \text{ is equal to}', 'LaTeX("A mass of $( 6.4$ $\\mu$g$)$ is equal to").parsingMode(.onlyEquations)', 'LaTeX("A mass of $( 6.4$ $\\mu$g$)$ is equal to").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '6',
        '\text{A batsman hits a ball with a velocity of } ( 25\text{ m s}^{-1} ) \text{ at an angle of } ( 30^\circ ) \text{ to the horizontal. The ball follows a parabolic path as shown in the diagram below.}
\text{If a fielder catches the ball when it reaches the maximum height, H, what is the time taken for the ball to reach this maximum height?}', '\text{A batsman hits a ball with a velocity of } ( 25 \text{ m s}^{-1} ) \text{ at an angle of } ( 30^\circ ) \text{ to the horizontal. The ball follows a parabolic path as shown in the diagram below.}
\text{If a fielder catches the ball when it reaches the maximum height, H, what is the time taken for the ball to reach this maximum height?}', 'LaTeX("A batsman hits a ball with a velocity of $( 25$ m s$^{-1} )$ at an angle of $( 30^\\circ )$ to the horizontal. The ball follows a parabolic path as shown in the diagram below.\nIf a fielder catches the ball when it reaches the maximum height, H, what is the time taken for the ball to reach this maximum height?").parsingMode(.onlyEquations)', 'LaTeX("A batsman hits a ball with a velocity of $( 25$ m s$^{-1} )$ at an angle of $( 30^\\circ )$ to the horizontal. The ball follows a parabolic path as shown in the diagram below.\nIf a fielder catches the ball when it reaches the maximum height, H, what is the time taken for the ball to reach this maximum height?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '9',
        '\text{An object of mass } ( 400\text{ g} ) \text{ is attached to a string. The mass is set in circular motion such that it moves in the horizontal plane with a radius of } ( 0.77\text{ m} ) \text{.}
\text{What is the anticipated acceleration of the object if it takes } ( 16\text{ s} ) \text{ to complete 20 revolutions?}', '\text{An object of mass } ( 400 \text{ g} ) \text{ is attached to a string. The mass is set in circular motion such that it moves in the horizontal plane with a radius of } ( 0.77 \text{ m} ) \text{.}
\text{What is the anticipated acceleration of the object if it takes } ( 16 \text{ s} ) \text{ to complete 20 revolutions?}', 'LaTeX("An object of mass $( 400$ g$)$ is attached to a string. The mass is set in circular motion such that it moves in the horizontal plane with a radius of $( 0.77$ m$)$.\nWhat is the anticipated acceleration of the object if it takes $( 16$ s$)$ to complete 20 revolutions?").parsingMode(.onlyEquations)', 'LaTeX("An object of mass $( 400$ g$)$ is attached to a string. The mass is set in circular motion such that it moves in the horizontal plane with a radius of $( 0.77$ m$)$.\nWhat is the anticipated acceleration of the object if it takes $( 16$ s$)$ to complete 20 revolutions?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '11',
        '\text{A rocket in gravity-free space is burning } ( 5.0 \times 10^2\text{ kg} ) \text{ of fuel per second. The exhaust gases are expelled at } ( 8.0 \times 10^3\text{ m s}^{-1} ) \text{ relative to the rocket, whose mass is } ( 2.0 \times 10^5\text{ kg} ) \text{ at that time. What is the rocket''s acceleration?}', '\text{A rocket in gravity-free space is burning } ( 5.0 \times 10^2 \text{ kg} ) \text{ of fuel per second. The exhaust gases are expelled at } ( 8.0 \times 10^3 \text{ m s}^{-1} ) \text{ relative to the rocket, whose mass is } ( 2.0 \times 10^5 \text{ kg} ) \text{ at that time. What is the rocket''s acceleration?}', 'LaTeX("A rocket in gravity-free space is burning $( 5.0 \\times 10^2$ kg$)$ of fuel per second. The exhaust gases are expelled at $( 8.0 \\times 10^3$ m s$^{-1} )$ relative to the rocket, whose mass is $( 2.0 \\times 10^5$ kg$)$ at that time. What is the rocket''s acceleration?").parsingMode(.onlyEquations)', 'LaTeX("A rocket in gravity-free space is burning $( 5.0 \\times 10^2$ kg$)$ of fuel per second. The exhaust gases are expelled at $( 8.0 \\times 10^3$ m s$^{-1} )$ relative to the rocket, whose mass is $( 2.0 \\times 10^5$ kg$)$ at that time. What is the rocket''s acceleration?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '13',
        '\text{Item 13 refers to the following diagram showing a bus of mass } ( 2000\text{ kg} ) \text{ travelling down a hill of vertical height } ( 50\text{ m} ) \text{.}
\text{Assuming there is no energy loss, what is the speed of the bus at point X?}', '\text{Item 13 refers to the following diagram showing a bus of mass } ( 2000 \text{ kg} ) \text{ travelling down a hill of vertical height } ( 50 \text{ m} ) \text{.}
\text{Assuming there is no energy loss, what is the speed of the bus at point X?}', 'LaTeX("Item 13 refers to the following diagram showing a bus of mass $( 2000$ kg$)$ travelling down a hill of vertical height $( 50$ m$)$.\nAssuming there is no energy loss, what is the speed of the bus at point X?").parsingMode(.onlyEquations)', 'LaTeX("Item 13 refers to the following diagram showing a bus of mass $( 2000$ kg$)$ travelling down a hill of vertical height $( 50$ m$)$.\nAssuming there is no energy loss, what is the speed of the bus at point X?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '14',
        '\text{A truck is moving at a speed of } ( 40\text{ m s}^{-1} ) \text{ but the engine is only producing } ( 20\text{ kW} ) \text{ of useful power. What is the driving force produced by the engine?}', '\text{A truck is moving at a speed of } ( 40 \text{ m s}^{-1} ) \text{ but the engine is only producing } ( 20 \text{ kW} ) \text{ of useful power. What is the driving force produced by the engine?}', 'LaTeX("A truck is moving at a speed of $( 40$ m s$^{-1} )$ but the engine is only producing $( 20$ kW$)$ of useful power. What is the driving force produced by the engine?").parsingMode(.onlyEquations)', 'LaTeX("A truck is moving at a speed of $( 40$ m s$^{-1} )$ but the engine is only producing $( 20$ kW$)$ of useful power. What is the driving force produced by the engine?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '19',
        '\text{Stationary waves are produced by superimposing progressive waves of frequency } ( 500\text{ Hz} ) \text{. Successive nodes are separated by a distance of } ( 2\text{ m} ) \text{. What is the speed of the progressive waves?}', '\text{Stationary waves are produced by superimposing progressive waves of frequency } ( 500 \text{ Hz} ) \text{. Successive nodes are separated by a distance of } ( 2 \text{ m} ) \text{. What is the speed of the progressive waves?}', 'LaTeX("Stationary waves are produced by superimposing progressive waves of frequency $( 500$ Hz$)$. Successive nodes are separated by a distance of $( 2$ m$)$. What is the speed of the progressive waves?").parsingMode(.onlyEquations)', 'LaTeX("Stationary waves are produced by superimposing progressive waves of frequency $( 500$ Hz$)$. Successive nodes are separated by a distance of $( 2$ m$)$. What is the speed of the progressive waves?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '21',
        '\text{A ship sends down a pulse of sound to measure the depth of the sea. The echo is detected } ( 0.1\text{ s} ) \text{ later. Assuming that sound waves travel five times faster in sea water than in the air, how deep is the sea at this point?}
\text{(Speed of sound in air } = ( 340\text{ m s}^{-1} ) \text{)}', '\text{A ship sends down a pulse of sound to measure the depth of the sea. The echo is detected } ( 0.1 \text{ s} ) \text{ later. Assuming that sound waves travel five times faster in sea water than in the air, how deep is the sea at this point?}
\text{(Speed of sound in air } = ( 340 \text{ m s}^{-1} ) \text{)}', 'LaTeX("A ship sends down a pulse of sound to measure the depth of the sea. The echo is detected $( 0.1$ s$)$ later. Assuming that sound waves travel five times faster in sea water than in the air, how deep is the sea at this point?\n(Speed of sound in air $= ( 340$ m s$^{-1} )$)").parsingMode(.onlyEquations)', 'LaTeX("A ship sends down a pulse of sound to measure the depth of the sea. The echo is detected $( 0.1$ s$)$ later. Assuming that sound waves travel five times faster in sea water than in the air, how deep is the sea at this point?\n(Speed of sound in air $= ( 340$ m s$^{-1} )$)").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '22',
        '\text{At what angle does the second order constructive interference occur for red light of wavelength } ( 700\text{ nm} ) \text{ through a diffraction grating that has 600 lines per mm?}', '\text{At what angle does the second order constructive interference occur for red light of wavelength } ( 700 \text{ nm} ) \text{ through a diffraction grating that has 600 lines per mm?}', 'LaTeX("At what angle does the second order constructive interference occur for red light of wavelength $( 700$ nm$)$ through a diffraction grating that has 600 lines per mm?").parsingMode(.onlyEquations)', 'LaTeX("At what angle does the second order constructive interference occur for red light of wavelength $( 700$ nm$)$ through a diffraction grating that has 600 lines per mm?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '25',
        '\text{The wavelength of a yellow light source is } ( 5.89 \times 10^{-7}\text{ m} ) \text{. What is the separation of the yellow fringes formed on a screen } ( 1.8\text{ m} ) \text{ from a double slit with a spacing of } ( 0.2\text{ mm} ) \text{?}', '\text{The wavelength of a yellow light source is } ( 5.89 \times 10^{-7}\text{ m} ) \text{. What is the separation of the yellow fringes formed on a screen } ( 1.8 \text{ m} ) \text{ from a double slit with a spacing of } ( 0.2 \text{ mm} ) \text{?}', 'LaTeX("The wavelength of a yellow light source is $( 5.89 \\times 10^{-7}$ m$)$. What is the separation of the yellow fringes formed on a screen $( 1.8$ m$)$ from a double slit with a spacing of $( 0.2$ mm$)$?").parsingMode(.onlyEquations)', 'LaTeX("The wavelength of a yellow light source is $( 5.89 \\times 10^{-7}$ m$)$. What is the separation of the yellow fringes formed on a screen $( 1.8$ m$)$ from a double slit with a spacing of $( 0.2$ mm$)$?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '27',
        '\text{A communications satellite sends information to Earth in the form of electromagnetic waves in bursts of } ( 5\text{ ms} ) \text{ duration. If the wavelength of the electromagnetic waves is } ( 2 \times 10^{-6}\text{ m} ) \text{, the number of wavelengths in EACH pulse is approximately}', '\text{A communications satellite sends information to Earth in the form of electromagnetic waves in bursts of } ( 5 \text{ ms} ) \text{ duration. If the wavelength of the electromagnetic waves is } ( 2 \times 10^{-6}\text{ m} ) \text{, the number of wavelengths in EACH pulse is approximately}', 'LaTeX("A communications satellite sends information to Earth in the form of electromagnetic waves in bursts of $( 5$ ms$)$ duration. If the wavelength of the electromagnetic waves is $( 2 \\times 10^{-6}$ m$)$, the number of wavelengths in EACH pulse is approximately").parsingMode(.onlyEquations)', 'LaTeX("A communications satellite sends information to Earth in the form of electromagnetic waves in bursts of $( 5$ ms$)$ duration. If the wavelength of the electromagnetic waves is $( 2 \\times 10^{-6}$ m$)$, the number of wavelengths in EACH pulse is approximately").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '28',
        '\text{How much intensity change in dB will take place with an increase in intensity from } ( 1\text{ mW m}^{-2} ) \text{ to } ( 100\text{ mW m}^{-2} ) \text{?}', '\text{How much intensity change in dB will take place with an increase in intensity from } ( 1 \text{ mW m}^{-2} ) \text{ to } ( 100 \text{ mW m}^{-2} ) \text{?}', 'LaTeX("How much intensity change in dB will take place with an increase in intensity from $( 1$ mW m$^{-2} )$ to $( 100$ mW m$^{-2} )$?").parsingMode(.onlyEquations)', 'LaTeX("How much intensity change in dB will take place with an increase in intensity from $( 1$ mW m$^{-2} )$ to $( 100$ mW m$^{-2} )$?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '29',
        '\text{As light travelling in air enters a medium, its speed changes to } ( 2.4 \times 10^8\text{ m s}^{-1} ) \text{. The refractive index of the medium is}', '\text{As light travelling in air enters a medium, its speed changes to } ( 2.4 \times 10^8 \text{ m s}^{-1} ) \text{. The refractive index of the medium is}', 'LaTeX("As light travelling in air enters a medium, its speed changes to $( 2.4 \\times 10^8$ m s$^{-1} )$. The refractive index of the medium is").parsingMode(.onlyEquations)', 'LaTeX("As light travelling in air enters a medium, its speed changes to $( 2.4 \\times 10^8$ m s$^{-1} )$. The refractive index of the medium is").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '30',
        '\text{The near point of a defective eye is } ( 30\text{ cm} ) \text{ from the eye. The normal near point is } ( 25\text{ cm} ) \text{ from the eye. The focal length of the lens needed to correct this defect is}', '\text{The near point of a defective eye is } ( 30 \text{ cm} ) \text{ from the eye. The normal near point is } ( 25 \text{ cm} ) \text{ from the eye. The focal length of the lens needed to correct this defect is}', 'LaTeX("The near point of a defective eye is $( 30$ cm$)$ from the eye. The normal near point is $( 25$ cm$)$ from the eye. The focal length of the lens needed to correct this defect is").parsingMode(.onlyEquations)', 'LaTeX("The near point of a defective eye is $( 30$ cm$)$ from the eye. The normal near point is $( 25$ cm$)$ from the eye. The focal length of the lens needed to correct this defect is").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '31',
        '\text{A resistance thermometer has a resistance of } ( 35.00\text{ }\Omega ) \text{ at the ice point, } ( 42.54\text{ }\Omega ) \text{ at the steam point and } ( 37.57\text{ }\Omega ) \text{ when immersed in a boiling liquid. What is the temperature at which the liquid is boiling?}', '\text{A resistance thermometer has a resistance of } ( 35.00 \text{ }\Omega ) \text{ at the ice point, } ( 42.54 \text{ }\Omega ) \text{ at the steam point and } ( 37.57 \text{ }\Omega ) \text{ when immersed in a boiling liquid. What is the temperature at which the liquid is boiling?}', 'LaTeX("A resistance thermometer has a resistance of $( 35.00$ $\\Omega )$ at the ice point, $( 42.54$ $\\Omega )$ at the steam point and $( 37.57$ $\\Omega )$ when immersed in a boiling liquid. What is the temperature at which the liquid is boiling?").parsingMode(.onlyEquations)', 'LaTeX("A resistance thermometer has a resistance of $( 35.00$ $\\Omega )$ at the ice point, $( 42.54$ $\\Omega )$ at the steam point and $( 37.57$ $\\Omega )$ when immersed in a boiling liquid. What is the temperature at which the liquid is boiling?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '38',
        '\text{The circular opening of a furnace has a radius of } ( 6 \times 10^{-2}\text{ m} ) \text{ at } ( 1450\text{ K} ) \text{. It emits radiation equivalent to } ( 60\% ) \text{ of that for a perfect black body radiator at the same temperature. What is the power radiated from the opening of the furnace?}', '\text{The circular opening of a furnace has a radius of } ( 6 \times 10^{-2}\text{ m} ) \text{ at } ( 1450 \text{ K} ) \text{. It emits radiation equivalent to } ( 60\% ) \text{ of that for a perfect black body radiator at the same temperature. What is the power radiated from the opening of the furnace?}', 'LaTeX("The circular opening of a furnace has a radius of $( 6 \\times 10^{-2}$ m$)$ at $( 1450$ K$)$. It emits radiation equivalent to $( 60\\% )$ of that for a perfect black body radiator at the same temperature. What is the power radiated from the opening of the furnace?").parsingMode(.onlyEquations)', 'LaTeX("The circular opening of a furnace has a radius of $( 6 \\times 10^{-2}$ m$)$ at $( 1450$ K$)$. It emits radiation equivalent to $( 60\\% )$ of that for a perfect black body radiator at the same temperature. What is the power radiated from the opening of the furnace?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '39',
        '\text{Item 39 refers to the following diagram showing the P-V graph for a gas undergoing a cycle from } ( A \rightarrow B \rightarrow C \rightarrow D \rightarrow A ) \text{.}
\text{How much work is done on the gas during the process } ( C \rightarrow D ) \text{?}', '\text{Item 39 refers to the following diagram showing the P-V graph for a gas undergoing a cycle from } ( A \rightarrow B \rightarrow C \rightarrow D \rightarrow A ) \text{.}
\text{How much work is done on the gas during the process } ( C \rightarrow D ) \text{?}', 'LaTeX("Item 39 refers to the following diagram showing the P-V graph for a gas undergoing a cycle from $( A \\rightarrow B \\rightarrow C \\rightarrow D \\rightarrow A )$.\nHow much work is done on the gas during the process $( C \\rightarrow D )$?").parsingMode(.onlyEquations)', 'LaTeX("Item 39 refers to the following diagram showing the P-V graph for a gas undergoing a cycle from $( A \\rightarrow B \\rightarrow C \\rightarrow D \\rightarrow A )$.\nHow much work is done on the gas during the process $( C \\rightarrow D )$?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '41',
        '\text{Two identical springs hang side by side (in parallel) and are connected to a load of } ( 7.5\text{ N} ) \text{. They each experience an extension of } ( 2.5\text{ cm} ) \text{. What is the force constant of ONE of the springs?}', '\text{Two identical springs hang side by side (in parallel) and are connected to a load of } ( 7.5 \text{ N} ) \text{. They each experience an extension of } ( 2.5 \text{ cm} ) \text{. What is the force constant of ONE of the springs?}', 'LaTeX("Two identical springs hang side by side (in parallel) and are connected to a load of $( 7.5$ N$)$. They each experience an extension of $( 2.5$ cm$)$. What is the force constant of ONE of the springs?").parsingMode(.onlyEquations)', 'LaTeX("Two identical springs hang side by side (in parallel) and are connected to a load of $( 7.5$ N$)$. They each experience an extension of $( 2.5$ cm$)$. What is the force constant of ONE of the springs?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '43',
        '\text{Item 43 refers to the following diagrams.}
\text{Container A with a base area of } ( 2\text{ cm}^2 ) \text{ is filled with water to a depth of } ( 15\text{ cm} ) \text{. Some of the water is then emptied and the new height becomes } ( 6\text{ cm} ) \text{. What is the pressure difference between the two depths?}', '\text{Item 43 refers to the following diagrams.}
\text{Container A with a base area of } ( 2 \text{ cm}^2 ) \text{ is filled with water to a depth of } ( 15 \text{ cm} ) \text{. Some of the water is then emptied and the new height becomes } ( 6 \text{ cm} ) \text{. What is the pressure difference between the two depths?}', 'LaTeX("Item 43 refers to the following diagrams.\nContainer A with a base area of $( 2$ cm$^2 )$ is filled with water to a depth of $( 15$ cm$)$. Some of the water is then emptied and the new height becomes $( 6$ cm$)$. What is the pressure difference between the two depths?").parsingMode(.onlyEquations)', 'LaTeX("Item 43 refers to the following diagrams.\nContainer A with a base area of $( 2$ cm$^2 )$ is filled with water to a depth of $( 15$ cm$)$. Some of the water is then emptied and the new height becomes $( 6$ cm$)$. What is the pressure difference between the two depths?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '44',
        '\text{Item 44 refers to the following force–extension graph for a stretched wire. OX represents the region where elastic deformation occurs.}
\text{What is the strain energy stored in the wire for an extension of } ( 40\text{ }\mu\text{m} ) \text{?}', '\text{Item 44 refers to the following force–extension graph for a stretched wire. OX represents the region where elastic deformation occurs.}
\text{What is the strain energy stored in the wire for an extension of } ( 40 \text{ }\mu\text{m} ) \text{?}', 'LaTeX("Item 44 refers to the following force–extension graph for a stretched wire. OX represents the region where elastic deformation occurs.\nWhat is the strain energy stored in the wire for an extension of $( 40$ $\\mu$m$)$?").parsingMode(.onlyEquations)', 'LaTeX("Item 44 refers to the following force–extension graph for a stretched wire. OX represents the region where elastic deformation occurs.\nWhat is the strain energy stored in the wire for an extension of $( 40$ $\\mu$m$)$?").parsingMode(.onlyEquations)',
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
        '\text{A } ( 5\text{-kg} ) \text{ mass hangs from a uniform steel wire and the resulting stress in the wire is } ( \sigma ) \text{. Hanging a } ( 10\text{-kg} ) \text{ mass from a steel wire of twice the diameter would result in a stress of}', '\text{A } ( 5 \text{-kg} ) \text{ mass hangs from a uniform steel wire and the resulting stress in the wire is } ( \sigma ) \text{. Hanging a } ( 10 \text{-kg} ) \text{ mass from a steel wire of twice the diameter would result in a stress of}', 'LaTeX("A $( 5$-kg$)$ mass hangs from a uniform steel wire and the resulting stress in the wire is $( \\sigma )$. Hanging a $( 10$-kg$)$ mass from a steel wire of twice the diameter would result in a stress of").parsingMode(.onlyEquations)', 'LaTeX("A $( 5$-kg$)$ mass hangs from a uniform steel wire and the resulting stress in the wire is $( \\sigma )$. Hanging a $( 10$-kg$)$ mass from a steel wire of twice the diameter would result in a stress of").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2020, 'May', 1, '5',
        '\text{Items 5–6 refer to the following half-equations for the reaction between iodine and sodium thiosulfate.}
( 2\text{S}_2\text{O}_3^{2-}\text{(aq)} \rightarrow \text{S}_4\text{O}_6^{2-}\text{(aq)} + 2\text{e}^- )
( \text{I}_2\text{(aq)} + 2\text{e}^- \rightarrow 2\text{I}^-\text{(aq)} )
\text{The overall balanced chemical equation for the reaction is}', '\text{Items 5–6 refer to the following half-equations for the reaction between iodine and sodium thiosulfate.}
( 2 \text{S}_2 \text{O}_3^{2-}\text{(aq)} \rightarrow \text{S}_4 \text{O}_6^{2-}\text{(aq)} + 2 \text{e}^- )
( \text{I}_2 \text{(aq)} + 2 \text{e}^- \rightarrow 2 \text{I}^-\text{(aq)} )
\text{The overall balanced chemical equation for the reaction is}', 'LaTeX("Items 5–6 refer to the following half-equations for the reaction between iodine and sodium thiosulfate.\n$( 2$S$_2$O$_3^{2-}$(aq)$\\rightarrow$S$_4$O$_6^{2-}$(aq)$+ 2$e$^- )$\n$($I$_2$(aq)$+ 2$e$^- \\rightarrow 2$I$^-$(aq)$)$\nThe overall balanced chemical equation for the reaction is").parsingMode(.onlyEquations)', 'LaTeX("Items 5–6 refer to the following half-equations for the reaction between iodine and sodium thiosulfate.\n$( 2$S$_2$O$_3^{2-}$(aq)$\\rightarrow$S$_4$O$_6^{2-}$(aq)$+ 2$e$^- )$\n$($I$_2$(aq)$+ 2$e$^- \\rightarrow 2$I$^-$(aq)$)$\nThe overall balanced chemical equation for the reaction is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2020 IS NULL OR q.year = 2020)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2020, 'May', 1, '6',
        '\text{The oxidizing agent is}', '\text{The oxidizing agent is}', 'LaTeX("The oxidizing agent is").parsingMode(.onlyEquations)', 'LaTeX("The oxidizing agent is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2020 IS NULL OR q.year = 2020)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2020, 'May', 1, '7',
        '\text{The ionic equation for the reaction of magnesium with hydrochloric acid is}
( \text{Mg(s)} + 2\text{H}^+\text{(aq)} \rightarrow \text{Mg}^{2+}\text{(aq)} + \text{H}_2\text{(g)} )\text{.}
\text{The molar volume of a gas at r.t.p. } ( = 24 \text{ dm}^3 )\text{.}
\text{The volume of gas produced when } ( 1.2 \text{ g} ) \text{ of Mg reacts with HCl at r.t.p is}', '\text{The ionic equation for the reaction of magnesium with hydrochloric acid is}
( \text{Mg(s)} + 2 \text{H}^+\text{(aq)} \rightarrow \text{Mg}^{2+}\text{(aq)} + \text{H}_2 \text{(g)} )\text{.}
\text{The molar volume of a gas at r.t.p. } ( = 24 \text{ dm}^3 )\text{.}
\text{The volume of gas produced when } ( 1.2 \text{ g} ) \text{ of Mg reacts with HCl at r.t.p is}', 'LaTeX("The ionic equation for the reaction of magnesium with hydrochloric acid is\n$($Mg(s)$+ 2$H$^+$(aq)$\\rightarrow$Mg$^{2+}$(aq)$+$H$_2$(g)$)$.\nThe molar volume of a gas at r.t.p. $( = 24$ dm$^3 )$.\nThe volume of gas produced when $( 1.2$ g$)$ of Mg reacts with HCl at r.t.p is").parsingMode(.onlyEquations)', 'LaTeX("The ionic equation for the reaction of magnesium with hydrochloric acid is\n$($Mg(s)$+ 2$H$^+$(aq)$\\rightarrow$Mg$^{2+}$(aq)$+$H$_2$(g)$)$.\nThe molar volume of a gas at r.t.p. $( = 24$ dm$^3 )$.\nThe volume of gas produced when $( 1.2$ g$)$ of Mg reacts with HCl at r.t.p is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2020 IS NULL OR q.year = 2020)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2020, 'May', 1, '8',
        '\text{When } ( 86 \text{ g} ) \text{ of the ionic salt } ( \text{CaSO}_4 \cdot x\text{H}_2\text{O} ) \text{ is heated so that all of its water of crystallization is driven off and } ( 68.0 \text{ g} ) \text{ of } ( \text{CaSO}_4 ) \text{ remain, the value of } ( x ) \text{ is}', '\text{When } ( 86 \text{ g} ) \text{ of the ionic salt } ( \text{CaSO}_4 \cdot x\text{H}_2 \text{O} ) \text{ is heated so that all of its water of crystallization is driven off and } ( 68.0 \text{ g} ) \text{ of } ( \text{CaSO}_4 ) \text{ remain, the value of } ( x ) \text{ is}', 'LaTeX("When $( 86$ g$)$ of the ionic salt $($CaSO$_4 \\cdot x$H$_2$O$)$ is heated so that all of its water of crystallization is driven off and $( 68.0$ g$)$ of $($CaSO$_4 )$ remain, the value of $( x )$ is").parsingMode(.onlyEquations)', 'LaTeX("When $( 86$ g$)$ of the ionic salt $($CaSO$_4 \\cdot x$H$_2$O$)$ is heated so that all of its water of crystallization is driven off and $( 68.0$ g$)$ of $($CaSO$_4 )$ remain, the value of $( x )$ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2020 IS NULL OR q.year = 2020)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2020, 'May', 1, '14',
        '\text{The second ionization energy of calcium is } ( 1150 \text{ kJ mol}^{-1} )\text{. Which of the following equations represents this statement?}', '\text{The second ionization energy of calcium is } ( 1150 \text{ kJ mol}^{-1} )\text{. Which of the following equations represents this statement?}', 'LaTeX("The second ionization energy of calcium is $( 1150$ kJ mol$^{-1} )$. Which of the following equations represents this statement?").parsingMode(.onlyEquations)', 'LaTeX("The second ionization energy of calcium is $( 1150$ kJ mol$^{-1} )$. Which of the following equations represents this statement?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2020 IS NULL OR q.year = 2020)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2020, 'May', 1, '19',
        '\text{A buffer is made by dissolving } ( 28.8 \text{ g} ) \text{ of sodium benzoate, } ( \text{C}_6\text{H}_5\text{COONa} ) \text{, in } ( 1 \text{ dm}^3 ) \text{ of } ( 0.4 \text{ mol dm}^{-3} ) \text{ benzoic acid, } ( \text{C}_6\text{H}_5\text{COOH} )\text{. } ( \text{K}_{\text{a(benzoic acid)}} = 6.4 \times 10^{-5} \text{ mol dm}^{-3} )\text{. The pH of the buffer is}', '\text{A buffer is made by dissolving } ( 28.8 \text{ g} ) \text{ of sodium benzoate, } ( \text{C}_6 \text{H}_5 \text{COONa} ) \text{, in } ( 1 \text{ dm}^3 ) \text{ of } ( 0.4 \text{ mol dm}^{-3} ) \text{ benzoic acid, } ( \text{C}_6 \text{H}_5 \text{COOH} )\text{. } ( \text{K}_{\text{a(benzoic acid)}} = 6.4 \times 10^{-5} \text{ mol dm}^{-3} )\text{. The pH of the buffer is}', 'LaTeX("A buffer is made by dissolving $( 28.8$ g$)$ of sodium benzoate, $($C$_6$H$_5$COONa$)$, in $( 1$ dm$^3 )$ of $( 0.4$ mol dm$^{-3} )$ benzoic acid, $($C$_6$H$_5$COOH$)$. $($K$_{$a(benzoic acid)$} = 6.4 \\times 10^{-5}$ mol dm$^{-3} )$. The pH of the buffer is").parsingMode(.onlyEquations)', 'LaTeX("A buffer is made by dissolving $( 28.8$ g$)$ of sodium benzoate, $($C$_6$H$_5$COONa$)$, in $( 1$ dm$^3 )$ of $( 0.4$ mol dm$^{-3} )$ benzoic acid, $($C$_6$H$_5$COOH$)$. $($K$_{$a(benzoic acid)$} = 6.4 \\times 10^{-5}$ mol dm$^{-3} )$. The pH of the buffer is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2020 IS NULL OR q.year = 2020)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2020, 'May', 1, '22',
        '\text{Compounds P, Q and R form an equilibrium as shown below.}
( 2\text{P(aq)} + \text{Q(aq)} \rightleftharpoons 2\text{R(aq)} )
\text{The units for the equilibrium constant, } ( \text{K}_c ) \text{, are}', '\text{Compounds P, Q and R form an equilibrium as shown below.}
( 2 \text{P(aq)} + \text{Q(aq)} \rightleftharpoons 2 \text{R(aq)} )
\text{The units for the equilibrium constant, } ( \text{K}_c ) \text{, are}', 'LaTeX("Compounds P, Q and R form an equilibrium as shown below.\n$( 2$P(aq)$+$Q(aq)$\\rightleftharpoons 2$R(aq)$)$\nThe units for the equilibrium constant, $($K$_c )$, are").parsingMode(.onlyEquations)', 'LaTeX("Compounds P, Q and R form an equilibrium as shown below.\n$( 2$P(aq)$+$Q(aq)$\\rightleftharpoons 2$R(aq)$)$\nThe units for the equilibrium constant, $($K$_c )$, are").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2020 IS NULL OR q.year = 2020)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2020, 'May', 1, '23',
        '\text{The expression for the solubility product, } ( \text{k}_{sp} ) \text{, of lead iodide is}', '\text{The expression for the solubility product, } ( \text{k}_{sp} ) \text{, of lead iodide is}', 'LaTeX("The expression for the solubility product, $($k$_{sp} )$, of lead iodide is").parsingMode(.onlyEquations)', 'LaTeX("The expression for the solubility product, $($k$_{sp} )$, of lead iodide is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2020 IS NULL OR q.year = 2020)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2020, 'May', 1, '26',
        '\text{Which of the following pairs of substances would make a good buffer?}', '\text{Which of the following pairs of substances would make a good buffer?}', 'LaTeX("Which of the following pairs of substances would make a good buffer?").parsingMode(.onlyEquations)', 'LaTeX("Which of the following pairs of substances would make a good buffer?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2020 IS NULL OR q.year = 2020)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2020, 'May', 1, '28',
        '\text{What is the potential for a cell with the following reaction?}
( \text{Zn(s)} + \text{Br}_2\text{(aq)} \rightarrow \text{Zn}^{2+}\text{(aq)} + 2\text{Br}^-\text{(aq)} )', '\text{What is the potential for a cell with the following reaction?}
( \text{Zn(s)} + \text{Br}_2 \text{(aq)} \rightarrow \text{Zn}^{2+}\text{(aq)} + 2 \text{Br}^-\text{(aq)} )', 'LaTeX("What is the potential for a cell with the following reaction?\n$($Zn(s)$+$Br$_2$(aq)$\\rightarrow$Zn$^{2+}$(aq)$+ 2$Br$^-$(aq)$)$").parsingMode(.onlyEquations)', 'LaTeX("What is the potential for a cell with the following reaction?\n$($Zn(s)$+$Br$_2$(aq)$\\rightarrow$Zn$^{2+}$(aq)$+ 2$Br$^-$(aq)$)$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2020 IS NULL OR q.year = 2020)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2020, 'May', 1, '29',
        '\text{The value of } ( \text{K}_c ) \text{ for the equilibrium}
( \text{H}_2\text{(g)} + \text{I}_2\text{(g)} \rightleftharpoons 2\text{HI(g)} )
\text{is 860 at } ( 25 \text{ } ^\circ\text{C} )\text{.}
\text{What is the value of } ( \text{K}_c ) \text{ at } ( 25 \text{ } ^\circ\text{C} ) \text{ for the following equilibrium?}
( \frac{1}{2}\text{H}_2\text{(g)} + \frac{1}{2}\text{I}_2\text{(g)} \rightleftharpoons \text{HI(g)} )', '\text{The value of } ( \text{K}_c ) \text{ for the equilibrium}
( \text{H}_2 \text{(g)} + \text{I}_2 \text{(g)} \rightleftharpoons 2 \text{HI(g)} )
\text{is 860 at } ( 25 \text{ } ^\circ\text{C} )\text{.}
\text{What is the value of } ( \text{K}_c ) \text{ at } ( 25 \text{ } ^\circ\text{C} ) \text{ for the following equilibrium?}
( \frac{1}{2}\text{H}_2 \text{(g)} + \frac{1}{2}\text{I}_2 \text{(g)} \rightleftharpoons \text{HI(g)} )', 'LaTeX("The value of $($K$_c )$ for the equilibrium\n$($H$_2$(g)$+$I$_2$(g)$\\rightleftharpoons 2$HI(g)$)$\nis 860 at $( 25$ $^\\circ$C$)$.\nWhat is the value of $($K$_c )$ at $( 25$ $^\\circ$C$)$ for the following equilibrium?\n$( \\frac{1}{2}$H$_2$(g)$+ \\frac{1}{2}$I$_2$(g)$\\rightleftharpoons$HI(g)$)$").parsingMode(.onlyEquations)', 'LaTeX("The value of $($K$_c )$ for the equilibrium\n$($H$_2$(g)$+$I$_2$(g)$\\rightleftharpoons 2$HI(g)$)$\nis 860 at $( 25$ $^\\circ$C$)$.\nWhat is the value of $($K$_c )$ at $( 25$ $^\\circ$C$)$ for the following equilibrium?\n$( \\frac{1}{2}$H$_2$(g)$+ \\frac{1}{2}$I$_2$(g)$\\rightleftharpoons$HI(g)$)$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2020 IS NULL OR q.year = 2020)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2020, 'May', 1, '30',
        '\text{The standard electrode potential of tin (Sn) is } ( \text{Sn}^{2+}\text{(aq)} + 2\text{e}^- \rightleftharpoons \text{Sn(s)}, \text{E}^\circ = -0.14 \text{ V} )\text{.}
\text{In which of the following equations is the metal UNABLE to reduce } ( \text{Sn}^{2+} ) \text{?}', '\text{The standard electrode potential of tin (Sn) is } ( \text{Sn}^{2+}\text{(aq)} + 2 \text{e}^- \rightleftharpoons \text{Sn(s)}, \text{E}^\circ = -0.14 \text{ V} )\text{.}
\text{In which of the following equations is the metal UNABLE to reduce } ( \text{Sn}^{2+} ) \text{?}', 'LaTeX("The standard electrode potential of tin (Sn) is $($Sn$^{2+}$(aq)$+ 2$e$^- \\rightleftharpoons$Sn(s)$,$E$^\\circ = -0.14$ V$)$.\nIn which of the following equations is the metal UNABLE to reduce $($Sn$^{2+} )$?").parsingMode(.onlyEquations)', 'LaTeX("The standard electrode potential of tin (Sn) is $($Sn$^{2+}$(aq)$+ 2$e$^- \\rightleftharpoons$Sn(s)$,$E$^\\circ = -0.14$ V$)$.\nIn which of the following equations is the metal UNABLE to reduce $($Sn$^{2+} )$?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2020 IS NULL OR q.year = 2020)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2020, 'May', 1, '45',
        '\text{What deduction can be made from the following reactions of iodine and chlorine with sodium thiosulfate?}
( \text{I}_2\text{(aq)} + 2\text{S}_2\text{O}_3^{2-}\text{(aq)} \rightarrow 2\text{I}^-\text{(aq)} + \text{S}_4\text{O}_6^{2-}\text{(aq)} )
( 4\text{Cl}_2\text{(aq)} + \text{S}_2\text{O}_3^{2-}\text{(aq)} + 5\text{H}_2\text{O(l)} \rightarrow 8\text{Cl}^-\text{(aq)} + 2\text{SO}_4^{2-}\text{(aq)} + 10\text{H}^+\text{(aq)} )', '\text{What deduction can be made from the following reactions of iodine and chlorine with sodium thiosulfate?}
( \text{I}_2 \text{(aq)} + 2 \text{S}_2 \text{O}_3^{2-}\text{(aq)} \rightarrow 2 \text{I}^-\text{(aq)} + \text{S}_4 \text{O}_6^{2-}\text{(aq)} )
( 4 \text{Cl}_2 \text{(aq)} + \text{S}_2 \text{O}_3^{2-}\text{(aq)} + 5 \text{H}_2 \text{O(l)} \rightarrow 8 \text{Cl}^-\text{(aq)} + 2 \text{SO}_4^{2-}\text{(aq)} + 10 \text{H}^+\text{(aq)} )', 'LaTeX("What deduction can be made from the following reactions of iodine and chlorine with sodium thiosulfate?\n$($I$_2$(aq)$+ 2$S$_2$O$_3^{2-}$(aq)$\\rightarrow 2$I$^-$(aq)$+$S$_4$O$_6^{2-}$(aq)$)$\n$( 4$Cl$_2$(aq)$+$S$_2$O$_3^{2-}$(aq)$+ 5$H$_2$O(l)$\\rightarrow 8$Cl$^-$(aq)$+ 2$SO$_4^{2-}$(aq)$+ 10$H$^+$(aq)$)$").parsingMode(.onlyEquations)', 'LaTeX("What deduction can be made from the following reactions of iodine and chlorine with sodium thiosulfate?\n$($I$_2$(aq)$+ 2$S$_2$O$_3^{2-}$(aq)$\\rightarrow 2$I$^-$(aq)$+$S$_4$O$_6^{2-}$(aq)$)$\n$( 4$Cl$_2$(aq)$+$S$_2$O$_3^{2-}$(aq)$+ 5$H$_2$O(l)$\\rightarrow 8$Cl$^-$(aq)$+ 2$SO$_4^{2-}$(aq)$+ 10$H$^+$(aq)$)$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2020 IS NULL OR q.year = 2020)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '1',
        '\text{Element X undergoes } ( \beta ) \text{ decay. Which of the following equations is correct?}', '\text{Element X undergoes } ( \beta ) \text{ decay. Which of the following equations is correct?}', 'LaTeX("Element X undergoes $( \\beta )$ decay. Which of the following equations is correct?").parsingMode(.onlyEquations)', 'LaTeX("Element X undergoes $( \\beta )$ decay. Which of the following equations is correct?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '4',
        '\text{The standard enthalpy changes for two reactions are as follows:}
( \text{Fe(s)} + \frac{3}{2}\text{O}_2\text{(g)} \rightarrow \text{Fe}_2\text{O}_3\text{(s), } \Delta \text{H}^\ominus = -822 \text{ kJ mol}^{-1} )
( \text{C(s)} + \frac{1}{2}\text{O}_2\text{(g)} \rightarrow \text{CO(g), } \Delta \text{H}^\ominus = -110 \text{ kJ mol}^{-1} )
\text{What is the standard enthalpy change, in kJ, for the reaction }
( \text{Fe}_2\text{O}_3\text{(s)} + 3\text{C(s)} \rightarrow 2\text{Fe(s)} + 3\text{CO(g)} ) \text{?}', '\text{The standard enthalpy changes for two reactions are as follows:}
( \text{Fe(s)} + \frac{3}{2}\text{O}_2 \text{(g)} \rightarrow \text{Fe}_2 \text{O}_3 \text{(s), } \Delta \text{H}^\ominus = -822 \text{ kJ mol}^{-1} )
( \text{C(s)} + \frac{1}{2}\text{O}_2 \text{(g)} \rightarrow \text{CO(g), } \Delta \text{H}^\ominus = -110 \text{ kJ mol}^{-1} )
\text{What is the standard enthalpy change, in kJ, for the reaction }
( \text{Fe}_2 \text{O}_3 \text{(s)} + 3 \text{C(s)} \rightarrow 2 \text{Fe(s)} + 3 \text{CO(g)} ) \text{?}', 'LaTeX("The standard enthalpy changes for two reactions are as follows:\n$($Fe(s)$+ \\frac{3}{2}$O$_2$(g)$\\rightarrow$Fe$_2$O$_3$(s), $\\Delta$H$^\\ominus = -822$ kJ mol$^{-1} )$\n$($C(s)$+ \\frac{1}{2}$O$_2$(g)$\\rightarrow$CO(g), $\\Delta$H$^\\ominus = -110$ kJ mol$^{-1} )$\nWhat is the standard enthalpy change, in kJ, for the reaction \n$($Fe$_2$O$_3$(s)$+ 3$C(s)$\\rightarrow 2$Fe(s)$+ 3$CO(g)$)$?").parsingMode(.onlyEquations)', 'LaTeX("The standard enthalpy changes for two reactions are as follows:\n$($Fe(s)$+ \\frac{3}{2}$O$_2$(g)$\\rightarrow$Fe$_2$O$_3$(s), $\\Delta$H$^\\ominus = -822$ kJ mol$^{-1} )$\n$($C(s)$+ \\frac{1}{2}$O$_2$(g)$\\rightarrow$CO(g), $\\Delta$H$^\\ominus = -110$ kJ mol$^{-1} )$\nWhat is the standard enthalpy change, in kJ, for the reaction \n$($Fe$_2$O$_3$(s)$+ 3$C(s)$\\rightarrow 2$Fe(s)$+ 3$CO(g)$)$?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '9',
        '\text{When } ( 86 \text{ g} ) \text{ of the ionic salt } ( \text{CaSO}_4 \cdot x\text{H}_2\text{O} ) \text{ is heated so that all of its water of crystallization is driven off and } ( 68.0 \text{ g} ) \text{ of } ( \text{CaSO}_4 ) \text{ remain, the value of } ( x ) \text{ is}', '\text{When } ( 86 \text{ g} ) \text{ of the ionic salt } ( \text{CaSO}_4 \cdot x\text{H}_2 \text{O} ) \text{ is heated so that all of its water of crystallization is driven off and } ( 68.0 \text{ g} ) \text{ of } ( \text{CaSO}_4 ) \text{ remain, the value of } ( x ) \text{ is}', 'LaTeX("When $( 86$ g$)$ of the ionic salt $($CaSO$_4 \\cdot x$H$_2$O$)$ is heated so that all of its water of crystallization is driven off and $( 68.0$ g$)$ of $($CaSO$_4 )$ remain, the value of $( x )$ is").parsingMode(.onlyEquations)', 'LaTeX("When $( 86$ g$)$ of the ionic salt $($CaSO$_4 \\cdot x$H$_2$O$)$ is heated so that all of its water of crystallization is driven off and $( 68.0$ g$)$ of $($CaSO$_4 )$ remain, the value of $( x )$ is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '19',
        '\text{A buffer is made by dissolving } ( 28.8 \text{ g} ) \text{ of sodium benzoate, } ( \text{C}_6\text{H}_5\text{COONa} ) \text{, in } ( 1 \text{ dm}^3 ) \text{ of } ( 0.4 \text{ mol dm}^{-3} ) \text{ benzoic acid, } ( \text{C}_6\text{H}_5\text{COOH} )\text{. } ( \text{K}_{a(\text{benzoic acid})} = 6.4 \times 10^{-5} \text{ mol dm}^{-3} )\text{. The pH of the buffer is}', '\text{A buffer is made by dissolving } ( 28.8 \text{ g} ) \text{ of sodium benzoate, } ( \text{C}_6 \text{H}_5 \text{COONa} ) \text{, in } ( 1 \text{ dm}^3 ) \text{ of } ( 0.4 \text{ mol dm}^{-3} ) \text{ benzoic acid, } ( \text{C}_6 \text{H}_5 \text{COOH} )\text{. } ( \text{K}_{a(\text{benzoic acid})} = 6.4 \times 10^{-5} \text{ mol dm}^{-3} )\text{. The pH of the buffer is}', 'LaTeX("A buffer is made by dissolving $( 28.8$ g$)$ of sodium benzoate, $($C$_6$H$_5$COONa$)$, in $( 1$ dm$^3 )$ of $( 0.4$ mol dm$^{-3} )$ benzoic acid, $($C$_6$H$_5$COOH$)$. $($K$_{a($benzoic acid$)} = 6.4 \\times 10^{-5}$ mol dm$^{-3} )$. The pH of the buffer is").parsingMode(.onlyEquations)', 'LaTeX("A buffer is made by dissolving $( 28.8$ g$)$ of sodium benzoate, $($C$_6$H$_5$COONa$)$, in $( 1$ dm$^3 )$ of $( 0.4$ mol dm$^{-3} )$ benzoic acid, $($C$_6$H$_5$COOH$)$. $($K$_{a($benzoic acid$)} = 6.4 \\times 10^{-5}$ mol dm$^{-3} )$. The pH of the buffer is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '21',
        '\text{Item 21 refers to the following diagram showing two test tubes with } ( \text{N}_2\text{O}_4 ) \text{ under different conditions.}
\text{What will be observed in Test Tubes I and II for the following gaseous equilibrium?}
( \text{N}_2\text{O}_4\text{(g)} \rightleftharpoons 2\text{NO}_2\text{(g), } \Delta \text{H} = +58 \text{ kJ mol}^{-1} )', '\text{Item 21 refers to the following diagram showing two test tubes with } ( \text{N}_2 \text{O}_4 ) \text{ under different conditions.}
\text{What will be observed in Test Tubes I and II for the following gaseous equilibrium?}
( \text{N}_2 \text{O}_4 \text{(g)} \rightleftharpoons 2 \text{NO}_2 \text{(g), } \Delta \text{H} = +58 \text{ kJ mol}^{-1} )', 'LaTeX("Item 21 refers to the following diagram showing two test tubes with $($N$_2$O$_4 )$ under different conditions.\nWhat will be observed in Test Tubes I and II for the following gaseous equilibrium?\n$($N$_2$O$_4$(g)$\\rightleftharpoons 2$NO$_2$(g), $\\Delta$H$= +58$ kJ mol$^{-1} )$").parsingMode(.onlyEquations)', 'LaTeX("Item 21 refers to the following diagram showing two test tubes with $($N$_2$O$_4 )$ under different conditions.\nWhat will be observed in Test Tubes I and II for the following gaseous equilibrium?\n$($N$_2$O$_4$(g)$\\rightleftharpoons 2$NO$_2$(g), $\\Delta$H$= +58$ kJ mol$^{-1} )$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '22',
        '\text{The value of } ( \text{K}_c ) \text{ for the equilibrium } ( \text{H}_2\text{(g)} + \text{I}_2\text{(g)} \rightleftharpoons 2\text{HI(g)} ) \text{ is } ( 860 ) \text{ at } ( 25 \text{ } ^\circ\text{C} )\text{. What is the value of } ( \text{K}_c ) \text{ at } ( 25 \text{ } ^\circ\text{C} ) \text{ for the following equilibrium?}
( \frac{1}{2}\text{H}_2\text{(g)} + \frac{1}{2}\text{I}_2\text{(g)} \rightleftharpoons \text{HI(g)} )', '\text{The value of } ( \text{K}_c ) \text{ for the equilibrium } ( \text{H}_2 \text{(g)} + \text{I}_2 \text{(g)} \rightleftharpoons 2 \text{HI(g)} ) \text{ is } ( 860 ) \text{ at } ( 25 \text{ } ^\circ\text{C} )\text{. What is the value of } ( \text{K}_c ) \text{ at } ( 25 \text{ } ^\circ\text{C} ) \text{ for the following equilibrium?}
( \frac{1}{2}\text{H}_2 \text{(g)} + \frac{1}{2}\text{I}_2 \text{(g)} \rightleftharpoons \text{HI(g)} )', 'LaTeX("The value of $($K$_c )$ for the equilibrium $($H$_2$(g)$+$I$_2$(g)$\\rightleftharpoons 2$HI(g)$)$ is $( 860 )$ at $( 25$ $^\\circ$C$)$. What is the value of $($K$_c )$ at $( 25$ $^\\circ$C$)$ for the following equilibrium?\n$( \\frac{1}{2}$H$_2$(g)$+ \\frac{1}{2}$I$_2$(g)$\\rightleftharpoons$HI(g)$)$").parsingMode(.onlyEquations)', 'LaTeX("The value of $($K$_c )$ for the equilibrium $($H$_2$(g)$+$I$_2$(g)$\\rightleftharpoons 2$HI(g)$)$ is $( 860 )$ at $( 25$ $^\\circ$C$)$. What is the value of $($K$_c )$ at $( 25$ $^\\circ$C$)$ for the following equilibrium?\n$( \\frac{1}{2}$H$_2$(g)$+ \\frac{1}{2}$I$_2$(g)$\\rightleftharpoons$HI(g)$)$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '23',
        '\text{The value of } ( \text{K}_p ) \text{ for the equilibrium reaction } ( \text{H}_2\text{(g)} + \text{I}_2\text{(g)} \rightleftharpoons 2\text{HI(g)} ) \text{ at } ( 444 \text{ } ^\circ\text{C} ) \text{ and } ( 1 \text{ atm} ) \text{ pressure is } ( 50 )\text{. What is the value of } ( \text{K}_p ) \text{ if the pressure is changed to } ( 2 \text{ atm} ) \text{ and the temperature remains the same?}', '\text{The value of } ( \text{K}_p ) \text{ for the equilibrium reaction } ( \text{H}_2 \text{(g)} + \text{I}_2 \text{(g)} \rightleftharpoons 2 \text{HI(g)} ) \text{ at } ( 444 \text{ } ^\circ\text{C} ) \text{ and } ( 1 \text{ atm} ) \text{ pressure is } ( 50 )\text{. What is the value of } ( \text{K}_p ) \text{ if the pressure is changed to } ( 2 \text{ atm} ) \text{ and the temperature remains the same?}', 'LaTeX("The value of $($K$_p )$ for the equilibrium reaction $($H$_2$(g)$+$I$_2$(g)$\\rightleftharpoons 2$HI(g)$)$ at $( 444$ $^\\circ$C$)$ and $( 1$ atm$)$ pressure is $( 50 )$. What is the value of $($K$_p )$ if the pressure is changed to $( 2$ atm$)$ and the temperature remains the same?").parsingMode(.onlyEquations)', 'LaTeX("The value of $($K$_p )$ for the equilibrium reaction $($H$_2$(g)$+$I$_2$(g)$\\rightleftharpoons 2$HI(g)$)$ at $( 444$ $^\\circ$C$)$ and $( 1$ atm$)$ pressure is $( 50 )$. What is the value of $($K$_p )$ if the pressure is changed to $( 2$ atm$)$ and the temperature remains the same?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '27',
        '\text{Compounds P, Q and R form an equilibrium as shown below.}
( 2\text{P(aq)} + \text{Q(aq)} \rightleftharpoons 2\text{R(aq)} )
\text{The units for the equilibrium constant, } ( \text{K}_c ) \text{, are}', '\text{Compounds P, Q and R form an equilibrium as shown below.}
( 2 \text{P(aq)} + \text{Q(aq)} \rightleftharpoons 2 \text{R(aq)} )
\text{The units for the equilibrium constant, } ( \text{K}_c ) \text{, are}', 'LaTeX("Compounds P, Q and R form an equilibrium as shown below.\n$( 2$P(aq)$+$Q(aq)$\\rightleftharpoons 2$R(aq)$)$\nThe units for the equilibrium constant, $($K$_c )$, are").parsingMode(.onlyEquations)', 'LaTeX("Compounds P, Q and R form an equilibrium as shown below.\n$( 2$P(aq)$+$Q(aq)$\\rightleftharpoons 2$R(aq)$)$\nThe units for the equilibrium constant, $($K$_c )$, are").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '28',
        '\text{Which of the following pairs of substances would make a good buffer?}', '\text{Which of the following pairs of substances would make a good buffer?}', 'LaTeX("Which of the following pairs of substances would make a good buffer?").parsingMode(.onlyEquations)', 'LaTeX("Which of the following pairs of substances would make a good buffer?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '29',
        '\text{Marine animals such as oysters and other shellfish rely on the slow precipitation of calcium carbonate to form their shells. Which of the following properties help(s) this process?}
I. \text{Greater ionic product of } ( \text{Ca}^{2+} ) \text{ and } ( \text{CO}_3^{2-} ) \text{ ions}
II. \text{Smaller solubility product of } ( \text{CaCO}_3\text{(s)} )
III. \text{Greater solubility product of } ( \text{CaCO}_3\text{(s)} )', '\text{Marine animals such as oysters and other shellfish rely on the slow precipitation of calcium carbonate to form their shells. Which of the following properties help(s) this process?}
I. \text{Greater ionic product of } ( \text{Ca}^{2+} ) \text{ and } ( \text{CO}_3^{2-} ) \text{ ions}
II. \text{Smaller solubility product of } ( \text{CaCO}_3 \text{(s)} )
III. \text{Greater solubility product of } ( \text{CaCO}_3 \text{(s)} )', 'LaTeX("Marine animals such as oysters and other shellfish rely on the slow precipitation of calcium carbonate to form their shells. Which of the following properties help(s) this process?\n$I.$Greater ionic product of $($Ca$^{2+} )$ and $($CO$_3^{2-} )$ ions\n$II.$Smaller solubility product of $($CaCO$_3$(s)$)$\n$III.$Greater solubility product of $($CaCO$_3$(s)$)$").parsingMode(.onlyEquations)', 'LaTeX("Marine animals such as oysters and other shellfish rely on the slow precipitation of calcium carbonate to form their shells. Which of the following properties help(s) this process?\n$I.$Greater ionic product of $($Ca$^{2+} )$ and $($CO$_3^{2-} )$ ions\n$II.$Smaller solubility product of $($CaCO$_3$(s)$)$\n$III.$Greater solubility product of $($CaCO$_3$(s)$)$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '33',
        '\text{Which of the following compounds would produce the LOWEST pH when } ( 0.5 \text{ mol} ) \text{ of it is bubbled into 1 litre of water?}', '\text{Which of the following compounds would produce the LOWEST pH when } ( 0.5 \text{ mol} ) \text{ of it is bubbled into 1 litre of water?}', 'LaTeX("Which of the following compounds would produce the LOWEST pH when $( 0.5$ mol$)$ of it is bubbled into 1 litre of water?").parsingMode(.onlyEquations)', 'LaTeX("Which of the following compounds would produce the LOWEST pH when $( 0.5$ mol$)$ of it is bubbled into 1 litre of water?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '45',
        '\text{What deduction can be made from the following reactions of iodine and chlorine with sodium thiosulfate?}
( \text{I}_2\text{(aq)} + 2\text{S}_2\text{O}_3^{2-}\text{(aq)} \rightarrow 2\text{I}^-\text{(aq)} + \text{S}_4\text{O}_6^{2-}\text{(aq)} )
( 4\text{Cl}_2\text{(aq)} + \text{S}_2\text{O}_3^{2-}\text{(aq)} + 5\text{H}_2\text{O(l)} \rightarrow 8\text{Cl}^-\text{(aq)} + 2\text{SO}_4^{2-}\text{(aq)} + 10\text{H}^+\text{(aq)} )', '\text{What deduction can be made from the following reactions of iodine and chlorine with sodium thiosulfate?}
( \text{I}_2 \text{(aq)} + 2 \text{S}_2 \text{O}_3^{2-}\text{(aq)} \rightarrow 2 \text{I}^-\text{(aq)} + \text{S}_4 \text{O}_6^{2-}\text{(aq)} )
( 4 \text{Cl}_2 \text{(aq)} + \text{S}_2 \text{O}_3^{2-}\text{(aq)} + 5 \text{H}_2 \text{O(l)} \rightarrow 8 \text{Cl}^-\text{(aq)} + 2 \text{SO}_4^{2-}\text{(aq)} + 10 \text{H}^+\text{(aq)} )', 'LaTeX("What deduction can be made from the following reactions of iodine and chlorine with sodium thiosulfate?\n$($I$_2$(aq)$+ 2$S$_2$O$_3^{2-}$(aq)$\\rightarrow 2$I$^-$(aq)$+$S$_4$O$_6^{2-}$(aq)$)$\n$( 4$Cl$_2$(aq)$+$S$_2$O$_3^{2-}$(aq)$+ 5$H$_2$O(l)$\\rightarrow 8$Cl$^-$(aq)$+ 2$SO$_4^{2-}$(aq)$+ 10$H$^+$(aq)$)$").parsingMode(.onlyEquations)', 'LaTeX("What deduction can be made from the following reactions of iodine and chlorine with sodium thiosulfate?\n$($I$_2$(aq)$+ 2$S$_2$O$_3^{2-}$(aq)$\\rightarrow 2$I$^-$(aq)$+$S$_4$O$_6^{2-}$(aq)$)$\n$( 4$Cl$_2$(aq)$+$S$_2$O$_3^{2-}$(aq)$+ 5$H$_2$O(l)$\\rightarrow 8$Cl$^-$(aq)$+ 2$SO$_4^{2-}$(aq)$+ 10$H$^+$(aq)$)$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2022, 'May', 1, '2',
        '\text{To determine why a hairdresser stores her bottle of } ( \text{H}_2\text{O}_2 ) \text{ in the refrigerator, a student sets up the apparatus shown below and recorded the volume of gas in the syringe every 30 seconds for 3 minutes. This activity was done in a dark room, at room temperature and in a dark room at } ( 5\text{ }^\circ\text{C} )\text{.}
\text{Which of the following statements is NOT a possible assumption?}', '\text{To determine why a hairdresser stores her bottle of } ( \text{H}_2 \text{O}_2 ) \text{ in the refrigerator, a student sets up the apparatus shown below and recorded the volume of gas in the syringe every 30 seconds for 3 minutes. This activity was done in a dark room, at room temperature and in a dark room at } ( 5 \text{ }^\circ\text{C} )\text{.}
\text{Which of the following statements is NOT a possible assumption?}', 'LaTeX("To determine why a hairdresser stores her bottle of $($H$_2$O$_2 )$ in the refrigerator, a student sets up the apparatus shown below and recorded the volume of gas in the syringe every 30 seconds for 3 minutes. This activity was done in a dark room, at room temperature and in a dark room at $( 5$ $^\\circ$C$)$.\nWhich of the following statements is NOT a possible assumption?").parsingMode(.onlyEquations)', 'LaTeX("To determine why a hairdresser stores her bottle of $($H$_2$O$_2 )$ in the refrigerator, a student sets up the apparatus shown below and recorded the volume of gas in the syringe every 30 seconds for 3 minutes. This activity was done in a dark room, at room temperature and in a dark room at $( 5$ $^\\circ$C$)$.\nWhich of the following statements is NOT a possible assumption?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '5',
        '\text{Items 5 and 6 refer to the following half equations for the reaction between iodine and sodium thiosulfate.}
( 2\text{S}_2\text{O}_3^{2-}\text{(aq)} \rightarrow \text{S}_4\text{O}_6^{2-}\text{(aq)} + 2\text{e}^- )
( \text{I}_2\text{(aq)} + 2\text{e}^- \rightarrow 2\text{I}^-\text{(aq)} )
\text{The overall balanced chemical equation for the reaction is}', '\text{Items 5 and 6 refer to the following half equations for the reaction between iodine and sodium thiosulfate.}
( 2 \text{S}_2 \text{O}_3^{2-}\text{(aq)} \rightarrow \text{S}_4 \text{O}_6^{2-}\text{(aq)} + 2 \text{e}^- )
( \text{I}_2 \text{(aq)} + 2 \text{e}^- \rightarrow 2 \text{I}^-\text{(aq)} )
\text{The overall balanced chemical equation for the reaction is}', 'LaTeX("Items 5 and 6 refer to the following half equations for the reaction between iodine and sodium thiosulfate.\n$( 2$S$_2$O$_3^{2-}$(aq)$\\rightarrow$S$_4$O$_6^{2-}$(aq)$+ 2$e$^- )$\n$($I$_2$(aq)$+ 2$e$^- \\rightarrow 2$I$^-$(aq)$)$\nThe overall balanced chemical equation for the reaction is").parsingMode(.onlyEquations)', 'LaTeX("Items 5 and 6 refer to the following half equations for the reaction between iodine and sodium thiosulfate.\n$( 2$S$_2$O$_3^{2-}$(aq)$\\rightarrow$S$_4$O$_6^{2-}$(aq)$+ 2$e$^- )$\n$($I$_2$(aq)$+ 2$e$^- \\rightarrow 2$I$^-$(aq)$)$\nThe overall balanced chemical equation for the reaction is").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '6',
        '\text{The oxidizing agent is}', '\text{The oxidizing agent is}', 'LaTeX("The oxidizing agent is").parsingMode(.onlyEquations)', 'LaTeX("The oxidizing agent is").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '8',
        '\text{Which of the following gases is CLOSEST to behaving as an ideal gas under the stated conditions?}', '\text{Which of the following gases is CLOSEST to behaving as an ideal gas under the stated conditions?}', 'LaTeX("Which of the following gases is CLOSEST to behaving as an ideal gas under the stated conditions?").parsingMode(.onlyEquations)', 'LaTeX("Which of the following gases is CLOSEST to behaving as an ideal gas under the stated conditions?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '14',
        '\text{The second ionization energy of calcium is } ( 1150\text{ kJ mol}^{-1} )\text{. Which of the following equations represents this statement?}', '\text{The second ionization energy of calcium is } ( 1150 \text{ kJ mol}^{-1} )\text{. Which of the following equations represents this statement?}', 'LaTeX("The second ionization energy of calcium is $( 1150$ kJ mol$^{-1} )$. Which of the following equations represents this statement?").parsingMode(.onlyEquations)', 'LaTeX("The second ionization energy of calcium is $( 1150$ kJ mol$^{-1} )$. Which of the following equations represents this statement?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '15',
        '\text{Copper(II) nitrate decomposes according to the following equation:}
( 2\text{Cu(NO}_3\text{)}_2 \rightarrow 2\text{CuO} + 4\text{NO}_2 + \text{O}_2 )
\text{What is the volume of nitrogen(IV) oxide formed when } ( 18.8\text{ g} ) \text{ of copper(II) nitrate is heated to constant mass at rtp?}', '\text{Copper(II) nitrate decomposes according to the following equation:}
( 2 \text{Cu(NO}_3 \text{)}_2 \rightarrow 2 \text{CuO} + 4 \text{NO}_2 + \text{O}_2 )
\text{What is the volume of nitrogen(IV) oxide formed when } ( 18.8 \text{ g} ) \text{ of copper(II) nitrate is heated to constant mass at rtp?}', 'LaTeX("Copper(II) nitrate decomposes according to the following equation:\n$( 2$Cu(NO$_3$)$_2 \\rightarrow 2$CuO$+ 4$NO$_2 +$O$_2 )$\nWhat is the volume of nitrogen(IV) oxide formed when $( 18.8$ g$)$ of copper(II) nitrate is heated to constant mass at rtp?").parsingMode(.onlyEquations)', 'LaTeX("Copper(II) nitrate decomposes according to the following equation:\n$( 2$Cu(NO$_3$)$_2 \\rightarrow 2$CuO$+ 4$NO$_2 +$O$_2 )$\nWhat is the volume of nitrogen(IV) oxide formed when $( 18.8$ g$)$ of copper(II) nitrate is heated to constant mass at rtp?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '16',
        '\text{Items 16–18 refer to the following diagram of an electrochemical cell.}
( \text{Au}^{3+}\text{(aq)} + 3\text{e}^- \rightarrow \text{Au(s), } +1.50\text{V} )
( \text{Pb}^{2+}\text{(aq)} + 2\text{e}^- \rightarrow \text{Pb(s), } -0.13\text{V} )
\text{Which of the following processes occurs as the cell operates?}', '\text{Items 16–18 refer to the following diagram of an electrochemical cell.}
( \text{Au}^{3+}\text{(aq)} + 3 \text{e}^- \rightarrow \text{Au(s), } +1.50 \text{V} )
( \text{Pb}^{2+}\text{(aq)} + 2 \text{e}^- \rightarrow \text{Pb(s), } -0.13 \text{V} )
\text{Which of the following processes occurs as the cell operates?}', 'LaTeX("Items 16–18 refer to the following diagram of an electrochemical cell.\n$($Au$^{3+}$(aq)$+ 3$e$^- \\rightarrow$Au(s), $+1.50$V$)$\n$($Pb$^{2+}$(aq)$+ 2$e$^- \\rightarrow$Pb(s), $-0.13$V$)$\nWhich of the following processes occurs as the cell operates?").parsingMode(.onlyEquations)', 'LaTeX("Items 16–18 refer to the following diagram of an electrochemical cell.\n$($Au$^{3+}$(aq)$+ 3$e$^- \\rightarrow$Au(s), $+1.50$V$)$\n$($Pb$^{2+}$(aq)$+ 2$e$^- \\rightarrow$Pb(s), $-0.13$V$)$\nWhich of the following processes occurs as the cell operates?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '17',
        '\text{The initial voltage is}', '\text{The initial voltage is}', 'LaTeX("The initial voltage is").parsingMode(.onlyEquations)', 'LaTeX("The initial voltage is").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '19',
        '\text{A buffer is made by dissolving } ( 28.8\text{ g} ) \text{ of sodium benzoate, } ( \text{C}_6\text{H}_5\text{COONa} )\text{, in } ( 1\text{ dm}^3 ) \text{ of } ( 0.4\text{ mol dm}^{-3} ) \text{ benzoic acid, } ( \text{C}_6\text{H}_5\text{COOH} )\text{. } ( \text{K}_{\text{a(benzoic acid)}} = 6.4 \times 10^{-5}\text{ mol dm}^{-3} )\text{.}
\text{The pH of the buffer is}', '\text{A buffer is made by dissolving } ( 28.8 \text{ g} ) \text{ of sodium benzoate, } ( \text{C}_6 \text{H}_5 \text{COONa} )\text{, in } ( 1 \text{ dm}^3 ) \text{ of } ( 0.4 \text{ mol dm}^{-3} ) \text{ benzoic acid, } ( \text{C}_6 \text{H}_5 \text{COOH} )\text{. } ( \text{K}_{\text{a(benzoic acid)}} = 6.4 \times 10^{-5}\text{ mol dm}^{-3} )\text{.}
\text{The pH of the buffer is}', 'LaTeX("A buffer is made by dissolving $( 28.8$ g$)$ of sodium benzoate, $($C$_6$H$_5$COONa$)$, in $( 1$ dm$^3 )$ of $( 0.4$ mol dm$^{-3} )$ benzoic acid, $($C$_6$H$_5$COOH$)$. $($K$_{$a(benzoic acid)$} = 6.4 \\times 10^{-5}$ mol dm$^{-3} )$.\nThe pH of the buffer is").parsingMode(.onlyEquations)', 'LaTeX("A buffer is made by dissolving $( 28.8$ g$)$ of sodium benzoate, $($C$_6$H$_5$COONa$)$, in $( 1$ dm$^3 )$ of $( 0.4$ mol dm$^{-3} )$ benzoic acid, $($C$_6$H$_5$COOH$)$. $($K$_{$a(benzoic acid)$} = 6.4 \\times 10^{-5}$ mol dm$^{-3} )$.\nThe pH of the buffer is").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '22',
        '\text{Compounds P, Q and R form an equilibrium as shown below.}
( 2\text{P(aq)} + \text{Q(aq)} \rightleftharpoons 2\text{R(aq)} )
\text{The units for the equilibrium constant, } ( \text{K}_c )\text{, are}', '\text{Compounds P, Q and R form an equilibrium as shown below.}
( 2 \text{P(aq)} + \text{Q(aq)} \rightleftharpoons 2 \text{R(aq)} )
\text{The units for the equilibrium constant, } ( \text{K}_c )\text{, are}', 'LaTeX("Compounds P, Q and R form an equilibrium as shown below.\n$( 2$P(aq)$+$Q(aq)$\\rightleftharpoons 2$R(aq)$)$\nThe units for the equilibrium constant, $($K$_c )$, are").parsingMode(.onlyEquations)', 'LaTeX("Compounds P, Q and R form an equilibrium as shown below.\n$( 2$P(aq)$+$Q(aq)$\\rightleftharpoons 2$R(aq)$)$\nThe units for the equilibrium constant, $($K$_c )$, are").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '23',
        '\text{In a saturated solution of silver carbonate, equilibrium can be established between dissolved ions and undissolved salt according to the following equation.}
( \text{Ag}_2\text{CO}_3\text{(s)} \rightarrow 2\text{Ag}^+\text{(aq)} + \text{CO}_3^{2-}\text{(aq)} )
\text{What is the solubility of the } ( \text{Ag}_2\text{CO}_3\text{(s)} ) \text{ at } ( 20\text{ }^\circ\text{C} ) \text{ given that the solubility product of silver carbonate is } ( 8 \times 10^{-12}\text{ mol}^3\text{ dm}^{-9} )\text{?}', '\text{In a saturated solution of silver carbonate, equilibrium can be established between dissolved ions and undissolved salt according to the following equation.}
( \text{Ag}_2 \text{CO}_3 \text{(s)} \rightarrow 2 \text{Ag}^+\text{(aq)} + \text{CO}_3^{2-}\text{(aq)} )
\text{What is the solubility of the } ( \text{Ag}_2 \text{CO}_3 \text{(s)} ) \text{ at } ( 20 \text{ }^\circ\text{C} ) \text{ given that the solubility product of silver carbonate is } ( 8 \times 10^{-12}\text{ mol}^3 \text{ dm}^{-9} )\text{?}', 'LaTeX("In a saturated solution of silver carbonate, equilibrium can be established between dissolved ions and undissolved salt according to the following equation.\n$($Ag$_2$CO$_3$(s)$\\rightarrow 2$Ag$^+$(aq)$+$CO$_3^{2-}$(aq)$)$\nWhat is the solubility of the $($Ag$_2$CO$_3$(s)$)$ at $( 20$ $^\\circ$C$)$ given that the solubility product of silver carbonate is $( 8 \\times 10^{-12}$ mol$^3$ dm$^{-9} )$?").parsingMode(.onlyEquations)', 'LaTeX("In a saturated solution of silver carbonate, equilibrium can be established between dissolved ions and undissolved salt according to the following equation.\n$($Ag$_2$CO$_3$(s)$\\rightarrow 2$Ag$^+$(aq)$+$CO$_3^{2-}$(aq)$)$\nWhat is the solubility of the $($Ag$_2$CO$_3$(s)$)$ at $( 20$ $^\\circ$C$)$ given that the solubility product of silver carbonate is $( 8 \\times 10^{-12}$ mol$^3$ dm$^{-9} )$?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '26',
        '\text{Which of the following graphs, A, B, C or D, correctly depicts the } ( \text{E}_a ) \text{ and the distribution of energy of molecules in a chemical reaction at } ( 30\text{ }^\circ\text{C} ) \text{ and } ( 60\text{ }^\circ\text{C} )\text{?}', '\text{Which of the following graphs, A, B, C or D, correctly depicts the } ( \text{E}_a ) \text{ and the distribution of energy of molecules in a chemical reaction at } ( 30 \text{ }^\circ\text{C} ) \text{ and } ( 60 \text{ }^\circ\text{C} )\text{?}', 'LaTeX("Which of the following graphs, A, B, C or D, correctly depicts the $($E$_a )$ and the distribution of energy of molecules in a chemical reaction at $( 30$ $^\\circ$C$)$ and $( 60$ $^\\circ$C$)$?").parsingMode(.onlyEquations)', 'LaTeX("Which of the following graphs, A, B, C or D, correctly depicts the $($E$_a )$ and the distribution of energy of molecules in a chemical reaction at $( 30$ $^\\circ$C$)$ and $( 60$ $^\\circ$C$)$?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '27',
        '\text{Marine animals such as oysters and other shellfish rely on the slow precipitation of calcium carbonate to form their shells. Which of the following properties help this process?}
I. \text{Greater ionic product of } ( \text{Ca}^{2+} ) \text{ and } ( \text{CO}_3^{2-} ) \text{ ions}
II. \text{Smaller solubility product of } ( \text{CaCO}_3\text{(s)} )
III. \text{Greater solubility product of } ( \text{CaCO}_3\text{(s)} )', '\text{Marine animals such as oysters and other shellfish rely on the slow precipitation of calcium carbonate to form their shells. Which of the following properties help this process?}
I. \text{Greater ionic product of } ( \text{Ca}^{2+} ) \text{ and } ( \text{CO}_3^{2-} ) \text{ ions}
II. \text{Smaller solubility product of } ( \text{CaCO}_3 \text{(s)} )
III. \text{Greater solubility product of } ( \text{CaCO}_3 \text{(s)} )', 'LaTeX("Marine animals such as oysters and other shellfish rely on the slow precipitation of calcium carbonate to form their shells. Which of the following properties help this process?\n$I.$Greater ionic product of $($Ca$^{2+} )$ and $($CO$_3^{2-} )$ ions\n$II.$Smaller solubility product of $($CaCO$_3$(s)$)$\n$III.$Greater solubility product of $($CaCO$_3$(s)$)$").parsingMode(.onlyEquations)', 'LaTeX("Marine animals such as oysters and other shellfish rely on the slow precipitation of calcium carbonate to form their shells. Which of the following properties help this process?\n$I.$Greater ionic product of $($Ca$^{2+} )$ and $($CO$_3^{2-} )$ ions\n$II.$Smaller solubility product of $($CaCO$_3$(s)$)$\n$III.$Greater solubility product of $($CaCO$_3$(s)$)$").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '28',
        '\text{What is the potential for a cell with the following reaction?}
( \text{Zn(s)} + \text{Br}_2\text{(aq)} \rightarrow \text{Zn}^{2+}\text{(aq)} + 2\text{Br}^-\text{(aq)} )', '\text{What is the potential for a cell with the following reaction?}
( \text{Zn(s)} + \text{Br}_2 \text{(aq)} \rightarrow \text{Zn}^{2+}\text{(aq)} + 2 \text{Br}^-\text{(aq)} )', 'LaTeX("What is the potential for a cell with the following reaction?\n$($Zn(s)$+$Br$_2$(aq)$\\rightarrow$Zn$^{2+}$(aq)$+ 2$Br$^-$(aq)$)$").parsingMode(.onlyEquations)', 'LaTeX("What is the potential for a cell with the following reaction?\n$($Zn(s)$+$Br$_2$(aq)$\\rightarrow$Zn$^{2+}$(aq)$+ 2$Br$^-$(aq)$)$").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '29',
        '\text{The value of } ( \text{K}_c ) \text{ for the equilibrium } ( \text{H}_2\text{(g)} + \text{I}_2\text{(g)} \rightleftharpoons 2\text{HI(g)} ) \text{ is 860 at } ( 25\text{ }^\circ\text{C} )\text{.}
\text{What is the value of } ( \text{K}_c ) \text{ at } ( 25\text{ }^\circ\text{C} ) \text{ for the following equilibrium?}
( \frac{1}{2}\text{H}_2\text{(g)} + \frac{1}{2}\text{I}_2\text{(g)} \rightleftharpoons \text{HI(g)} )', '\text{The value of } ( \text{K}_c ) \text{ for the equilibrium } ( \text{H}_2 \text{(g)} + \text{I}_2 \text{(g)} \rightleftharpoons 2 \text{HI(g)} ) \text{ is 860 at } ( 25 \text{ }^\circ\text{C} )\text{.}
\text{What is the value of } ( \text{K}_c ) \text{ at } ( 25 \text{ }^\circ\text{C} ) \text{ for the following equilibrium?}
( \frac{1}{2}\text{H}_2 \text{(g)} + \frac{1}{2}\text{I}_2 \text{(g)} \rightleftharpoons \text{HI(g)} )', 'LaTeX("The value of $($K$_c )$ for the equilibrium $($H$_2$(g)$+$I$_2$(g)$\\rightleftharpoons 2$HI(g)$)$ is 860 at $( 25$ $^\\circ$C$)$.\nWhat is the value of $($K$_c )$ at $( 25$ $^\\circ$C$)$ for the following equilibrium?\n$( \\frac{1}{2}$H$_2$(g)$+ \\frac{1}{2}$I$_2$(g)$\\rightleftharpoons$HI(g)$)$").parsingMode(.onlyEquations)', 'LaTeX("The value of $($K$_c )$ for the equilibrium $($H$_2$(g)$+$I$_2$(g)$\\rightleftharpoons 2$HI(g)$)$ is 860 at $( 25$ $^\\circ$C$)$.\nWhat is the value of $($K$_c )$ at $( 25$ $^\\circ$C$)$ for the following equilibrium?\n$( \\frac{1}{2}$H$_2$(g)$+ \\frac{1}{2}$I$_2$(g)$\\rightleftharpoons$HI(g)$)$").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '33',
        '\text{Item 33 refers to the reaction of the } ( \text{X}^{2+} ) \text{ ion only, with the reagents indicated.}
\text{Which of the following reagents does NOT aid in the identification of } ( \text{X}^{2+} )\text{?}', '\text{Item 33 refers to the reaction of the } ( \text{X}^{2+} ) \text{ ion only, with the reagents indicated.}
\text{Which of the following reagents does NOT aid in the identification of } ( \text{X}^{2+} )\text{?}', 'LaTeX("Item 33 refers to the reaction of the $($X$^{2+} )$ ion only, with the reagents indicated.\nWhich of the following reagents does NOT aid in the identification of $($X$^{2+} )$?").parsingMode(.onlyEquations)', 'LaTeX("Item 33 refers to the reaction of the $($X$^{2+} )$ ion only, with the reagents indicated.\nWhich of the following reagents does NOT aid in the identification of $($X$^{2+} )$?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '36',
        '\text{Which of the following compounds would produce the LOWEST pH when } ( 0.5\text{ mol} ) \text{ of it is bubbled into 1 litre of water?}', '\text{Which of the following compounds would produce the LOWEST pH when } ( 0.5 \text{ mol} ) \text{ of it is bubbled into 1 litre of water?}', 'LaTeX("Which of the following compounds would produce the LOWEST pH when $( 0.5$ mol$)$ of it is bubbled into 1 litre of water?").parsingMode(.onlyEquations)', 'LaTeX("Which of the following compounds would produce the LOWEST pH when $( 0.5$ mol$)$ of it is bubbled into 1 litre of water?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '2',
        '\text{Which pair of compounds can be used to make propyl methanoate?}', '\text{Which pair of compounds can be used to make propyl methanoate?}', 'LaTeX("Which pair of compounds can be used to make propyl methanoate?").parsingMode(.onlyEquations)', 'LaTeX("Which pair of compounds can be used to make propyl methanoate?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '3',
        '\text{Item 3 refers to the three amines, X, Y and Z, with the following formulae.}
\text{X: } ( \text{CH}_2\text{Cl CHCl NH}_2 )
\text{Y: } ( \text{CH}_3\text{ CH}_2\text{ NH}_2 )
\text{Z: } ( \text{C}_6\text{H}_5\text{CH}_2\text{ NH}_2 )
\text{Which of the following sets of pH values is LIKELY to be for the amines, X, Y and Z respectively?}', '\text{Item 3 refers to the three amines, X, Y and Z, with the following formulae.}
\text{X: } ( \text{CH}_2 \text{Cl CHCl NH}_2 )
\text{Y: } ( \text{CH}_3 \text{ CH}_2 \text{ NH}_2 )
\text{Z: } ( \text{C}_6 \text{H}_5 \text{CH}_2 \text{ NH}_2 )
\text{Which of the following sets of pH values is LIKELY to be for the amines, X, Y and Z respectively?}', 'LaTeX("Item 3 refers to the three amines, X, Y and Z, with the following formulae.\nX: $($CH$_2$Cl CHCl NH$_2 )$\nY: $($CH$_3$ CH$_2$ NH$_2 )$\nZ: $($C$_6$H$_5$CH$_2$ NH$_2 )$\nWhich of the following sets of pH values is LIKELY to be for the amines, X, Y and Z respectively?").parsingMode(.onlyEquations)', 'LaTeX("Item 3 refers to the three amines, X, Y and Z, with the following formulae.\nX: $($CH$_2$Cl CHCl NH$_2 )$\nY: $($CH$_3$ CH$_2$ NH$_2 )$\nZ: $($C$_6$H$_5$CH$_2$ NH$_2 )$\nWhich of the following sets of pH values is LIKELY to be for the amines, X, Y and Z respectively?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '6',
        '\text{An alcohol is treated with acidified } ( \text{K}_2\text{Cr}_2\text{O}_7 ) \text{ and the resulting mixture gives a positive tri-iodoform test. Which of the following structures BEST represents the alcohol used?}', '\text{An alcohol is treated with acidified } ( \text{K}_2 \text{Cr}_2 \text{O}_7 ) \text{ and the resulting mixture gives a positive tri-iodoform test. Which of the following structures BEST represents the alcohol used?}', 'LaTeX("An alcohol is treated with acidified $($K$_2$Cr$_2$O$_7 )$ and the resulting mixture gives a positive tri-iodoform test. Which of the following structures BEST represents the alcohol used?").parsingMode(.onlyEquations)', 'LaTeX("An alcohol is treated with acidified $($K$_2$Cr$_2$O$_7 )$ and the resulting mixture gives a positive tri-iodoform test. Which of the following structures BEST represents the alcohol used?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '7',
        '\text{Which of the following reaction mechanisms occurs between benzene and concentrated } ( \text{HNO}_3/\text{H}_2\text{SO}_4 ) \text{?}', '\text{Which of the following reaction mechanisms occurs between benzene and concentrated } ( \text{HNO}_3/\text{H}_2 \text{SO}_4 ) \text{?}', 'LaTeX("Which of the following reaction mechanisms occurs between benzene and concentrated $($HNO$_3/$H$_2$SO$_4 )$?").parsingMode(.onlyEquations)', 'LaTeX("Which of the following reaction mechanisms occurs between benzene and concentrated $($HNO$_3/$H$_2$SO$_4 )$?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '9',
        '\text{Item 9 refers to the compounds, P, Q, R and S, with the following structures.}
\text{S: } ( \text{C}_6\text{H}_5\text{OH} )
\text{P: } ( \text{CH}_3(\text{CH}_2)_4\text{CH}_2\text{OH} )
\text{Q: } ( \text{CH}_3(\text{CH}_2)_4\text{CH}_2\text{COOH} )
\text{R: } ( \text{CH}_3(\text{CH}_2)_3\text{CHClCOOH} )
\text{The correct sequence of the compounds, in order of DECREASING acid strength, is}', '\text{Item 9 refers to the compounds, P, Q, R and S, with the following structures.}
\text{S: } ( \text{C}_6 \text{H}_5 \text{OH} )
\text{P: } ( \text{CH}_3(\text{CH}_2)_4 \text{CH}_2 \text{OH} )
\text{Q: } ( \text{CH}_3(\text{CH}_2)_4 \text{CH}_2 \text{COOH} )
\text{R: } ( \text{CH}_3(\text{CH}_2)_3 \text{CHClCOOH} )
\text{The correct sequence of the compounds, in order of DECREASING acid strength, is}', 'LaTeX("Item 9 refers to the compounds, P, Q, R and S, with the following structures.\nS: $($C$_6$H$_5$OH$)$\nP: $($CH$_3($CH$_2)_4$CH$_2$OH$)$\nQ: $($CH$_3($CH$_2)_4$CH$_2$COOH$)$\nR: $($CH$_3($CH$_2)_3$CHClCOOH$)$\nThe correct sequence of the compounds, in order of DECREASING acid strength, is").parsingMode(.onlyEquations)', 'LaTeX("Item 9 refers to the compounds, P, Q, R and S, with the following structures.\nS: $($C$_6$H$_5$OH$)$\nP: $($CH$_3($CH$_2)_4$CH$_2$OH$)$\nQ: $($CH$_3($CH$_2)_4$CH$_2$COOH$)$\nR: $($CH$_3($CH$_2)_3$CHClCOOH$)$\nThe correct sequence of the compounds, in order of DECREASING acid strength, is").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '12',
        '\text{Nylon 66 can be made by the condensation polymerization of } ( \text{H}_2\text{N(CH}_2\text{)}_6\text{NH}_2 ) \text{ and } ( \text{HOOC(CH}_2\text{)}_4\text{COOH} ) \text{. The repeat unit is}', '\text{Nylon 66 can be made by the condensation polymerization of } ( \text{H}_2 \text{N(CH}_2 \text{)}_6 \text{NH}_2 ) \text{ and } ( \text{HOOC(CH}_2 \text{)}_4 \text{COOH} ) \text{. The repeat unit is}', 'LaTeX("Nylon 66 can be made by the condensation polymerization of $($H$_2$N(CH$_2$)$_6$NH$_2 )$ and $($HOOC(CH$_2$)$_4$COOH$)$. The repeat unit is").parsingMode(.onlyEquations)', 'LaTeX("Nylon 66 can be made by the condensation polymerization of $($H$_2$N(CH$_2$)$_6$NH$_2 )$ and $($HOOC(CH$_2$)$_4$COOH$)$. The repeat unit is").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '16',
        '\text{What transitions are expected from } ( \text{C}_6\text{H}_5\text{NO}_2 ) \text{ in a UV-Vis spectrum?}', '\text{What transitions are expected from } ( \text{C}_6 \text{H}_5 \text{NO}_2 ) \text{ in a UV-Vis spectrum?}', 'LaTeX("What transitions are expected from $($C$_6$H$_5$NO$_2 )$ in a UV-Vis spectrum?").parsingMode(.onlyEquations)', 'LaTeX("What transitions are expected from $($C$_6$H$_5$NO$_2 )$ in a UV-Vis spectrum?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '22',
        '\text{Which of the following species is NOT a significant fragment from the mass spectrum of ethanol?}', '\text{Which of the following species is NOT a significant fragment from the mass spectrum of ethanol?}', 'LaTeX("Which of the following species is NOT a significant fragment from the mass spectrum of ethanol?").parsingMode(.onlyEquations)', 'LaTeX("Which of the following species is NOT a significant fragment from the mass spectrum of ethanol?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '31',
        '\text{In one of the steps involved in the manufacture of sulfuric acid, sulfur dioxide and oxygen are mixed to form sulfur trioxide according to the following equation:}
( 2\text{SO}_2\text{(g)} + \text{O}_2\text{(g)} \rightarrow 2\text{SO}_3\text{(g)} )
\text{Which of the following options describes the effect of adding the catalyst } ( \text{V}_2\text{O}_5 ) \text{ to the mixture?}', '\text{In one of the steps involved in the manufacture of sulfuric acid, sulfur dioxide and oxygen are mixed to form sulfur trioxide according to the following equation:}
( 2 \text{SO}_2 \text{(g)} + \text{O}_2 \text{(g)} \rightarrow 2 \text{SO}_3 \text{(g)} )
\text{Which of the following options describes the effect of adding the catalyst } ( \text{V}_2 \text{O}_5 ) \text{ to the mixture?}', 'LaTeX("In one of the steps involved in the manufacture of sulfuric acid, sulfur dioxide and oxygen are mixed to form sulfur trioxide according to the following equation:\n$( 2$SO$_2$(g)$+$O$_2$(g)$\\rightarrow 2$SO$_3$(g)$)$\nWhich of the following options describes the effect of adding the catalyst $($V$_2$O$_5 )$ to the mixture?").parsingMode(.onlyEquations)', 'LaTeX("In one of the steps involved in the manufacture of sulfuric acid, sulfur dioxide and oxygen are mixed to form sulfur trioxide according to the following equation:\n$( 2$SO$_2$(g)$+$O$_2$(g)$\\rightarrow 2$SO$_3$(g)$)$\nWhich of the following options describes the effect of adding the catalyst $($V$_2$O$_5 )$ to the mixture?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '34',
        '\text{Cracking is a process used to break down large hydrocarbons into smaller molecules. Which of the following is a balanced equation for the cracking of dodecane into nonane and propene?}', '\text{Cracking is a process used to break down large hydrocarbons into smaller molecules. Which of the following is a balanced equation for the cracking of dodecane into nonane and propene?}', 'LaTeX("Cracking is a process used to break down large hydrocarbons into smaller molecules. Which of the following is a balanced equation for the cracking of dodecane into nonane and propene?").parsingMode(.onlyEquations)', 'LaTeX("Cracking is a process used to break down large hydrocarbons into smaller molecules. Which of the following is a balanced equation for the cracking of dodecane into nonane and propene?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '35',
        '\text{What is the product of the following (unbalanced) equation?}
( \text{Al}_2\text{O}_3\cdot\text{H}_2\text{O (s)} + \text{H}_2\text{O (l)} + \text{OH}^-\text{ (aq)} \rightarrow )', '\text{What is the product of the following (unbalanced) equation?}
( \text{Al}_2 \text{O}_3 \cdot\text{H}_2 \text{O (s)} + \text{H}_2 \text{O (l)} + \text{OH}^-\text{ (aq)} \rightarrow )', 'LaTeX("What is the product of the following (unbalanced) equation?\n$($Al$_2$O$_3\\cdot$H$_2$O (s)$+$H$_2$O (l)$+$OH$^-$ (aq)$\\rightarrow )$").parsingMode(.onlyEquations)', 'LaTeX("What is the product of the following (unbalanced) equation?\n$($Al$_2$O$_3 \\cdot$H$_2$O (s)$+$H$_2$O (l)$+$OH$^-$ (aq)$\\rightarrow )$").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '39',
        '\text{From the reaction given below, a high pressure would give the best yield, but in industry, a moderate pressure is used.}
( \text{N}_2\text{(g)} + 3\text{H}_2\text{(g)} \rightleftharpoons 2\text{NH}_3\text{(g)} )
\text{Why is a moderate pressure used in industry rather than high pressure?}', '\text{From the reaction given below, a high pressure would give the best yield, but in industry, a moderate pressure is used.}
( \text{N}_2 \text{(g)} + 3 \text{H}_2 \text{(g)} \rightleftharpoons 2 \text{NH}_3 \text{(g)} )
\text{Why is a moderate pressure used in industry rather than high pressure?}', 'LaTeX("From the reaction given below, a high pressure would give the best yield, but in industry, a moderate pressure is used.\n$($N$_2$(g)$+ 3$H$_2$(g)$\\rightleftharpoons 2$NH$_3$(g)$)$\nWhy is a moderate pressure used in industry rather than high pressure?").parsingMode(.onlyEquations)', 'LaTeX("From the reaction given below, a high pressure would give the best yield, but in industry, a moderate pressure is used.\n$($N$_2$(g)$+ 3$H$_2$(g)$\\rightleftharpoons 2$NH$_3$(g)$)$\nWhy is a moderate pressure used in industry rather than high pressure?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '40',
        '\text{A sample of crude oil contains mainly } ( \text{C}_8\text{H}_{18} ) \text{. In which crude oil fraction would you expect to find this sample?}', '\text{A sample of crude oil contains mainly } ( \text{C}_8 \text{H}_{18} ) \text{. In which crude oil fraction would you expect to find this sample?}', 'LaTeX("A sample of crude oil contains mainly $($C$_8$H$_{18} )$. In which crude oil fraction would you expect to find this sample?").parsingMode(.onlyEquations)', 'LaTeX("A sample of crude oil contains mainly $($C$_8$H$_{18} )$. In which crude oil fraction would you expect to find this sample?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '42',
        '\text{Chlorofluorocarbons undergo homolytic fission by being exposed to ultraviolet light in the stratosphere. Which radical could result from } ( \text{CH}_2\text{FCF}_2\text{Cl} ) \text{?}', '\text{Chlorofluorocarbons undergo homolytic fission by being exposed to ultraviolet light in the stratosphere. Which radical could result from } ( \text{CH}_2 \text{FCF}_2 \text{Cl} ) \text{?}', 'LaTeX("Chlorofluorocarbons undergo homolytic fission by being exposed to ultraviolet light in the stratosphere. Which radical could result from $($CH$_2$FCF$_2$Cl$)$?").parsingMode(.onlyEquations)', 'LaTeX("Chlorofluorocarbons undergo homolytic fission by being exposed to ultraviolet light in the stratosphere. Which radical could result from $($CH$_2$FCF$_2$Cl$)$?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '45',
        '\text{Dissolved } ( \text{O}_2\text{ (DO)} ) \text{ in water is very important for aquatic organisms. However, the dissolved } ( \text{O}_2 ) \text{ in a body of water fluctuates daily. Which of the following factors and its effects accounts for this fluctuation?}', '\text{Dissolved } ( \text{O}_2 \text{ (DO)} ) \text{ in water is very important for aquatic organisms. However, the dissolved } ( \text{O}_2 ) \text{ in a body of water fluctuates daily. Which of the following factors and its effects accounts for this fluctuation?}', 'LaTeX("Dissolved $($O$_2$ (DO)$)$ in water is very important for aquatic organisms. However, the dissolved $($O$_2 )$ in a body of water fluctuates daily. Which of the following factors and its effects accounts for this fluctuation?").parsingMode(.onlyEquations)', 'LaTeX("Dissolved $($O$_2$ (DO)$)$ in water is very important for aquatic organisms. However, the dissolved $($O$_2 )$ in a body of water fluctuates daily. Which of the following factors and its effects accounts for this fluctuation?").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2023, 'May', 1, '1',
        '\text{Which of the following compounds is hydrolysed by water?}', '\text{Which of the following compounds is hydrolysed by water?}', 'LaTeX("Which of the following compounds is hydrolysed by water?").parsingMode(.onlyEquations)', 'LaTeX("Which of the following compounds is hydrolysed by water?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2023, 'May', 1, '2',
        '\text{A hydrocarbon contains } ( 87.8\% ) \text{ carbon and } ( 12.2\% ) \text{ hydrogen by mass. Its empirical formula is}', '\text{A hydrocarbon contains } ( 87.8\% ) \text{ carbon and } ( 12.2\% ) \text{ hydrogen by mass. Its empirical formula is}', 'LaTeX("A hydrocarbon contains $( 87.8\\% )$ carbon and $( 12.2\\% )$ hydrogen by mass. Its empirical formula is").parsingMode(.onlyEquations)', 'LaTeX("A hydrocarbon contains $( 87.8\\% )$ carbon and $( 12.2\\% )$ hydrogen by mass. Its empirical formula is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2023, 'May', 1, '6',
        '\text{Phenol and benzoic acid can be distinguished by their reaction with}', '\text{Phenol and benzoic acid can be distinguished by their reaction with}', 'LaTeX("Phenol and benzoic acid can be distinguished by their reaction with").parsingMode(.onlyEquations)', 'LaTeX("Phenol and benzoic acid can be distinguished by their reaction with").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2023, 'May', 1, '8',
        '\text{Which of the following products will be formed when } ( \text{CH}_3\text{CH}=\text{CH}_2 ) \text{ is treated with hot acidified } ( \text{KMnO}_4\text{?} )', '\text{Which of the following products will be formed when } ( \text{CH}_3 \text{CH}=\text{CH}_2 ) \text{ is treated with hot acidified } ( \text{KMnO}_4 \text{?} )', 'LaTeX("Which of the following products will be formed when $($CH$_3$CH$=$CH$_2 )$ is treated with hot acidified $($KMnO$_4$?$)$").parsingMode(.onlyEquations)', 'LaTeX("Which of the following products will be formed when $($CH$_3$CH$=$CH$_2 )$ is treated with hot acidified $($KMnO$_4$?$)$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2023, 'May', 1, '9',
        '\text{Item 9 refers to the following species structure which shows the product of reaction between a halogenoalkane and NaOH (aq). Which of the following is likely to be the product of the first step in the reaction mechanism for the reaction above?}', '\text{Item 9 refers to the following species structure which shows the product of reaction between a halogenoalkane and NaOH (aq). Which of the following is likely to be the product of the first step in the reaction mechanism for the reaction above?}', 'LaTeX("Item 9 refers to the following species structure which shows the product of reaction between a halogenoalkane and NaOH (aq). Which of the following is likely to be the product of the first step in the reaction mechanism for the reaction above?").parsingMode(.onlyEquations)', 'LaTeX("Item 9 refers to the following species structure which shows the product of reaction between a halogenoalkane and NaOH (aq). Which of the following is likely to be the product of the first step in the reaction mechanism for the reaction above?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2023, 'May', 1, '10',
        '\text{Which of the following organic molecules has the LOWEST } ( \text{p}K_a ) \text{ value?}', '\text{Which of the following organic molecules has the LOWEST } ( \text{p}K_a ) \text{ value?}', 'LaTeX("Which of the following organic molecules has the LOWEST $($p$K_a )$ value?").parsingMode(.onlyEquations)', 'LaTeX("Which of the following organic molecules has the LOWEST $($p$K_a )$ value?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2023, 'May', 1, '11',
        '\text{The functional groups present on an amino acid are the amine group } ( \text{(R-NH}_2\text{)} ) \text{ and the carboxylic acid group } ( \text{(RCOOH).} ) \text{ This allows an amino acid to exist as}', '\text{The functional groups present on an amino acid are the amine group } ( \text{(R-NH}_2 \text{)} ) \text{ and the carboxylic acid group } ( \text{(RCOOH).} ) \text{ This allows an amino acid to exist as}', 'LaTeX("The functional groups present on an amino acid are the amine group $($(R-NH$_2$)$)$ and the carboxylic acid group $($(RCOOH).$)$ This allows an amino acid to exist as").parsingMode(.onlyEquations)', 'LaTeX("The functional groups present on an amino acid are the amine group $($(R-NH$_2$)$)$ and the carboxylic acid group $($(RCOOH).$)$ This allows an amino acid to exist as").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2023, 'May', 1, '12',
        '\text{Nylon 6,6 can be made by the condensation polymerization of } ( \text{H}_2\text{N(CH}_2\text{)}_6\text{NH}_2 ) \text{ and } ( \text{HOOC(CH}_2\text{)}_4\text{COOH.} ) \text{ The repeat unit is}', '\text{Nylon 6,6 can be made by the condensation polymerization of } ( \text{H}_2 \text{N(CH}_2 \text{)}_6 \text{NH}_2 ) \text{ and } ( \text{HOOC(CH}_2 \text{)}_4 \text{COOH.} ) \text{ The repeat unit is}', 'LaTeX("Nylon 6,6 can be made by the condensation polymerization of $($H$_2$N(CH$_2$)$_6$NH$_2 )$ and $($HOOC(CH$_2$)$_4$COOH.$)$ The repeat unit is").parsingMode(.onlyEquations)', 'LaTeX("Nylon 6,6 can be made by the condensation polymerization of $($H$_2$N(CH$_2$)$_6$NH$_2 )$ and $($HOOC(CH$_2$)$_4$COOH.$)$ The repeat unit is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2023, 'May', 1, '14',
        '\text{The halogenoalkane } ( \text{(CH}_3\text{)}_3\text{CX (X = halogen),} ) \text{ when treated with aqueous sodium hydroxide, undergoes a substitution reaction. Which of the following reaction sequences shows the mechanism for this reaction?}', '\text{The halogenoalkane } ( \text{(CH}_3 \text{)}_3 \text{CX (X = halogen),} ) \text{ when treated with aqueous sodium hydroxide, undergoes a substitution reaction. Which of the following reaction sequences shows the mechanism for this reaction?}', 'LaTeX("The halogenoalkane $($(CH$_3$)$_3$CX (X = halogen),$)$ when treated with aqueous sodium hydroxide, undergoes a substitution reaction. Which of the following reaction sequences shows the mechanism for this reaction?").parsingMode(.onlyEquations)', 'LaTeX("The halogenoalkane $($(CH$_3$)$_3$CX (X = halogen),$)$ when treated with aqueous sodium hydroxide, undergoes a substitution reaction. Which of the following reaction sequences shows the mechanism for this reaction?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2023, 'May', 1, '15',
        '\text{An alcohol is treated with acidified } ( \text{K}_2\text{Cr}_2\text{O}_7 ) \text{ and the resulting mixture gives a positive tri-iodoform test. Which of the following structures BEST represents the alcohol used?}', '\text{An alcohol is treated with acidified } ( \text{K}_2 \text{Cr}_2 \text{O}_7 ) \text{ and the resulting mixture gives a positive tri-iodoform test. Which of the following structures BEST represents the alcohol used?}', 'LaTeX("An alcohol is treated with acidified $($K$_2$Cr$_2$O$_7 )$ and the resulting mixture gives a positive tri-iodoform test. Which of the following structures BEST represents the alcohol used?").parsingMode(.onlyEquations)', 'LaTeX("An alcohol is treated with acidified $($K$_2$Cr$_2$O$_7 )$ and the resulting mixture gives a positive tri-iodoform test. Which of the following structures BEST represents the alcohol used?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2023, 'May', 1, '26',
        '\text{Sodium sulfite reacts with potassium manganate(VII) according to the following equation.}
( 2\text{MnO}_4^- + 6\text{H}^+ + 5\text{SO}_3^{2-} \to 2\text{Mn}^{2+} + 3\text{H}_2\text{O} + 5\text{SO}_4^{2-} )
\text{In a titration, } ( 25 \text{ cm}^3 ) \text{ of } ( 0.04 \text{ mol dm}^{-3} ) \text{ sodium sulfite solution required } ( 20 \text{ cm}^3 ) \text{ of acidified } ( \text{KMnO}_4 \text{ for complete oxidation. The concentration of } \text{KMnO}_4 \text{ is} )', '\text{Sodium sulfite reacts with potassium manganate(VII) according to the following equation.}
( 2 \text{MnO}_4^- + 6 \text{H}^+ + 5 \text{SO}_3^{2-} \to 2 \text{Mn}^{2+} + 3 \text{H}_2 \text{O} + 5 \text{SO}_4^{2-} )
\text{In a titration, } ( 25 \text{ cm}^3 ) \text{ of } ( 0.04 \text{ mol dm}^{-3} ) \text{ sodium sulfite solution required } ( 20 \text{ cm}^3 ) \text{ of acidified } ( \text{KMnO}_4 \text{ for complete oxidation. The concentration of } \text{KMnO}_4 \text{ is} )', 'LaTeX("Sodium sulfite reacts with potassium manganate(VII) according to the following equation.\n$( 2$MnO$_4^- + 6$H$^+ + 5$SO$_3^{2-} \\to 2$Mn$^{2+} + 3$H$_2$O$+ 5$SO$_4^{2-} )$\nIn a titration, $( 25$ cm$^3 )$ of $( 0.04$ mol dm$^{-3} )$ sodium sulfite solution required $( 20$ cm$^3 )$ of acidified $($KMnO$_4$ for complete oxidation. The concentration of KMnO$_4$ is$)$").parsingMode(.onlyEquations)', 'LaTeX("Sodium sulfite reacts with potassium manganate(VII) according to the following equation.\n$( 2$MnO$_4^- + 6$H$^+ + 5$SO$_3^{2-} \\to 2$Mn$^{2+} + 3$H$_2$O$+ 5$SO$_4^{2-} )$\nIn a titration, $( 25$ cm$^3 )$ of $( 0.04$ mol dm$^{-3} )$ sodium sulfite solution required $( 20$ cm$^3 )$ of acidified $($KMnO$_4$ for complete oxidation. The concentration of KMnO$_4$ is$)$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2023, 'May', 1, '33',
        '\text{The two equations below summarize the fermentation process for the production of alcohol.}
\text{I. } ( \text{X} + \text{H}_2\text{O} + \text{Invertase} \to 2\text{ C}_6\text{H}_{12}\text{O}_6 )
\text{II. } ( \text{C}_6\text{H}_{12}\text{O}_6 + \text{Zymase} \to 2\text{ C}_2\text{H}_5\text{OH} + \text{Y} )
\text{In the balanced equations, X and Y would be}', '\text{The two equations below summarize the fermentation process for the production of alcohol.}
\text{I. } ( \text{X} + \text{H}_2 \text{O} + \text{Invertase} \to 2 \text{ C}_6 \text{H}_{12}\text{O}_6 )
\text{II. } ( \text{C}_6 \text{H}_{12}\text{O}_6 + \text{Zymase} \to 2 \text{ C}_2 \text{H}_5 \text{OH} + \text{Y} )
\text{In the balanced equations, X and Y would be}', 'LaTeX("The two equations below summarize the fermentation process for the production of alcohol.\nI. $($X$+$H$_2$O$+$Invertase$\\to 2$ C$_6$H$_{12}$O$_6 )$\nII. $($C$_6$H$_{12}$O$_6 +$Zymase$\\to 2$ C$_2$H$_5$OH$+$Y$)$\nIn the balanced equations, X and Y would be").parsingMode(.onlyEquations)', 'LaTeX("The two equations below summarize the fermentation process for the production of alcohol.\nI. $($X$+$H$_2$O$+$Invertase$\\to 2$ C$_6$H$_{12}$O$_6 )$\nII. $($C$_6$H$_{12}$O$_6 +$Zymase$\\to 2$ C$_2$H$_5$OH$+$Y$)$\nIn the balanced equations, X and Y would be").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2023, 'May', 1, '35',
        '\text{What is the product of the following (unbalanced) equation?}
( \text{Al}_2\text{O}_3\text{.H}_2\text{O (s) + H}_2\text{O (l) + OH}^- \text{ (aq)} \to )', '\text{What is the product of the following (unbalanced) equation?}
( \text{Al}_2 \text{O}_3 \text{.H}_2 \text{O (s) + H}_2 \text{O (l) + OH}^- \text{ (aq)} \to )', 'LaTeX("What is the product of the following (unbalanced) equation?\n$($Al$_2$O$_3$.H$_2$O (s) + H$_2$O (l) + OH$^-$ (aq)$\\to )$").parsingMode(.onlyEquations)', 'LaTeX("What is the product of the following (unbalanced) equation?\n$($Al$_2$O$_3$.H$_2$O (s) + H$_2$O (l) + OH$^-$ (aq)$\\to )$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2023, 'May', 1, '42',
        '\text{CFCs with relatively high proportions of chlorine are potentially more damaging to the ozone layer. Which of the following reactions gives evidence of this? (RCl represents a CFC.)}', '\text{CFCs with relatively high proportions of chlorine are potentially more damaging to the ozone layer. Which of the following reactions gives evidence of this? (RCl represents a CFC.)}', 'LaTeX("CFCs with relatively high proportions of chlorine are potentially more damaging to the ozone layer. Which of the following reactions gives evidence of this? (RCl represents a CFC.)").parsingMode(.onlyEquations)', 'LaTeX("CFCs with relatively high proportions of chlorine are potentially more damaging to the ozone layer. Which of the following reactions gives evidence of this? (RCl represents a CFC.)").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2023 IS NULL OR q.year = 2023)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '2',
        '\text{A hydrocarbon contains } ( 87.8\% ) \text{ carbon and } ( 12.2\% ) \text{ hydrogen by mass. Its empirical formula is}', '\text{A hydrocarbon contains } ( 87.8\% ) \text{ carbon and } ( 12.2\% ) \text{ hydrogen by mass. Its empirical formula is}', 'LaTeX("A hydrocarbon contains $( 87.8\\% )$ carbon and $( 12.2\\% )$ hydrogen by mass. Its empirical formula is").parsingMode(.onlyEquations)', 'LaTeX("A hydrocarbon contains $( 87.8\\% )$ carbon and $( 12.2\\% )$ hydrogen by mass. Its empirical formula is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '5',
        '\text{Which of the following compounds is hydrolysed by water?}', '\text{Which of the following compounds is hydrolysed by water?}', 'LaTeX("Which of the following compounds is hydrolysed by water?").parsingMode(.onlyEquations)', 'LaTeX("Which of the following compounds is hydrolysed by water?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '6',
        '\text{Phenol and benzoic acid can be distinguished by their reaction with}', '\text{Phenol and benzoic acid can be distinguished by their reaction with}', 'LaTeX("Phenol and benzoic acid can be distinguished by their reaction with").parsingMode(.onlyEquations)', 'LaTeX("Phenol and benzoic acid can be distinguished by their reaction with").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '9',
        '\text{Item 9 refers to the following species structure which shows the product of reaction between a halogenoalkane and NaOH (aq). Which of the following is likely to be the product of the first step in the reaction mechanism for the reaction above?}', '\text{Item 9 refers to the following species structure which shows the product of reaction between a halogenoalkane and NaOH (aq). Which of the following is likely to be the product of the first step in the reaction mechanism for the reaction above?}', 'LaTeX("Item 9 refers to the following species structure which shows the product of reaction between a halogenoalkane and NaOH (aq). Which of the following is likely to be the product of the first step in the reaction mechanism for the reaction above?").parsingMode(.onlyEquations)', 'LaTeX("Item 9 refers to the following species structure which shows the product of reaction between a halogenoalkane and NaOH (aq). Which of the following is likely to be the product of the first step in the reaction mechanism for the reaction above?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '10',
        '\text{Which of the following organic molecules has the LOWEST } ( \text{p}K_a ) \text{ value?}', '\text{Which of the following organic molecules has the LOWEST } ( \text{p}K_a ) \text{ value?}', 'LaTeX("Which of the following organic molecules has the LOWEST $($p$K_a )$ value?").parsingMode(.onlyEquations)', 'LaTeX("Which of the following organic molecules has the LOWEST $($p$K_a )$ value?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '12',
        '\text{Nylon 6,6 can be made by the condensation polymerization of } ( \text{H}_2\text{N(CH}_2\text{)}_6\text{NH}_2 ) \text{ and } ( \text{HOOC(CH}_2\text{)}_4\text{COOH.} ) \text{ The repeat unit is}', '\text{Nylon 6,6 can be made by the condensation polymerization of } ( \text{H}_2 \text{N(CH}_2 \text{)}_6 \text{NH}_2 ) \text{ and } ( \text{HOOC(CH}_2 \text{)}_4 \text{COOH.} ) \text{ The repeat unit is}', 'LaTeX("Nylon 6,6 can be made by the condensation polymerization of $($H$_2$N(CH$_2$)$_6$NH$_2 )$ and $($HOOC(CH$_2$)$_4$COOH.$)$ The repeat unit is").parsingMode(.onlyEquations)', 'LaTeX("Nylon 6,6 can be made by the condensation polymerization of $($H$_2$N(CH$_2$)$_6$NH$_2 )$ and $($HOOC(CH$_2$)$_4$COOH.$)$ The repeat unit is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '14',
        '\text{The halogenoalkane } ( \text{(CH}_3\text{)}_3\text{CX (X = halogen),} ) \text{ when treated with aqueous sodium hydroxide, undergoes a substitution reaction. Which of the following reaction sequences shows the mechanism for this reaction?}', '\text{The halogenoalkane } ( \text{(CH}_3 \text{)}_3 \text{CX (X = halogen),} ) \text{ when treated with aqueous sodium hydroxide, undergoes a substitution reaction. Which of the following reaction sequences shows the mechanism for this reaction?}', 'LaTeX("The halogenoalkane $($(CH$_3$)$_3$CX (X = halogen),$)$ when treated with aqueous sodium hydroxide, undergoes a substitution reaction. Which of the following reaction sequences shows the mechanism for this reaction?").parsingMode(.onlyEquations)', 'LaTeX("The halogenoalkane $($(CH$_3$)$_3$CX (X = halogen),$)$ when treated with aqueous sodium hydroxide, undergoes a substitution reaction. Which of the following reaction sequences shows the mechanism for this reaction?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '18',
        '\text{Item 18 refers to the following information. The balanced equation for the reaction between lead ions and hydrochloric acid is}', '\text{Item 18 refers to the following information. The balanced equation for the reaction between lead ions and hydrochloric acid is}', 'LaTeX("Item 18 refers to the following information. The balanced equation for the reaction between lead ions and hydrochloric acid is").parsingMode(.onlyEquations)', 'LaTeX("Item 18 refers to the following information. The balanced equation for the reaction between lead ions and hydrochloric acid is").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '26',
        '\text{Sodium sulfite reacts with potassium manganate(VII) according to the following equation.}
( 2\text{MnO}_4^- + 6\text{H}^+ + 5\text{SO}_3^{2-} \to 2\text{Mn}^{2+} + 3\text{H}_2\text{O} + 5\text{SO}_4^{2-} )
\text{In a titration, } ( 25 \text{ cm}^3 ) \text{ of } ( 0.04 \text{ mol dm}^{-3} ) \text{ sodium sulfite solution required } ( 20 \text{ cm}^3 ) \text{ of acidified } ( \text{KMnO}_4 \text{ for complete oxidation. The concentration of } \text{KMnO}_4 \text{ is} )', '\text{Sodium sulfite reacts with potassium manganate(VII) according to the following equation.}
( 2 \text{MnO}_4^- + 6 \text{H}^+ + 5 \text{SO}_3^{2-} \to 2 \text{Mn}^{2+} + 3 \text{H}_2 \text{O} + 5 \text{SO}_4^{2-} )
\text{In a titration, } ( 25 \text{ cm}^3 ) \text{ of } ( 0.04 \text{ mol dm}^{-3} ) \text{ sodium sulfite solution required } ( 20 \text{ cm}^3 ) \text{ of acidified } ( \text{KMnO}_4 \text{ for complete oxidation. The concentration of } \text{KMnO}_4 \text{ is} )', 'LaTeX("Sodium sulfite reacts with potassium manganate(VII) according to the following equation.\n$( 2$MnO$_4^- + 6$H$^+ + 5$SO$_3^{2-} \\to 2$Mn$^{2+} + 3$H$_2$O$+ 5$SO$_4^{2-} )$\nIn a titration, $( 25$ cm$^3 )$ of $( 0.04$ mol dm$^{-3} )$ sodium sulfite solution required $( 20$ cm$^3 )$ of acidified $($KMnO$_4$ for complete oxidation. The concentration of KMnO$_4$ is$)$").parsingMode(.onlyEquations)', 'LaTeX("Sodium sulfite reacts with potassium manganate(VII) according to the following equation.\n$( 2$MnO$_4^- + 6$H$^+ + 5$SO$_3^{2-} \\to 2$Mn$^{2+} + 3$H$_2$O$+ 5$SO$_4^{2-} )$\nIn a titration, $( 25$ cm$^3 )$ of $( 0.04$ mol dm$^{-3} )$ sodium sulfite solution required $( 20$ cm$^3 )$ of acidified $($KMnO$_4$ for complete oxidation. The concentration of KMnO$_4$ is$)$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '29',
        '\text{Item 29 refers to the mass spectrum of ethanol shown below. What is the formula of the base peak in the spectrum?}', '\text{Item 29 refers to the mass spectrum of ethanol shown below. What is the formula of the base peak in the spectrum?}', 'LaTeX("Item 29 refers to the mass spectrum of ethanol shown below. What is the formula of the base peak in the spectrum?").parsingMode(.onlyEquations)', 'LaTeX("Item 29 refers to the mass spectrum of ethanol shown below. What is the formula of the base peak in the spectrum?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '33',
        '\text{The two equations below summarize the fermentation process for the production of alcohol.}
\text{I. } ( \text{X} + \text{H}_2\text{O} + \text{Invertase} \to 2\text{ C}_6\text{H}_{12}\text{O}_6 )
\text{II. } ( \text{C}_6\text{H}_{12}\text{O}_6 + \text{Zymase} \to 2\text{ C}_2\text{H}_5\text{OH} + \text{Y} )
\text{In the balanced equations, X and Y would be}', '\text{The two equations below summarize the fermentation process for the production of alcohol.}
\text{I. } ( \text{X} + \text{H}_2 \text{O} + \text{Invertase} \to 2 \text{ C}_6 \text{H}_{12}\text{O}_6 )
\text{II. } ( \text{C}_6 \text{H}_{12}\text{O}_6 + \text{Zymase} \to 2 \text{ C}_2 \text{H}_5 \text{OH} + \text{Y} )
\text{In the balanced equations, X and Y would be}', 'LaTeX("The two equations below summarize the fermentation process for the production of alcohol.\nI. $($X$+$H$_2$O$+$Invertase$\\to 2$ C$_6$H$_{12}$O$_6 )$\nII. $($C$_6$H$_{12}$O$_6 +$Zymase$\\to 2$ C$_2$H$_5$OH$+$Y$)$\nIn the balanced equations, X and Y would be").parsingMode(.onlyEquations)', 'LaTeX("The two equations below summarize the fermentation process for the production of alcohol.\nI. $($X$+$H$_2$O$+$Invertase$\\to 2$ C$_6$H$_{12}$O$_6 )$\nII. $($C$_6$H$_{12}$O$_6 +$Zymase$\\to 2$ C$_2$H$_5$OH$+$Y$)$\nIn the balanced equations, X and Y would be").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '34',
        '\text{Chlorofluorocarbons undergo homolytic fission by being exposed to ultraviolet light in the stratosphere. Which radical could result from } ( \text{CH}_2\text{FCF}_2\text{Cl?} )', '\text{Chlorofluorocarbons undergo homolytic fission by being exposed to ultraviolet light in the stratosphere. Which radical could result from } ( \text{CH}_2 \text{FCF}_2 \text{Cl?} )', 'LaTeX("Chlorofluorocarbons undergo homolytic fission by being exposed to ultraviolet light in the stratosphere. Which radical could result from $($CH$_2$FCF$_2$Cl?$)$").parsingMode(.onlyEquations)', 'LaTeX("Chlorofluorocarbons undergo homolytic fission by being exposed to ultraviolet light in the stratosphere. Which radical could result from $($CH$_2$FCF$_2$Cl?$)$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2025, 'May', 1, '43',
        '\text{In the production of sulfuric acid by the Contact process, the following exothermic reaction takes place:}
( 2\text{SO}_2\text{(g) + O}_2\text{(g)} \xrightleftharpoons[\text{420 }^\circ\text{C, 2 atm}]{\text{V}_2\text{O}_5} 2\text{SO}_3\text{(g)} )
\text{Which of the following condition(s) would favour the forward reaction?}
\text{I. Low pressure}
\text{II. Excess oxygen}
\text{III. Low temperature}', '\text{In the production of sulfuric acid by the Contact process, the following exothermic reaction takes place:}
( 2 \text{SO}_2 \text{(g) + O}_2 \text{(g)} \xrightleftharpoons[\text{420 }^\circ\text{C, 2 atm}]{\text{V}_2 \text{O}_5} 2 \text{SO}_3 \text{(g)} )
\text{Which of the following condition(s) would favour the forward reaction?}
\text{I. Low pressure}
\text{II. Excess oxygen}
\text{III. Low temperature}', 'LaTeX("In the production of sulfuric acid by the Contact process, the following exothermic reaction takes place:\n$( 2$SO$_2$(g) + O$_2$(g)$\\xrightleftharpoons[$420 $^\\circ$C, 2 atm$]{$V$_2$O$_5} 2$SO$_3$(g)$)$\nWhich of the following condition(s) would favour the forward reaction?\nI. Low pressure\nII. Excess oxygen\nIII. Low temperature").parsingMode(.onlyEquations)', 'LaTeX("In the production of sulfuric acid by the Contact process, the following exothermic reaction takes place:\n$( 2$SO$_2$(g) + O$_2$(g)$\\xrightleftharpoons[$420 $^\\circ$C, 2 atm$]{$V$_2$O$_5} 2$SO$_3$(g)$)$\nWhich of the following condition(s) would favour the forward reaction?\nI. Low pressure\nII. Excess oxygen\nIII. Low temperature").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 1 AND q.number = 1
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2021, 'May', 1, '36',
        '\text{Which row in the following table matches each structure with its correct number of chromosomes?}', '\text{Which row in the following table matches each structure with its correct number of chromosomes?}', 'LaTeX("Which row in the following table matches each structure with its correct number of chromosomes?").parsingMode(.onlyEquations)', 'LaTeX("Which row in the following table matches each structure with its correct number of chromosomes?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Biology%') AND q.paper = 1 AND q.number = 1
      AND (2021 IS NULL OR q.year = 2021)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2022, 'May', 1, '1',
        '\text{Which of the following characteristics of water are of biological significance?}
I. \text{Excellent solvent properties}
II. \text{Relatively high heat capacity}
III. \text{Density decreases below } ( 4\text{ }^\circ\text{C} )', '\text{Which of the following characteristics of water are of biological significance?}
I. \text{Excellent solvent properties}
II. \text{Relatively high heat capacity}
III. \text{Density decreases below } ( 4 \text{ }^\circ\text{C} )', 'LaTeX("Which of the following characteristics of water are of biological significance?\n$I.$Excellent solvent properties\n$II.$Relatively high heat capacity\n$III.$Density decreases below $( 4$ $^\\circ$C$)$").parsingMode(.onlyEquations)', 'LaTeX("Which of the following characteristics of water are of biological significance?\n$I.$Excellent solvent properties\n$II.$Relatively high heat capacity\n$III.$Density decreases below $( 4$ $^\\circ$C$)$").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Biology%') AND q.paper = 1 AND q.number = 1
      AND (2022 IS NULL OR q.year = 2022)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 1, 2022, 'May', 1, '3',
        '\text{Four identical samples of plant tissue are placed in four different solutions. Each sample of plant tissue has a water potential of } ( 800\text{ kPa} ). \text{ In which solution would full plasmolysis occur within the tissue?}', '\text{Four identical samples of plant tissue are placed in four different solutions. Each sample of plant tissue has a water potential of } ( 800 \text{ kPa} ). \text{ In which solution would full plasmolysis occur within the tissue?}', 'LaTeX("Four identical samples of plant tissue are placed in four different solutions. Each sample of plant tissue has a water potential of $( 800$ kPa$).$ In which solution would full plasmolysis occur within the tissue?").parsingMode(.onlyEquations)', 'LaTeX("Four identical samples of plant tissue are placed in four different solutions. Each sample of plant tissue has a water potential of $( 800$ kPa$).$ In which solution would full plasmolysis occur within the tissue?").parsingMode(.onlyEquations)',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Biology%') AND q.paper = 1 AND q.number = 1
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
        q.id, s.name, 1, 2025, 'May', 1, '17',
        '\text{The angle between the vectors } \mathbf{a} = 2\mathbf{i} - \mathbf{j} + 2\mathbf{k} \text{ and } \mathbf{b} = \mathbf{i} + 4\mathbf{j} + \mathbf{k} \text{ is}', '\text{The angle between the vectors } \mathbf{a} = 2 \mathbf{i} - \mathbf{j} + 2 \mathbf{k} \text{ and } \mathbf{b} = \mathbf{i} + 4 \mathbf{j} + \mathbf{k} \text{ is}', 'LaTeX("The angle between the vectors $\\mathbf{a} = 2\\mathbf{i} - \\mathbf{j} + 2\\mathbf{k}$ and $\\mathbf{b} = \\mathbf{i} + 4\\mathbf{j} + \\mathbf{k}$ is").parsingMode(.onlyEquations)', 'LaTeX("The angle between the vectors $\\mathbf{a} = 2 \\mathbf{i} - \\mathbf{j} + 2 \\mathbf{k}$ and $\\mathbf{b} = \\mathbf{i} + 4 \\mathbf{j} + \\mathbf{k}$ is").parsingMode(.onlyEquations)',
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
        '\text{The vector } \mathbf{u} \text{ has magnitude } 4\sqrt{5} \text{ units and is parallel to the vector } \mathbf{v} = \mathbf{i} - 2\mathbf{j} \text{. A unit vector parallel to } \mathbf{u} \text{ is}', '\text{The vector } \mathbf{u} \text{ has magnitude } 4 \sqrt{5} \text{ units and is parallel to the vector } \mathbf{v} = \mathbf{i} - 2 \mathbf{j} \text{. A unit vector parallel to } \mathbf{u} \text{ is}', 'LaTeX("The vector $\\mathbf{u}$ has magnitude $4\\sqrt{5}$ units and is parallel to the vector $\\mathbf{v} = \\mathbf{i} - 2\\mathbf{j}$. A unit vector parallel to $\\mathbf{u}$ is").parsingMode(.onlyEquations)', 'LaTeX("The vector $\\mathbf{u}$ has magnitude $4 \\sqrt{5}$ units and is parallel to the vector $\\mathbf{v} = \\mathbf{i} - 2 \\mathbf{j}$. A unit vector parallel to $\\mathbf{u}$ is").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2025, 'May', 1, '28',
        '\text{The angle between the vectors } \mathbf{u} = 4\mathbf{i} - 5\mathbf{j} + \mathbf{k} \text{ and } \mathbf{v} = 3\mathbf{i} + 6\mathbf{j} - \mathbf{k} \text{ is}', '\text{The angle between the vectors } \mathbf{u} = 4 \mathbf{i} - 5 \mathbf{j} + \mathbf{k} \text{ and } \mathbf{v} = 3 \mathbf{i} + 6 \mathbf{j} - \mathbf{k} \text{ is}', 'LaTeX("The angle between the vectors $\\mathbf{u} = 4\\mathbf{i} - 5\\mathbf{j} + \\mathbf{k}$ and $\\mathbf{v} = 3\\mathbf{i} + 6\\mathbf{j} - \\mathbf{k}$ is").parsingMode(.onlyEquations)', 'LaTeX("The angle between the vectors $\\mathbf{u} = 4 \\mathbf{i} - 5 \\mathbf{j} + \\mathbf{k}$ and $\\mathbf{v} = 3 \\mathbf{i} + 6 \\mathbf{j} - \\mathbf{k}$ is").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2025, 'May', 1, '29',
        '\text{A vector equation for the line through the points A (3, 4, -7) and B (1, -1, 6) is } \mathbf{r} =', '\text{A vector equation for the line through the points A (3, 4, -7) and B (1, -1, 6) is } \mathbf{r} =', 'LaTeX("A vector equation for the line through the points A (3, 4, -7) and B (1, -1, 6) is $\\mathbf{r} =$").parsingMode(.onlyEquations)', 'LaTeX("A vector equation for the line through the points A (3, 4, -7) and B (1, -1, 6) is $\\mathbf{r} =$").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2024, 'May', 1, '18',
        '\text{Given that } \mathbf{a} = \mathbf{i} - \mathbf{j}, \mathbf{b} = -\mathbf{i} + 2\mathbf{j} + 3\mathbf{k}, \vec{OP} = \mathbf{a} + 2\mathbf{b} \text{ and } \vec{OQ} = 2\mathbf{a} - \mathbf{b} \text{, then } \vec{OP} \cdot \vec{OQ} \text{ is equal to}', '\text{Given that } \mathbf{a} = \mathbf{i} - \mathbf{j}, \mathbf{b} = -\mathbf{i} + 2 \mathbf{j} + 3 \mathbf{k}, \vec{OP} = \mathbf{a} + 2 \mathbf{b} \text{ and } \vec{OQ} = 2 \mathbf{a} - \mathbf{b} \text{, then } \vec{OP} \cdot \vec{OQ} \text{ is equal to}', 'LaTeX("Given that $\\mathbf{a} = \\mathbf{i} - \\mathbf{j}, \\mathbf{b} = -\\mathbf{i} + 2\\mathbf{j} + 3\\mathbf{k}, \\vec{OP} = \\mathbf{a} + 2\\mathbf{b}$ and $\\vec{OQ} = 2\\mathbf{a} - \\mathbf{b}$, then $\\vec{OP} \\cdot \\vec{OQ}$ is equal to").parsingMode(.onlyEquations)', 'LaTeX("Given that $\\mathbf{a} = \\mathbf{i} - \\mathbf{j}, \\mathbf{b} = -\\mathbf{i} + 2 \\mathbf{j} + 3 \\mathbf{k}, \\vec{OP} = \\mathbf{a} + 2 \\mathbf{b}$ and $\\vec{OQ} = 2 \\mathbf{a} - \\mathbf{b}$, then $\\vec{OP} \\cdot \\vec{OQ}$ is equal to").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2024, 'May', 1, '28',
        '\text{Given that } |\vec{OP}| = 24 \text{ units, } \vec{OP} =', '\text{Given that } |\vec{OP}| = 24 \text{ units, } \vec{OP} =', 'LaTeX("Given that $|\\vec{OP}| = 24$ units, $\\vec{OP} =$").parsingMode(.onlyEquations)', 'LaTeX("Given that $|\\vec{OP}| = 24$ units, $\\vec{OP} =$").parsingMode(.onlyEquations)',
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
        '\text{The vector } \mathbf{a} \text{ is given as } 5\mathbf{i} + 12\mathbf{j} \text{. A unit vector parallel to } \mathbf{a} \text{ is}', '\text{The vector } \mathbf{a} \text{ is given as } 5 \mathbf{i} + 12 \mathbf{j} \text{. A unit vector parallel to } \mathbf{a} \text{ is}', 'LaTeX("The vector $\\mathbf{a}$ is given as $5\\mathbf{i} + 12\\mathbf{j}$. A unit vector parallel to $\\mathbf{a}$ is").parsingMode(.onlyEquations)', 'LaTeX("The vector $\\mathbf{a}$ is given as $5 \\mathbf{i} + 12 \\mathbf{j}$. A unit vector parallel to $\\mathbf{a}$ is").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2023, 'May', 1, '17',
        '\text{The angle between the vectors } \mathbf{a} = 2\mathbf{i} - \mathbf{j} + 2\mathbf{k} \text{ and } \mathbf{b} = \mathbf{i} + 4\mathbf{j} + \mathbf{k} \text{ is}', '\text{The angle between the vectors } \mathbf{a} = 2 \mathbf{i} - \mathbf{j} + 2 \mathbf{k} \text{ and } \mathbf{b} = \mathbf{i} + 4 \mathbf{j} + \mathbf{k} \text{ is}', 'LaTeX("The angle between the vectors $\\mathbf{a} = 2\\mathbf{i} - \\mathbf{j} + 2\\mathbf{k}$ and $\\mathbf{b} = \\mathbf{i} + 4\\mathbf{j} + \\mathbf{k}$ is").parsingMode(.onlyEquations)', 'LaTeX("The angle between the vectors $\\mathbf{a} = 2 \\mathbf{i} - \\mathbf{j} + 2 \\mathbf{k}$ and $\\mathbf{b} = \\mathbf{i} + 4 \\mathbf{j} + \\mathbf{k}$ is").parsingMode(.onlyEquations)',
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
        '\text{The vector } \mathbf{u} \text{ has magnitude } 4\sqrt{5} \text{ units and is parallel to the vector } \mathbf{v} = \mathbf{i} - 2\mathbf{j} \text{. A unit vector parallel to } \mathbf{u} \text{ is}', '\text{The vector } \mathbf{u} \text{ has magnitude } 4 \sqrt{5} \text{ units and is parallel to the vector } \mathbf{v} = \mathbf{i} - 2 \mathbf{j} \text{. A unit vector parallel to } \mathbf{u} \text{ is}', 'LaTeX("The vector $\\mathbf{u}$ has magnitude $4\\sqrt{5}$ units and is parallel to the vector $\\mathbf{v} = \\mathbf{i} - 2\\mathbf{j}$. A unit vector parallel to $\\mathbf{u}$ is").parsingMode(.onlyEquations)', 'LaTeX("The vector $\\mathbf{u}$ has magnitude $4 \\sqrt{5}$ units and is parallel to the vector $\\mathbf{v} = \\mathbf{i} - 2 \\mathbf{j}$. A unit vector parallel to $\\mathbf{u}$ is").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2023, 'May', 1, '29',
        '\text{A vector equation for the line through the points } A(3, 4, -7) \text{ and } B(1, -1, 6) \text{ is } \mathbf{r} =', '\text{A vector equation for the line through the points } A(3, 4, -7) \text{ and } B(1, -1, 6) \text{ is } \mathbf{r} =', 'LaTeX("A vector equation for the line through the points $A(3, 4, -7)$ and $B(1, -1, 6)$ is $\\mathbf{r} =$").parsingMode(.onlyEquations)', 'LaTeX("A vector equation for the line through the points $A(3, 4, -7)$ and $B(1, -1, 6)$ is $\\mathbf{r} =$").parsingMode(.onlyEquations)',
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
        '\text{The vector } \mathbf{u} \text{ has magnitude } 4\sqrt{5} \text{ units and is parallel to the vector } \mathbf{v} = \mathbf{i} - 2\mathbf{j} \text{. A unit vector parallel to } \mathbf{u} \text{ is}', '\text{The vector } \mathbf{u} \text{ has magnitude } 4 \sqrt{5} \text{ units and is parallel to the vector } \mathbf{v} = \mathbf{i} - 2 \mathbf{j} \text{. A unit vector parallel to } \mathbf{u} \text{ is}', 'LaTeX("The vector $\\mathbf{u}$ has magnitude $4\\sqrt{5}$ units and is parallel to the vector $\\mathbf{v} = \\mathbf{i} - 2\\mathbf{j}$. A unit vector parallel to $\\mathbf{u}$ is").parsingMode(.onlyEquations)', 'LaTeX("The vector $\\mathbf{u}$ has magnitude $4 \\sqrt{5}$ units and is parallel to the vector $\\mathbf{v} = \\mathbf{i} - 2 \\mathbf{j}$. A unit vector parallel to $\\mathbf{u}$ is").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '27',
        '\text{A vector equation of the line which passes through the points } A(2, 0, -6) \text{ and is parallel to } \mathbf{v} = 4\mathbf{i} - 5\mathbf{j} + 7\mathbf{k} \text{ is } \mathbf{r} =', '\text{A vector equation of the line which passes through the points } A(2, 0, -6) \text{ and is parallel to } \mathbf{v} = 4 \mathbf{i} - 5 \mathbf{j} + 7 \mathbf{k} \text{ is } \mathbf{r} =', 'LaTeX("A vector equation of the line which passes through the points $A(2, 0, -6)$ and is parallel to $\\mathbf{v} = 4\\mathbf{i} - 5\\mathbf{j} + 7\\mathbf{k}$ is $\\mathbf{r} =$").parsingMode(.onlyEquations)', 'LaTeX("A vector equation of the line which passes through the points $A(2, 0, -6)$ and is parallel to $\\mathbf{v} = 4 \\mathbf{i} - 5 \\mathbf{j} + 7 \\mathbf{k}$ is $\\mathbf{r} =$").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '29',
        '\text{The vector } \mathbf{a} \text{ is given as } 5\mathbf{i} + 12\mathbf{j} \text{. A unit vector parallel to } \mathbf{a} \text{ is}', '\text{The vector } \mathbf{a} \text{ is given as } 5 \mathbf{i} + 12 \mathbf{j} \text{. A unit vector parallel to } \mathbf{a} \text{ is}', 'LaTeX("The vector $\\mathbf{a}$ is given as $5\\mathbf{i} + 12\\mathbf{j}$. A unit vector parallel to $\\mathbf{a}$ is").parsingMode(.onlyEquations)', 'LaTeX("The vector $\\mathbf{a}$ is given as $5 \\mathbf{i} + 12 \\mathbf{j}$. A unit vector parallel to $\\mathbf{a}$ is").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2022, 'May', 1, '30',
        '\text{The angle between the vectors } \mathbf{u} = 4\mathbf{i} - 5\mathbf{j} + \mathbf{k} \text{ and } \mathbf{v} = 3\mathbf{i} + 6\mathbf{j} - \mathbf{k} \text{ is}', '\text{The angle between the vectors } \mathbf{u} = 4 \mathbf{i} - 5 \mathbf{j} + \mathbf{k} \text{ and } \mathbf{v} = 3 \mathbf{i} + 6 \mathbf{j} - \mathbf{k} \text{ is}', 'LaTeX("The angle between the vectors $\\mathbf{u} = 4\\mathbf{i} - 5\\mathbf{j} + \\mathbf{k}$ and $\\mathbf{v} = 3\\mathbf{i} + 6\\mathbf{j} - \\mathbf{k}$ is").parsingMode(.onlyEquations)', 'LaTeX("The angle between the vectors $\\mathbf{u} = 4 \\mathbf{i} - 5 \\mathbf{j} + \\mathbf{k}$ and $\\mathbf{v} = 3 \\mathbf{i} + 6 \\mathbf{j} - \\mathbf{k}$ is").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '17',
        '\text{The angle between the vectors } a = 2\mathbf{i} - \mathbf{j} + 2\mathbf{k} \text{ and } b = \mathbf{i} + 4\mathbf{j} + \mathbf{k} \text{ is}', '\text{The angle between the vectors } a = 2 \mathbf{i} - \mathbf{j} + 2 \mathbf{k} \text{ and } b = \mathbf{i} + 4 \mathbf{j} + \mathbf{k} \text{ is}', 'LaTeX("The angle between the vectors $a = 2\\mathbf{i} - \\mathbf{j} + 2\\mathbf{k}$ and $b = \\mathbf{i} + 4\\mathbf{j} + \\mathbf{k}$ is").parsingMode(.onlyEquations)', 'LaTeX("The angle between the vectors $a = 2 \\mathbf{i} - \\mathbf{j} + 2 \\mathbf{k}$ and $b = \\mathbf{i} + 4 \\mathbf{j} + \\mathbf{k}$ is").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '18',
        '\text{Given that } \mathbf{a} = \mathbf{i} - \mathbf{j}, \mathbf{b} = -\mathbf{i} + 2\mathbf{j} + 3\mathbf{k} \text{ and } \vec{OP} = \mathbf{a} + 2\mathbf{b}, \vec{OQ} = 2\mathbf{a} - \mathbf{b} \text{, then } \vec{OP} \cdot \vec{OQ} \text{ is equal to}', '\text{Given that } \mathbf{a} = \mathbf{i} - \mathbf{j}, \mathbf{b} = -\mathbf{i} + 2 \mathbf{j} + 3 \mathbf{k} \text{ and } \vec{OP} = \mathbf{a} + 2 \mathbf{b}, \vec{OQ} = 2 \mathbf{a} - \mathbf{b} \text{, then } \vec{OP} \cdot \vec{OQ} \text{ is equal to}', 'LaTeX("Given that $\\mathbf{a} = \\mathbf{i} - \\mathbf{j}, \\mathbf{b} = -\\mathbf{i} + 2\\mathbf{j} + 3\\mathbf{k}$ and $\\vec{OP} = \\mathbf{a} + 2\\mathbf{b}, \\vec{OQ} = 2\\mathbf{a} - \\mathbf{b}$, then $\\vec{OP} \\cdot \\vec{OQ}$ is equal to").parsingMode(.onlyEquations)', 'LaTeX("Given that $\\mathbf{a} = \\mathbf{i} - \\mathbf{j}, \\mathbf{b} = -\\mathbf{i} + 2 \\mathbf{j} + 3 \\mathbf{k}$ and $\\vec{OP} = \\mathbf{a} + 2 \\mathbf{b}, \\vec{OQ} = 2 \\mathbf{a} - \\mathbf{b}$, then $\\vec{OP} \\cdot \\vec{OQ}$ is equal to").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '26',
        '\text{Given that } |\vec{OP}| = 24 \text{ units, } \vec{OP} =', '\text{Given that } |\vec{OP}| = 24 \text{ units, } \vec{OP} =', 'LaTeX("Given that $|\\vec{OP}| = 24$ units, $\\vec{OP} =$").parsingMode(.onlyEquations)', 'LaTeX("Given that $|\\vec{OP}| = 24$ units, $\\vec{OP} =$").parsingMode(.onlyEquations)',
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
        q.id, s.name, 1, 2021, 'May', 1, '29',
        '\text{A vector equation for the line through the points } A(3, 4, -7) \text{ and } B(1, -1, 6) \text{ is } \mathbf{r} =', '\text{A vector equation for the line through the points } A(3, 4, -7) \text{ and } B(1, -1, 6) \text{ is } \mathbf{r} =', 'LaTeX("A vector equation for the line through the points $A(3, 4, -7)$ and $B(1, -1, 6)$ is $\\mathbf{r} =$").parsingMode(.onlyEquations)', 'LaTeX("A vector equation for the line through the points $A(3, 4, -7)$ and $B(1, -1, 6)$ is $\\mathbf{r} =$").parsingMode(.onlyEquations)',
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
        '4', '4', 'Use the substitution  $u = \cos^{-1} \frac{1}{2}x$  to show that  $\int_0^1 \frac{\cos^{-1} \frac{1}{2}x}{\sqrt{4 - x^2}} \, dx = \frac{5\pi^2}{72}$.', 'Use the substitution  $u = \cos^{(-1)} \frac{1}{2}x$  to show that  $\int_0^1 \frac{\cos^{(-1)} \frac{1}{2}x}{\sqrt{4 - x^2}} \, dx = \frac{5 \pi^2}{72}$.',
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
        '2', '2', 'Differentiate  $\cos^{-1} (3x - 2)$, expressing your answer in its simplest form.', 'Differentiate  $\cos^{(-1)} (3x - 2)$, expressing your answer in its simplest form.',
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
        '3', '3', 'Show that  $\theta_{n+1} = \sin^{-1} \left( \frac{2}{8 - \theta_n^2} \right)$  is a suitable iteration for the approximation of the roots of the equation  $\csc \theta = 4 - \frac{1}{2} \theta^2$.', 'Show that  $\theta_{n+1} = \sin^{(-1)} \left( \frac{2}{8 - \theta_n^2} \right)$  is a suitable iteration for the approximation of the roots of the equation  $\csc \theta = 4 - \frac{1}{2} \theta^2$.',
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
        q.id, s.name, 2, 2026, 'May', 2, '4',
        '1', '1', 'Vectors  $\mathbf{a}$  and  $\mathbf{b}$  are such that  $\mathbf{a} = 3\mathbf{i} + 4\mathbf{j}$  and  $\mathbf{b} = -2\mathbf{i} + \mathbf{j}$.  Calculate  $\mathbf{a} \cdot \mathbf{b}$.', 'Vectors  $\mathbf{a}$  and  $\mathbf{b}$  are such that  $\mathbf{a} = 3 \mathbf{i} + 4 \mathbf{j}$  and  $\mathbf{b} = -2 \mathbf{i} + \mathbf{j}$.  Calculate  $\mathbf{a} \cdot \mathbf{b}$.',
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
        q.id, s.name, 2, 2026, 'May', 2, '4',
        '2', '2', 'Determine the vector equation of the plane that passes through the point  $(1, -1, 2)$  and that is perpendicular to the vector  $2\mathbf{i} + 3\mathbf{j} - \mathbf{k}$.', 'Determine the vector equation of the plane that passes through the point  $(1, -1, 2)$  and that is perpendicular to the vector  $2 \mathbf{i} + 3 \mathbf{j} - \mathbf{k}$.',
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
$\tan^{(-1)} \frac{\sqrt{3}}{3}$  and the volume of the cone can be calculated as  $V = \frac{1}{3} \pi r^2 h.$
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
        '3', '3', 'A car which has a mass of 1500 kg travels along a straight horizontal road at a constant speed of  $27 \,$ms$^{-1}$. The car then travels at a constant speed up a hill inclined at an angle  $\theta = \sin^{-1}(0.2)$. Determine the power of the engine if the speed of the car is  $15 \,$ms$^{-1}$  and the resistance to motion is 600 N.', 'A car which has a mass of 1500 kg travels along a straight horizontal road at a constant speed of  $27 \,$ms$^{-1}$. The car then travels at a constant speed up a hill inclined at an angle  $\theta = \sin^{(-1)}(0.2)$. Determine the power of the engine if the speed of the car is  $15 \,$ms$^{-1}$  and the resistance to motion is 600 N.',
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
        '2', '2', 'Every hour, a conveyor belt carries 50 000 packages 75 metres up a slope whose inclination is  $\sin^{-1}(\frac{1}{10})$. Each package weighs 45 N and the power absorbed by friction in driving the conveyor belt is 2000 W. Calculate the work done to lift the 50 000 packages.', 'Every hour, a conveyor belt carries 50 000 packages 75 metres up a slope whose inclination is  $\sin^{(-1)}(\frac{1}{10})$. Each package weighs 45 N and the power absorbed by friction in driving the conveyor belt is 2000 W. Calculate the work done to lift the 50 000 packages.',
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
        '2', '2', 'Every hour, a conveyor belt carries 50 000 packages 75 metres up a slope whose inclination is  $\sin^{-1}(\frac{1}{10})$. Each package weighs 45 N and the power absorbed by friction in driving the conveyor belt is 2000 W. Calculate the power required to lift the packages.', 'Every hour, a conveyor belt carries 50 000 packages 75 metres up a slope whose inclination is  $\sin^{(-1)}(\frac{1}{10})$. Each package weighs 45 N and the power absorbed by friction in driving the conveyor belt is 2000 W. Calculate the power required to lift the packages.',
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
        '3', '3', 'Every hour, a conveyor belt carries 50 000 packages 75 metres up a slope whose inclination is  $\sin^{-1}(\frac{1}{10})$. Each package weighs 45 N and the power absorbed by friction in driving the conveyor belt is 2000 W. Hence, show that the total power output of the motor is 6687.5 W.', 'Every hour, a conveyor belt carries 50 000 packages 75 metres up a slope whose inclination is  $\sin^{(-1)}(\frac{1}{10})$. Each package weighs 45 N and the power absorbed by friction in driving the conveyor belt is 2000 W. Hence, show that the total power output of the motor is 6687.5 W.',
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
        q.id, s.name, 2, 2026, 'May', 2, '1',
        '3', '3', 'Outline a suitable procedure for determining if a new snack in a school cafeteria, which is made from the legume chickpeas, contains starch and proteins. Your response MUST utilize all of the following apparatus and material:
1% copper sulfate solution
5% potassium hydroxide
Chickpea snack (in powder)
Distilled water
I$_2$/KI solution
Balance
Syringes (2 ml, 5 ml)
Test tubes', 'Outline a suitable procedure for determining if a new snack in a school cafeteria, which is made from the legume chickpeas, contains starch and proteins. Your response MUST utilize all of the following apparatus and material:
1% copper sulfate solution
5% potassium hydroxide
Chickpea snack (in powder)
Distilled water
I$_2$/KI solution
Balance
Syringes (2 ml, 5 ml)
Test tubes',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Biology%') AND q.paper = 2 AND q.number = 2
      AND (2026 IS NULL OR q.year = 2026)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2024, 'May', 2, '1',
        '1', '1', 'Using the equation,  $2\,$MnO$_4^-($aq$) + 5\,$NO$_2^-($aq$) + 6\,$H$^+($aq$) \rightarrow$Mn$^{2+}($aq$) + 5\,$NO$_3^-($aq$) + 3\,$H$_2$O$($l$)$
Deduce the number of moles of  KNO$_2$  in the titre volume.', 'Using the equation,  $2\,$MnO$_4^-($aq$) + 5\,$NO$_2^-($aq$) + 6\,$H$^+($aq$) \rightarrow$Mn$^{2+}($aq$) + 5\,$NO$_3^-($aq$) + 3\,$H$_2$O$($l$)$
Deduce the number of moles of  KNO$_2$  in the titre volume.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 2 AND q.number = 2
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2024, 'May', 2, '2',
        '3', '3', 'Consider the following equilibrium reactions.
Equilibrium A:  H$_2$O(g)$+$C(s)$\rightleftharpoons$H$_2$(g)$+$CO(g) $\Delta H = +131\,$kJ$\,$mol$^{-1}$
Equilibrium B:  $2$CrO$_4^{2-}($aq$) + 2$H$^+($aq$) \rightleftharpoons$Cr$_2$O$_7^{2-}($aq$) +$H$_2$O(l)
Use Le Chatelier''s principle to predict and explain the effect of increasing the pressure on Equilibrium A.', 'Consider the following equilibrium reactions.
Equilibrium A:  H$_2$O(g)$+$C(s)$\rightleftharpoons$H$_2$(g)$+$CO(g) $\Delta H = +131\,$kJ$\,$mol$^{-1}$
Equilibrium B:  $2$CrO$_4^{2-}($aq$) + 2$H$^+($aq$) \rightleftharpoons$Cr$_2$O$_7^{2-}($aq$) +$H$_2$O(l)
Use Le Chatelier''s principle to predict and explain the effect of increasing the pressure on Equilibrium A.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 2 AND q.number = 2
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2026, 'May', 2, '1',
        '4', '4', 'Outline the experimental steps that can be used to determine the volume of a  $0.1152\,$M  solution of  H$_2$SO$_4$  which would be required to neutralize  $25.00\,$mL  of a  $0.1913\,$M  KOH solution.', 'Outline the experimental steps that can be used to determine the volume of a  $0.1152\,$M  solution of  H$_2$SO$_4$  which would be required to neutralize  $25.00\,$mL  of a  $0.1913\,$M  KOH solution.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 2 AND q.number = 2
      AND (2026 IS NULL OR q.year = 2026)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2026, 'May', 2, '2',
        '3', '3', 'Substance A and Substance B react according to the equation:  A$+ 2$B$\rightarrow$AB$_2$.  With reference to the experiment number used in Table 2, deduce the order of the reaction with respect to Substance A and Substance B.', 'Substance A and Substance B react according to the equation:  A$+ 2$B$\rightarrow$AB$_2$.  With reference to the experiment number used in Table 2, deduce the order of the reaction with respect to Substance A and Substance B.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 2 AND q.number = 2
      AND (2026 IS NULL OR q.year = 2026)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2024, 'May', 2, '1',
        '1', '1', 'A hydrocarbon compound whose molecular formula is  C$_8$H$_{18}$  was determined to have a given number of isomers.
Define the term ‘structural isomerism’.', 'A hydrocarbon compound whose molecular formula is  C$_8$H$_{18}$  was determined to have a given number of isomers.
Define the term ‘structural isomerism’.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 2 AND q.number = 2
      AND (2024 IS NULL OR q.year = 2024)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2025, 'May', 2, '1',
        '2', '2', 'Figure 1 shows Compound A and Compound B which are two possible isomers of  C$_7$H$_{16}$.
Name EACH of the following compounds in Figure 1.
Compound A
Compound B', 'Figure 1 shows Compound A and Compound B which are two possible isomers of  C$_7$H$_{16}$.
Name EACH of the following compounds in Figure 1.
Compound A
Compound B',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 2 AND q.number = 2
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2025, 'May', 2, '1',
        '3', '3', 'Another hydrocarbon, having molecular formula  C$_5$H$_{10}$  undergoes oxidation reaction with hot acidified  KMnO$_4$  to form two products, R and S. The products were subjected to analysis as seen in Table 1.
Complete Table 1 by inserting the appropriate observations and inferences in the spaces provided.', 'Another hydrocarbon, having molecular formula  C$_5$H$_{10}$  undergoes oxidation reaction with hot acidified  KMnO$_4$  to form two products, R and S. The products were subjected to analysis as seen in Table 1.
Complete Table 1 by inserting the appropriate observations and inferences in the spaces provided.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 2 AND q.number = 2
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2025, 'May', 2, '1',
        '3', '3', 'Name and draw the displayed structure of the hydrocarbon  C$_5$H$_{10}$  that was oxidized.', 'Name and draw the displayed structure of the hydrocarbon  C$_5$H$_{10}$  that was oxidized.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 2 AND q.number = 2
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2025, 'May', 2, '2',
        '3', '3', 'Figure 4 shows a diagram of Compound D which has the molecular formula  C$_5$H$_8$O. Infrared spectroscopy was used to determine the structure of Compound D.
Compound D exhibits characteristic absorption wave numbers  $1695\,$cm$^{-1}$  and  $1619\,$cm$^{-1}$  in the infrared spectrum. Indicate the functional groups responsible for these absorptions.', 'Figure 4 shows a diagram of Compound D which has the molecular formula  C$_5$H$_8$O. Infrared spectroscopy was used to determine the structure of Compound D.
Compound D exhibits characteristic absorption wave numbers  $1695\,$cm$^{-1}$  and  $1619\,$cm$^{-1}$  in the infrared spectrum. Indicate the functional groups responsible for these absorptions.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 2 AND q.number = 2
      AND (2025 IS NULL OR q.year = 2025)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2026, 'May', 2, '1',
        '3', '3', 'Compound A contains carbon, hydrogen and oxygen. Combustion analysis of  $0.544\,$g  of Compound A gave  $1.039\,$g  of  CO$_2$  and  $0.637\,$g  of  H$_2$O.
Calculate the empirical formula of Compound A.', 'Compound A contains carbon, hydrogen and oxygen. Combustion analysis of  $0.544\,$g  of Compound A gave  $1.039\,$g  of  CO$_2$  and  $0.637\,$g  of  H$_2$O.
Calculate the empirical formula of Compound A.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 2 AND q.number = 2
      AND (2026 IS NULL OR q.year = 2026)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2026, 'May', 2, '1',
        '2', '2', 'In the reaction scheme below, the primary amine, B, reacts with Reagent C. \( \text{B} + \text{C} \rightarrow \text{CH}_3(\text{CH}_2)_4-\text{NH}_3\text{Cl} \)
State the name of the reagent C.', 'In the reaction scheme below, the primary amine, B, reacts with Reagent C. \( \text{B} + \text{C} \rightarrow \text{CH}_3(\text{CH}_2)_4-\text{NH}_3 \text{Cl} \)
State the name of the reagent C.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 2 AND q.number = 2
      AND (2026 IS NULL OR q.year = 2026)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2026, 'May', 2, '2',
        '3', '3', 'In an experiment, 2.70 g of a  CuSO$_4 \cdot x$H$_2$O  when heated at  $200\,^\circ$C  for 30 min gave a white solid  CuSO$_4$  (RMM = 159.6) of mass 1.51 g. Use the information above to determine the chemical formula of the hydrate of  CuSO$_4$, that is, the  $x$  in  CuSO$_4 \cdot x$H$_2$O.', 'In an experiment, 2.70 g of a  CuSO$_4 \cdot x$H$_2$O  when heated at  $200\,^\circ$C  for 30 min gave a white solid  CuSO$_4$  (RMM = 159.6) of mass 1.51 g. Use the information above to determine the chemical formula of the hydrate of  CuSO$_4$, that is, the  $x$  in  CuSO$_4 \cdot x$H$_2$O.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 2 AND q.number = 2
      AND (2026 IS NULL OR q.year = 2026)
    LIMIT 1;
INSERT INTO fixed_questions (
        original_question_id, subject_name, paper, year, month, number, part,
        original_question_raw, fixed_question_raw, original_question_code, fixed_question_code,
        fix_type, status
    ) SELECT
        q.id, s.name, 2, 2026, 'May', 2, '3',
        '2', '2', 'Octane,  C$_8$H$_{18}$, can be cracked to form ethane and one other hydrocarbon. Write an equation to show this reaction.', 'Octane,  C$_8$H$_{18}$, can be cracked to form ethane and one other hydrocarbon. Write an equation to show this reaction.',
        'latex_syntax_fix', 'pending'
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (s.name LIKE '%Chemistry%') AND q.paper = 2 AND q.number = 2
      AND (2026 IS NULL OR q.year = 2026)
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