/* Challenge 1 - Who Have Published What At Where? */
SELECT
    a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    t.title AS 'TITLE',
    p.pub_name AS 'PUBLISHER'
FROM
    titleauthor ta
JOIN
    authors a ON ta.au_id = a.au_id  -- Corrected to use ta.au_id
JOIN
    titles t ON ta.title_id = t.title_id
JOIN
    publishers p ON t.pub_id = p.pub_id;  -- Joining on pub_id

/*Compare nuymber of rows in titleauthor vs my output */
SELECT COUNT(*) AS total_records FROM titleauthor;

/*My oputput */
SELECT COUNT(*) AS total_output_rows
FROM
    titleauthor ta
JOIN
    authors a ON ta.au_id = a.au_id
JOIN
    titles t ON ta.title_id = t.title_id
JOIN
    publishers p ON t.pub_id = p.pub_id;

    
/*Challenge 2 - Who Have Published How Many At Where? */
SELECT
    a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    p.pub_name AS 'PUBLISHER',
    COUNT(t.title) AS 'TOTAL TITLES'
FROM
    titleauthor ta
JOIN
    authors a ON ta.au_id = a.au_id
JOIN
    titles t ON ta.title_id = t.title_id
JOIN
    publishers p ON t.pub_id = p.pub_id
GROUP BY
    a.au_id, p.pub_name
ORDER BY
    a.au_lname, p.pub_name;

SELECT SUM(total_titles) AS 'TOTAL TITLE COUNT'
FROM (
    SELECT COUNT(t.title) AS total_titles
    FROM titleauthor ta
    JOIN authors a ON ta.au_id = a.au_id
    JOIN titles t ON ta.title_id = t.title_id
    JOIN publishers p ON t.pub_id = p.pub_id
    GROUP BY a.au_id, p.pub_name
) AS title_counts;

SELECT COUNT(*) AS total_records FROM titleauthor;

/*Challenge 3 - Best Selling Authors */
SELECT
    a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    COUNT(t.title) AS 'TOTAL'
FROM
    titleauthor ta
JOIN
    authors a ON ta.au_id = a.au_id
JOIN
    titles t ON ta.title_id = t.title_id
GROUP BY
    a.au_id
ORDER BY
    COUNT(t.title) DESC
LIMIT 3;

/*Challenge 4 - Best Selling Authors Ranking */
SELECT
    a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    COALESCE(COUNT(t.title), 0) AS 'TOTAL'
FROM
    authors a
LEFT JOIN
    titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN
    titles t ON ta.title_id = t.title_id
GROUP BY
    a.au_id
ORDER BY
    TOTAL DESC;





