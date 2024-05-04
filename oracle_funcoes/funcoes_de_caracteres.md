| | | | |
|-|-|-|-|
| | | | |
| | | | |
| | | | |
| | |Função|Descrição|
| | |ASCII(x)|Retorna o valor ASCII do caractere x.|
| | |CHR(x)|Retorna o caractere com o valor ASCII x.|
| | |CONCAT(x, y)|Anexa y a x e depois retorna a nova string. |
| | |INITCAP(x)|Converte a letra inicial de cada palavra da string x em maiúsculas  e retorna a nova string.|
| | |INSTR(x, localizar_string  [, início] [, ocorrência])|Procura localizar_string em x e retorna a posição em que localizar_string ocorre.  Você pode fornecer uma posição início opcional para iniciar a busca.  Você também pode fornecer uma ocorrência opcional, que indica qual ocorrência de localizar_string deve ser retornar.|
| | |LENGTH(x)|Retorna o número de caracteres em x.|
| | |LOWER(x)|Converte as letras de x para minúsculas e retorna a nova string.|
| | |LPAD(x, lagura  [, string_preenchimento])|Preencher x com espaços à esquerda para que o comprimento total da string tenha até caracteres largura. Você pode fornecer uma string_preenchimento opcional, que especifica uma string a ser repetida à esquerda de x para ocupar o espaço prenchido e, então, a string preenchida resultante é retornada.|
| | |LTRIM(x [, string_corte])|Corta caracteres à esquerda de x. Você pode fornecer uma string_corte opcional, que especifica os caracteres a serem cortados; se nenhuma string_corte for fornecida, então espaços serão cortados por padrão.|
| | |NANVL(x, valor)|Retorna valor, caso x corresponda ao valor especial NAN (not a number); caso contrário, x será retornado. (Esta função for introduzida no Oracle Database 10g).|
| | |NVL(x, valor)|Retorna valor, caso x seja nulo; caso contrário, x será retornado.|
| | |NVL2(x, valor1, valor2)|Retorna valor1 se x não é nulo; caso contrário, valor2 é retornado.|
| | |REPLACE(x, string_busca, string_substituta)|Procura string_busca em x e substitui por string_substituta.|
| | |RPAD(x, largura [, string_preenchimento])|Igual a LPAD(), mas x é preenchido à direita.|
| | |RTRIM(x, [, string_corte])|Igual a LTRIM(), mas x é cortado à direita.|
| | |SOUNDEX(x)|Retorna uma string contendo a representação fonética de x. Isso permite que você compare palavras homófonas, mas não homógrafas, em inglês.|
| | |SUBSTR(x, início [, comprimento])|Retorna uma substring de x que começa na posição especificada por início. Você pode fornecer um comprimento opcional para a substring.|
| | |TRIM([car_corte FROM] x)|Corte caracteres à esquerda e à direita de x. Você pode fornecer um car_corte opcional, o qual especifica os caracteres a serem cortados; se nenhum car_corte for fornecido, espaços serão cortados por padrão.|
| | |UPPER(x)|Converte as letras de x em maiúsculas e retorna a nova string.|
