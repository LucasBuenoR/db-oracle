/*
Capitulo II
Recuperando informacoes de tabelas
de banco de dados
*/

--SELECT simples
SELECT id_cliente,
       nome,
       sobrenome,
       dt_nascimento,
       telefone
FROM tb_clientes;
    
SELECT * FROM tb_clientes;

SELECT * FROM tb_clientes
    WHERE id_cliente = 2;


--identificadores de linhas ROWID
SELECT ROWID, 
       id_cliente
FROM tb_clientes;

DESCRIBE tb_clientes;

--ROWNUM
SELECT ROWNUM,
       id_cliente,
       nome,
       sobrenome
FROM tb_clientes;

SELECT ROWNUM,
       id_cliente,
       nome,
       sobrenome
FROM tb_clientes
    WHERE id_cliente = 3;


--calculos aritmeticos
SELECT 2 * 6 FROM dual;

SELECT TO_DATE('25-JUL-2007') + 2 FROM dual;


--tabela dual
SELECT * FROM dual;

SELECT TO_DATE('02-AUG-2007') - 3 FROM dual;

SELECT TO_DATE('02-AUG-2007') - TO_DATE('25-JUL-2007') FROM dual;


--colunas na aritmetica
SELECT nm_produto,
       preco + 2
FROM tb_produtos;

SELECT nm_produto,
       preco * 3 + 1
FROM tb_produtos;

SELECT 10 * 12 / 3 - 1 FROM dual;

SELECT 10 * (12 / 3 - 1) FROM dual;


--apelidando colunas
SELECT preco * 2 DOBRO_PRECO
FROM tb_produtos;

SELECT preco * 2 "DOBRO PRECO"
FROM tb_produtos;

SELECT preco * 2 AS "DOBRO PRECO"
FROM tb_produtos;


--concatenacao de colunas
SELECT nome || ' ' || sobrenome AS "Nome do cliente"
FROM tb_clientes;


--valores nulos
SELECT id_cliente,
       nome,
       sobrenome,
       NVL(telefone, 'tel desconhecido') AS "telefone"
FROM tb_clientes;

SELECT id_cliente,
       nome,
       sobrenome,
       NVL(dt_nascimento, '01-JAN-2000') AS "data nascimento"
FROM tb_clientes;


--exibindo linhas distintas
SELECT id_cliente FROM tb_compras;

SELECT DISTINCT id_cliente FROM tb_compras;


--comparando valores
/*
 = igual
 <> ou != diferente
 < menor que
 > maior que
 <= menor igual
 >= maior igual
 ANY compara um valor com qualquer em uma lista
 SOME
 ALL compara um valor com todos os valores em uma lista
*/
SELECT * FROM tb_clientes
    WHERE id_cliente <> 2;

SELECT id_produto,
       nm_produto
FROM tb_produtos
    WHERE id_produto > 8;

SELECT ROWNUM,
       id_produto,
       nm_produto
FROM tb_produtos
    WHERE ROWNUM <= 3;

SELECT * FROM tb_clientes
    WHERE id_cliente > ANY (2, 3, 4);
    
SELECT * FROM tb_clientes
    WHERE id_cliente > ALL (2, 3, 4);


--operadores sql
/*
LIKE
IN
BETWEEN
IS NULL
IS NAN
IS INFINITE
NOT LIKE
NOT IN
NOT BETWEEN
IS NOT NULL
IS NOT NAN
IS NOT INFINITE
*/
SELECT * FROM tb_clientes
    WHERE nome LIKE '_o%';

SELECT * FROM tb_clientes
    WHERE nome NOT LIKE '_o%';
    
/*
SELECT nome FROM tb_promocao
    WHERE nome LIKE '%\%%' ESCAPE '\';
*/

SELECT * FROM tb_clientes
    WHERE id_cliente IN (2, 3, 5);
    
SELECT * FROM tb_clientes
    WHERE id_cliente NOT IN (2, 3, 4);

SELECT * FROM tb_clientes
    WHERE id_cliente NOT IN (2, 3, 5, NULL);
    
SELECT * FROM tb_clientes
    WHERE id_cliente BETWEEN 1 AND 3;
    
SELECT * FROM tb_clientes
    WHERE id_cliente NOT BETWEEN 1 AND 3;
    

