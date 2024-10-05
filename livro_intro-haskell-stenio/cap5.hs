{-# OPTIONS_GHC -Wno-missing-export-lists #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use max" #-}
{-# HLINT ignore "Use guards" #-}
{-# HLINT ignore "Use map" #-}

import Data.Char ( ord, chr, toLower )

-- Este documento contém código em Haskell que resolve diversos exercícios do capítulo 5 do livro "Introdução a Haskell".
-- Abaixo estão as funções solicitadas.

-- Funções exemplo (implementadas durante o capítulo)
-- type Pnome = String 
-- type Unome = String
-- type Matricula = Int

-- type Aluno = (Pnome, Unome, Matricula)

-- aluno :: Aluno
-- aluno = ("Pedro", "Lucas", 007)

-- primeiroN :: Aluno -> Pnome
-- primeiroN (pn, _, _) = pn

-- ultimoN :: Aluno -> Unome
-- ultimoN (_, un, _) = un

-- mat :: Aluno -> Matricula
-- mat (_, _, m) = m 

-- imprimir :: Aluno -> String
-- imprimir (pn, un, m) = "Nome: " ++ pn ++ " " ++ un ++ ", Matricula: " ++ show m

type Ponto = (Float, Float)

distancia :: Ponto -> Ponto -> Float
distancia (x1, y1) (x2, y2) = sqrt ((x2 - x1)^2 + (y2 - y1)^2)

distancia2 :: Ponto -> Ponto -> Float
distancia2 (x1, y1) (x2, y2) = sqrt (sqrtdif x1 x2 + sqrtdif y1 y2)
    where
        sqrtdif a b = (b - a) * (b - a)

f :: Double -> Double
f x = let a = x^2
    in a^2 + 2*a + 1

fat :: Int -> Int
fat n
    | n < 0 = error "Fatorial inválido"
    | n == 0 = 1
    | otherwise = n * fat (n - 1)
-- Fim funções exemplo

-- Exerc. 3 
troca :: (Int, Int) -> (Int, Int)
troca (n1, n2) = (n2, n1)
-- Fim exerc. 3

-- Exerc. 4
-- Ponto definido na linha 27
type Reta = (Ponto, Ponto)
-- Exerc. 4 (a)
somaPontos :: Ponto -> Ponto -> Ponto
somaPontos (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)
-- Exerc. 4 (b)
ehVertical :: Reta -> Bool
ehVertical ((x1, _), (x2, _)) = x1 == x2
-- Exerc. 4 (c)
ehHorizontal :: Reta -> Bool
ehHorizontal ((_, y1), (_, y2)) = y1 == y2
-- Fim exerc. 4

-- Exerc. 5
type Complexo = (Float, Float)
somaComplexo :: Complexo -> Complexo -> Complexo
somaComplexo (r1, i1) (r2, i2) = (r1 + r2, i1 + i2)
subtraiComplexo :: Complexo -> Complexo -> Complexo
subtraiComplexo (r1, i1) (r2, i2) = (r1 - r2, i1 - i2)
multiplicaComplexo :: Complexo -> Complexo -> Complexo
multiplicaComplexo (r1, i1) (r2, i2) = (r1 * r2 - i1 * i2, r1 * i2 + i1 * r2)
-- Fim exerc. 5

-- Exerc. 6
minEmax :: [Int] -> (Int, Int)
minEmax l = (minimum l, maximum l)
-- Fim exerc. 6

-- Exerc. 7
ultimo :: [Int] -> (Int, [Int])
ultimo [x] = (x, [])
ultimo (x:xs) = let (u, resto) = ultimo xs
                in (u, x:resto)
-- Fim exerc. 7

-- Exerc. 8
-- Definições do exercicio
type Matricula = Int
type Nome = String
type Bairro = String
type Aluno = (Matricula, Nome, Bairro)
type Alunos = [Aluno]

---------- Criando alunos e lista de alunos para teste ----------
-- aluno1, aluno2, aluno3, aluno4 :: Aluno
-- aluno1 = (202401, "Joao", "Limoeiro")
-- aluno2 = (202402, "Maria", "Limoeiro")
-- aluno3 = (202403, "Felipe", "Laranjeira")
-- aluno4 = (202404, "Renato", "Bananeira")
-- listaAlunos :: Alunos
-- listaAlunos = [aluno1, aluno2, aluno3]
------------------------------------------------------------------

-- Exerc. 8 (a)
addAluno :: Aluno -> Alunos -> Alunos
addAluno a la = a : la
-- Exerc. 8 (b)
rmvAluno :: Aluno -> Alunos -> Alunos
rmvAluno _ [] = []
rmvAluno aWnt (aFnd:resto) = if aWnt == aFnd then rmvAluno aWnt resto else  aFnd : rmvAluno aWnt resto
-- Exerc. 8 (c)
getAlunosByBairro :: String -> Alunos -> [String]
getAlunosByBairro _ [] = []
getAlunosByBairro bairro (aFnd:resto) = if match bairro aFnd then getNome aFnd : getAlunosByBairro bairro resto else getAlunosByBairro bairro resto
    where
        match bairroWnt (_, _, bairroFnd) = bairroWnt == bairroFnd
        getNome (_, nome, _) = nome
-- Exerc. 8 (d)
getAlunoByMat :: Int -> Alunos -> Aluno
getAlunoByMat _ [] = error "Aluno não encontrado"
getAlunoByMat mat (aFnd:resto) = if match mat aFnd then aFnd else getAlunoByMat mat resto
    where match matWnt (matFnd, _, _) = matWnt == matFnd
-- Fim exerc. 8

-- Exerc. 9  
-- Definições do exercicio
type Codigo = Int
-- type Nome = String -- Já definido na linha 91
type Genero = String
type ValorAlugel = Float
type Filme = (Codigo, Nome, Genero, ValorAlugel)
type Filmes = [Filme]

---------- Criando filmes e lista de filmes para testes ----------
-- filme1, filme2, filme3, filme4, filme5, filme6 :: Filme
-- filme1 = (1210, "The thing", "Terror", 24.99)
-- filme2 = (1111, "Friday the 13th", "Terror", 19.99)
-- filme3 = (1012, "Night of the living dead", "Terror", 14.99)
-- filme4 = (1120, "Memento", "Suspense", 19.99)
-- filme5 = (1221, "American Psycho", "Suspense", 24.99)
-- filme6 = (1030, "Monty Python and The Holy Grail", "Comedia", 14.99)
-- listaFilmes :: [Filme]
-- listaFilmes = [filme1, filme2, filme3, filme4, filme5, filme6]
-------------------------------------------------------------------

-- Exerc. 9 (a)
getSuspenses :: Filmes -> [Codigo]
getSuspenses [] = []
getSuspenses (x:xs) = if isSuspense x then getCodigo x : getSuspenses xs else getSuspenses xs
    where
        isSuspense (_, _, g, _) = g == "Suspense"
        getCodigo (c, _, _, _) = c
-- Exerc. 9 (b)
aumenta20Cents :: Filmes -> Filmes
aumenta20Cents [] = []
aumenta20Cents (x:xs) = newFilme x : aumenta20Cents xs
    where newFilme (c, n, g, v) = (c, n, g, v + 0.20)
-- Exerc. 9 (c)
quantosTerror :: Filmes -> Int
quantosTerror [] = 0
quantosTerror (x:xs) = if isTerror x then 1 + quantosTerror xs else quantosTerror xs
    where isTerror (_, _, g, _) = g == "Terror"
-- Fim exerc. 9

-- Exerc. 10 (a)
getString :: String -> String
getString [] = []
getString (x:xs) = if x == ' ' then [] else x : getString xs
-- Exerc. 10 (b)
dropString :: String -> String
dropString [] = []
dropString (x:xs) = if x == ' ' then xs else dropString xs
-- Exerc. 10 (c)
splitString :: String -> [String]
splitString [] = []
splitString str = getString str : splitString (dropString str)
-- Exerc. 10 (d)
lastString :: [String] -> String
lastString [str] = str
lastString (x:xs) = lastString xs
-- Exerc. 10 (e)
initString :: [String] -> [String]
initString [str] = []
initString (x:xs) = x : initString xs
-- Exerc. 10 (f)
initChars :: [String] -> String
initChars [] = []
initChars (x:xs) = getInitChar x : '.' : initChars xs
    where getInitChar (y:ys) = y
-- Exerc. 10 (g)
converte :: String -> String
converte nome = let nomeLista = splitString nome
    in lastString nomeLista ++ " " ++ initChars (initString nomeLista)
-- Fim exerc. 10

-- Exerc. 11
-- Definições do exercício
-- type Nome = String -- Já definido na linha 91
type Nomes = [Nome]
type Email = String
type Emails = [Email]

---------- Criando lista de nomes para testes ----------
-- nome1, nome2, nome3 :: Nome
-- nome1 = "Joao Carlos Silva"
-- nome2 = "Maria Silva Cardoso"
-- nome3 = "Senor Abravanela Santos"
-- listaNomes :: Nomes
-- listaNomes = [nome1, nome2, nome3]
---------------------------------------------------------

-- Implementação do exercício 11
converteNomes :: Nomes -> Emails
converteNomes [] = []
converteNomes (x:xs) = nomeParaEmail x : converteNomes xs
-- Funções auxiliares do exercício 11
nomeParaEmail :: Nome -> Email
nomeParaEmail nome = iniciais nome ++ "@empresa.com.br"
    where iniciais nome = initChars2 (splitString nome)
initChars2 :: [String] -> String -- Igual ao do exercício 10 (f), mas sem os pontos e com as letras minúsculas
initChars2 [] = []
initChars2 (x:xs) = toLower (getInitChar x) : initChars2 xs
    where getInitChar (y:ys) = y
-- Fim exerc. 11

-- Exerc. 12 
-- Escolhi não implementar o exercício 12, pois seria necessário mapear vários valores
-- para sua versão "por extenso", por exemplo "1" = "um", "2" = dois, etc...
-- Isso é só um trabalho chato e repetitivo e não acrescenta muito no aprendizado
-- não entendi o sentido desse exercício no livro.
-- Fim exerc. 12

-- Exerc. 13
equacao2G :: Float -> Float -> Float -> (Float, Float)
equacao2G a b c = let delta = b^2 - 4*a*c
    in ((-b + sqrt delta)/2*a, (-b - sqrt delta)/2*a)
-- Fim exerc. 13

-- Exerc. 14
maior3 :: Int -> Int -> Int -> Int
maior3 x y z = if (x >= y) && (x >= z) then x 
    else (if (y >= x) && (y >= z) then y else z)
-- Fim exerc. 14

-- Exerc. 15
ordena :: (Int, Int, Int) -> (Int, Int, Int)
ordena (x, y, z) =  
    let maior = maior3 x y z
        menor = if (x <= y) && (x <= z) then x 
                else (if (y <= x) && (y <= z) then y else z)
        meio = if (x /= maior) && (x /= menor) then x
               else if (y /= maior) && (y /= menor) then y
               else z
    in (menor, meio, maior)
-- Fim exerc. 15

-- Exerc. 16
criptografa :: String -> String
criptografa [] = []
criptografa (x:xs) = 
    if x == ' ' then 
        x : criptografa xs
    else
        substitui x : criptografa xs
    where 
        substitui x = 
            if ehMaiuscula x then 
                chr ((ord x + 3 - 65) `mod` 26 + 65)
            else 
                chr ((ord x + 3 - 97) `mod` 26 + 97)
        ehMaiuscula x = (65 <= ord x) && (ord x <= 90)

-- Fim exerc. 16