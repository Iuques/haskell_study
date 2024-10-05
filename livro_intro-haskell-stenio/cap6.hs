{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use map" #-}
{-# HLINT ignore "Use even" #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use sum" #-}
{-# HLINT ignore "Eta reduce" #-}
{-# HLINT ignore "Use or" #-}
{-# HLINT ignore "Use concat" #-}
{-# HLINT ignore "Use product" #-}

import Data.Char ( ord, toLower )

-- Este documento contém código em Haskell que resolve diversos exercícios do capítulo 6 do livro "Introdução a Haskell".
-- Abaixo estão as funções solicitadas.

-- Funções exemplo (implementadas durante o capítulo)
duplica :: Int -> Int
duplica n = n + n
duplicaLst :: [Int] -> [Int]
duplicaLst [] = []
duplicaLst (este:aqueles) = duplica este : duplicaLst aqueles

quadra :: Int -> Int
quadra n = n * n
quadraTodos :: [Int] -> [Int]
quadraTodos [] = []
quadraTodos (este:aqueles) = quadra este : quadraTodos aqueles

-- mapInt :: (Int -> Int) -> [Int] -> [Int]
-- mapInt f [] = []
-- mapInt f (este:aqueles) = f este : mapInt f aqueles

ehPar :: Int -> Bool
ehPar n = mod n 2 == 0
pares :: [Int] -> [Int]
pares [] = []
pares (h:c) = if ehPar h then h : pares c else pares c

ehImpar :: Int -> Bool
ehImpar n = mod n 2 == 1
impares :: [Int] -> [Int]
impares [] = []
impares (h:c) = if ehImpar h then h : impares c else impares c

-- filtro :: (Int -> Bool) -> [Int] -> [Int]
-- filtro p [] = []
-- filtro p (h:c) = if p h then h : filtro p c else filtro p c

intPrim :: (Int, Int) -> Int
intPrim (l, _) = l

carPrim :: (Char, Char) -> Char
carPrim (l, _) = l

prim :: (a, b) -> a
prim (a, _) = a

tamanho :: [a] -> Int
tamanho [] = 0
tamanho (a:b) = 1 + tamanho b
-- Fim funções exemplo

-- Exerc. 4
zipar :: [a] -> [b] -> [(a, b)]
zipar [] _ = []; zipar _ [] = []
zipar (a:ax) (b:bx) = (a, b) : zipar ax bx
-- Fim exerc. 4

-- Exerc. 6
umafuncao :: [t] -> Int
umafuncao x = foldl (+) 0 (map um x)
    where um y = 1
-- A função mapeia 1 para todo valor da lista, em seguida soma toda a lista de 1
-- Ex: (Input) ['a', 'b', 'c'] -> [1, 1, 1] -> 1 + 1 + 1 -> 3 (Output)
-- Fim exerc. 6

-- Exerc. 7
mapInt :: (Int -> Int) -> [Int] -> [Int]
mapInt f l = [f x | x <- l]
-- Fim exerc. 7

-- Exerc. 8
filtro :: (Int -> Bool) -> [Int] -> [Int]
filtro f l = [x | x <- l, f x]
-- Fim exerc. 8

-- Exerc. 9 (a)
dobraLista :: [Int] -> [Int]
dobraLista l = map duplica l
-- Exerc. 9 (b)
listaMinuscula :: [Char] -> [Char]
listaMinuscula l = map toLower l
-- Exerc. 9 (c)
tamanhosStrings :: [String] -> [Int]
tamanhosStrings l = map length l
-- Fim exerc. 9

-- Exerc. 10 (a)
sequenciaOu :: [Bool] -> Bool
sequenciaOu l = foldr (||) False l
-- Exerc. 10 (b)
concatenaStrings :: [String] -> String
concatenaStrings l = foldr (++) [] l
-- Exerc. 10 (c)
menorDaLista :: [Int] -> Int
menorDaLista l = foldr min maxBound l
-- Exerc. 10 (d)
produtoLista :: [Float] -> Float
produtoLista l = foldr (*) 1 l
-- Fim exerc. 10

-- Exerc. 11 (a)
positivosLista :: [Int] -> [Int]
positivosLista l = filter ehPositivo l
    where ehPositivo x = signum x == 1 
-- Exerc. 11 (b)
primosLista :: [Int] -> [Int]
primosLista l = filter odd l
-- Exerc. 11 (c)
digitosLista :: [Char] -> [Char]
digitosLista l = filter ehDigito l
    where ehDigito x = ord x >= 48 && ord x <= 57
-- Fim exerc. 11

-- Exerc. 12/13
type Vetor = [Float]
somaVetores :: Vetor -> Vetor -> Vetor
somaVetores v w = zipWith (+) v w
-- Fim exerc. 12/13

-- Exerc. 14
produtoEscalar :: Vetor -> Vetor -> Float
produtoEscalar v w = sum (zipWith (*) v w)
-- Fim exerc. 14