--operadores logicos
/*
x AND y
x OR y
NOT x
*/
SELECT * FROM tb_clientes 
    WHERE dt_nascimento > '1-JAN-1970'
        AND id_cliente > 3;

SELECT * FROM tb_clientes
    WHERE dt_nascimento > '1-JAN-1970'
        OR id_cliente > 3;


--precedencia de valores
SELECT * FROM tb_clientes
    WHERE dt_nascimento > '01-JAN-1970'
    OR id_cliente < 2
    AND telefone LIKE '%1211';

SELECT * FROM tb_clientes
    WHERE dt_nascimento > '01-JAN-1970'
    OR (id_cliente < 2
    AND telefone LIKE '%1211');


--classificando linhas usando a clausula ORDER BY
SELECT * FROM tb_clientes
ORDER BY sobrenome;

SELECT * FROM tb_clientes
ORDER BY nome ASC, sobrenome DESC;

SELECT id_cliente,
       nome,
       sobrenome
FROM tb_clientes
ORDER BY 1;


--SELECT que usam duas tabelas
SELECT nm_produto,
       id_tipo_produto
FROM tb_produtos
    WHERE id_produto = 3;

SELECT nm_tipo_produto FROM tb_tipos_produtos
    WHERE id_tipo_produto = 1;

SELECT p.nm_produto,
       t.nm_tipo_produto
FROM tb_produtos p, tb_tipos_produtos t
    WHERE p.id_tipo_produto = t.id_tipo_produto
        AND p.id_produto = 3;

SELECT tb_produtos.nm_produto,
       tb_tipos_produtos.nm_tipo_produto
FROM tb_produtos, tb_tipos_produtos
    WHERE tb_produtos.id_tipo_produto = tb_tipos_produtos.id_tipo_produto
ORDER BY tb_produtos.nm_produto;


--apelidando tabelas        
SELECT p.nm_produto,
       t.nm_tipo_produto
FROM tb_produtos p, tb_tipos_produtos t
    WHERE p.id_tipo_produto = t.id_tipo_produto
ORDER BY p.nm_produto;


--produtos cartesianos
SELECT p.id_produto,
       t.id_tipo_produto
FROM tb_produtos p, tb_tipos_produtos t;


--SELECT que usam mais duas tabelas
SELECT c.nome, 
       c.sobrenome,
       p.nm_produto AS produto,
       pt.nm_tipo_produto AS tipo
FROM tb_clientes c, tb_compras co, tb_produtos p, tb_tipos_produtos pt
    WHERE c.id_cliente = co.id_cliente
        AND p.id_produto = co.id_produto
        AND p.id_tipo_produto = pt.id_tipo_produto
ORDER BY p.nm_produto;


--nao-equijoins
SELECT * FROM tb_grades_salarios;
    
SELECT e.nome,
       e.sobrenome,
       e.cargo,
       e.salario,
       s.id_salario
FROM tb_funcionarios e, tb_grades_salarios s
    WHERE e.salario 
        BETWEEN s.base_salario 
            AND s.teto_salario
ORDER BY id_salario;


--joins externas
SELECT p.nm_produto, 
       pt.nm_tipo_produto
FROM tb_produtos p, tb_tipos_produtos pt
    WHERE p.id_tipo_produto = pt.id_tipo_produto (+)
ORDER BY p.nm_produto;

SELECT p.nm_produto,
       pt.nm_tipo_produto
FROM tb_produtos p, tb_tipos_produtos pt
    WHERE p.id_tipo_produto (+) = pt.id_tipo_produto
ORDER BY p.nm_produto;

--limitacoes das joins externas
SELECT p.nm_produto, 
       pt.nm_tipo_produto
FROM tb_produtos p, tb_tipos_produtos pt
    WHERE p.id_tipo_produto (+) = pt.id_tipo_produto (+);
/*
ORA-01468: a predicate may reference only one outer-joined table
01468. 00000 -  "a predicate may reference only one outer-joined table"
*Cause:    
*Action:
Error at Line: 308 Column: 33
*/

SELECT p.nm_produto,
       pt.nm_tipo_produto
FROM tb_produtos p, tb_tipos_produtos pt
    WHERE p.id_tipo_produto (+) IN (1,2,3,4);

SELECT p.nm_produto,
       pt.nm_tipo_produto
FROM tb_produtos p, tb_tipos_produtos pt
    WHERE p.id_tipo_produto (+) = pt.id_tipo_produto
        OR p.id_tipo_produto = 1;
