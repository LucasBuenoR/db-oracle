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
    
SELECT nome FROM tb_promocao
    WHERE nome LIKE '%\%%' ESCAPE '\';
    
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

       