/*
ORA-01719: outer join operator (+) not allowed in operand of OR or IN
01719. 00000 -  "outer join operator (+) not allowed in operand of OR or IN"
*Cause:    An outer join appears in an or clause.
*Action:   If A and B are predicates, to get the effect of (A(+) or B),
           try (select where (A(+) and not B)) union all (select where (B)).
Error at Line: 318 Column: 33
*/


--autojoins
SELECT e.nome || ' ' || e.sobrenome || ' trabalha para ' || f.nome || ' ' || f.sobrenome
FROM tb_funcionarios e, tb_funcionarios f
    WHERE e.id_gerente = f.id_funcionario
ORDER BY e.nome;

--recuperando o id_gerente NULL
SELECT e.sobrenome || ' trabalha para ' || NVL(f.sobrenome, 'os acionistas ')
FROM tb_funcionarios e, tb_funcionarios f
    WHERE e.id_gerente = f.id_funcionario (+)
ORDER BY e.sobrenome;


--realizando joins usando a sintaxe SQL/92
SELECT p.nm_produto, 
       pt.nm_tipo_produto
FROM tb_produtos p, tb_tipos_produtos pt
    WHERE p.id_tipo_produto = pt.id_tipo_produto
ORDER BY p.nm_produto;

--SQL/92
SELECT p.nm_produto,
       pt.nm_tipo_produto
FROM tb_produtos p
    INNER JOIN tb_tipos_produtos pt
        ON (p.id_tipo_produto = pt.id_tipo_produto)
ORDER BY p.nm_produto;

SELECT e.nome,
       e.sobrenome,
       e.cargo,
       e.salario,
       g.id_salario
FROM tb_funcionarios e, tb_grades_salarios g
    WHERE e.salario 
        BETWEEN g.base_salario AND g.teto_salario
ORDER BY id_salario;

--SQL/92
SELECT e.nome,
       e.sobrenome,
       e.cargo,
       e.salario,
       g.id_salario
FROM tb_funcionarios e
    INNER JOIN tb_grades_salarios g
        ON (e.salario BETWEEN g.base_salario AND g.teto_salario)
ORDER BY id_salario;

--simplificando joins USING
SELECT p.nm_produto,
       pt.nm_tipo_produto
FROM tb_produtos p
    INNER JOIN tb_tipos_produtos pt
    USING(id_tipo_produto);

SELECT p.nm_produto,
       pt.nm_tipo_produto,
       id_tipo_produto
FROM tb_produtos p
    INNER JOIN tb_tipos_produtos pt
    USING(id_tipo_produto);
    
SELECT p.nm_produto,
       pt.nm_tipo_produto,
       p.id_tipo_produto
FROM tb_produtos p
    INNER JOIN tb_tipos_produtos pt
    USING(id_tipo_produto);
/*
ORA-25154: column part of USING clause cannot have qualifier
25154. 00000 -  "column part of USING clause cannot have qualifier"
*Cause:    Columns that are used for a named-join (either a NATURAL join
           or a join with a USING clause) cannot have an explicit qualifier.
*Action:   Remove the qualifier.
Error at Line: 402 Column: 8
*/

SELECT p.nm_produto,
       pt.nm_tipo_produto,
       p.id_tipo_produto
FROM tb_produtos p
    INNER JOIN tb_tipos_produtos pt
    USING(p.id_tipo_produto);
/*
ORA-01748: only simple column names allowed here
01748. 00000 -  "only simple column names allowed here"
*Cause:    
*Action:
Error at Line: 420 Column: 12
*/

--joins mais de duas tabelas SQL/92
SELECT c.nome,
       c.sobrenome,
       p.nm_produto AS PRODUTO,
       pt.nm_tipo_produto AS TIPO
FROM tb_clientes c, 
     tb_compras co, 
     tb_produtos p, 
     tb_tipos_produtos pt
    WHERE c.id_cliente = co.id_cliente
        AND p.id_produto = co.id_produto
        AND p.id_tipo_produto = pt.id_tipo_produto
ORDER BY p.nm_produto;

--SQL/92
SELECT c.nome,
       c.sobrenome,
       p.nm_produto AS PRODUTO,
       pt.nm_tipo_produto AS TIPO
FROM tb_clientes c
     INNER JOIN tb_compras co
        USING (id_cliente)
     INNER JOIN tb_produtos p
        USING (id_produto)
     INNER JOIN tb_tipos_produtos pt
        USING (id_tipo_produto)
ORDER BY p.nm_produto;


--realizando joins externas usando SQL/92

--LEFT
SELECT p.nm_produto,
       pt.nm_tipo_produto
FROM tb_produtos p
    LEFT OUTER JOIN tb_tipos_produtos pt
        USING (id_tipo_produto)
ORDER BY p.nm_produto;

--RIGHT
SELECT p.nm_produto,
       pt.nm_tipo_produto
FROM tb_produtos p
    RIGHT OUTER JOIN tb_tipos_produtos pt
        USING (id_tipo_produto)
ORDER BY p.nm_produto;

--FULL
SELECT p.nm_produto,
       pt.nm_tipo_produto
FROM tb_produtos p
    FULL OUTER JOIN tb_tipos_produtos pt
        USING (id_tipo_produto)
ORDER BY p.nm_produto;

--autojoins SQL/92
SELECT e.nome || ' ' || e.sobrenome || ' trabalha para ' || f.nome || ' ' || f.sobrenome
FROM tb_funcionarios e
    INNER JOIN tb_funcionarios f
        ON (e.id_gerente = f.id_funcionario)
ORDER BY e.nome;

-- join cruzada SQL/92
SELECT * FROM tb_tipos_produtos CROSS JOIN tb_produtos;


/*
Capitulo IV
Usando funcoes simples
*/

--funcoes de caracteres

--ASCII
SELECT ASCII('a'),
       ASCII('A'),
       ASCII('z'),
       ASCII('Z'),
       ASCII(0),
       ASCII(9)
FROM DUAL;

--CHR
SELECT CHR(97),
       CHR(65),
       CHR(122),
       CHR(90),
       CHR(48),
       CHR(57)
FROM DUAL;

--CONCAT
SELECT CONCAT(nome, sobrenome)
FROM tb_clientes;

--INITCAP
SELECT id_produto, INITCAP(ds_produto)
FROM tb_produtos
WHERE id_produto < 4;

--INSTR
SELECT nm_produto, INSTR(nm_produto, 'Science')
FROM tb_produtos
WHERE id_produto = 1;

SELECT nm_produto, INSTR(nm_produto, 'e', 1, 2)
FROM tb_produtos
WHERE id_produto = 1;

SELECT id_cliente, dt_nascimento, INSTR(dt_nascimento, 'JAN')
FROM tb_clientes
WHERE id_cliente = 1;

--LENGTH
SELECT nm_produto, LENGTH(nm_produto)
FROM tb_produtos;

SELECT preco, LENGTH(preco)
FROM tb_produtos
WHERE id_produto < 3;

--LOWER E UPPER
SELECT UPPER(nome), LOWER(sobrenome)
FROM tb_clientes;

--LPAD E RPAD
SELECT RPAD(nm_produto, 30, '.'), LPAD(preco, 8, '*+')
FROM tb_produtos
WHERE id_produto < 4;

--LTRIM, RTRIM E TRIM
SELECT LTRIM('  Hello Gail Seymour!'),
       RTRIM('Hi Doreen Oakley!abcabc', 'abc'),
       TRIM('0' FROM '000Hey Steve Button!00000')
FROM DUAL;

--NVL
SELECT id_cliente, NVL(telefone, 'numero desconhecido')
FROM tb_clientes;

--NVL2
SELECT id_cliente, NVL2(telefone, 'tem numero', 'nao tem numero')
FROM tb_clientes;

--REPLACE
SELECT REPLACE(nm_produto, 'Science', 'Physics')
FROM tb_produtos
WHERE id_produto = 1;

--SOUNDEX
SELECT sobrenome FROM tb_clientes
WHERE SOUNDEX(sobrenome) = SOUNDEX('whyte');

SELECT sobrenome
FROM tb_clientes
WHERE SOUNDEX(sobrenome) = SOUNDEX('bloo');

--SUBSTR
SELECT SUBSTR(nm_produto, 2, 7)
FROM tb_produtos
WHERE id_produto < 4;

SELECT SUBSTR('Mary had a little lamb', 12, 6)
FROM DUAL;

--COMBINANDO FUNCOES
SELECT nm_produto, UPPER(SUBSTR(nm_produto, 2, 8))
FROM tb_produtos
WHERE id_produto < 4;
       
