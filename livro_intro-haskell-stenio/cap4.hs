{-# OPTIONS_GHC -Wno-missing-export-lists #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use map" #-}
{-# HLINT ignore "Use even" #-}
{-# HLINT ignore "Eta reduce" #-}
{-# HLINT ignore "Use foldl" #-}

import Data.Char ( ord, toLower )

-- Este documento contém código em Haskell que resolve diversos exercícios do capítulo 4 do livro "Introdução a Haskell".
-- Abaixo estão as funções solicitadas.

-- Funções exemplo (implementadas durante o capítulo)
maior :: Int -> Int -> Int
maior x y
  | x >= y = x
  | otherwise = y

comp :: [Int] -> Int
comp[] = 0
comp(h:t) = 1 + comp t

cubo :: Int -> Int
cubo x = x * x * x
cadaAoCubo :: [Int] -> [Int]
cadaAoCubo [] = []
cadaAoCubo (h:t) = cubo h : cadaAoCubo t

ehPar :: Int -> Bool
ehPar x = x `mod` 2 == 0

pares :: [Int] -> [Int]
pares l = [x | x <- l, ehPar x]
-- Fim funções exemplo

-- Exerc. 4
caudaLista :: [Int] -> [Int]
caudaLista (h:t) = t
-- Fim exerc. 4

-- Exerc. 5
somaLista :: [Int] -> Int
somaLista [] = 0
somaLista (h:t) = h + somaLista t
-- Fim exerc. 5

-- Exerc. 6 
produtoLista :: [Int] -> Int
produtoLista [] = 1
produtoLista (h:t) = h * produtoLista t
-- Fim exerc. 6

-- Exerc. 7
maiorLista :: [Int] -> Int
maiorLista [x] = x
maiorLista (h:t) = maior h (maiorLista t)
-- Fim exerc. 7

-- Exerc. 8
membro :: [Int] -> Int -> Bool
membro [x] e = x == e
membro (h:t) e = h == e || membro t e
-- Fim exerc. 8

-- Exerc. 9
ultimo :: [char] -> char
ultimo [x] = x
ultimo (h:t) = ultimo t
-- Fim exerc. 9

-- Exerc. 10
membroNum :: [Int] -> Int -> Int
membroNum [] _ = 0
membroNum (h:t) e = if h == e then 1 + membroNum t e else membroNum t e
-- Fim exerc. 10

-- Exerc. 11
misterio :: [Int] -> Int
misterio xs = misterio2 0 xs
misterio2 :: Int -> [Int] -> Int
misterio2 a [] = a
misterio2 a (x:xs) = misterio2 (a+x) xs
-- A função é apenas uma implementação diferente da função 'somaLista', a única diferença sendo que a soma é cumulativa, 
-- onde a cada nova chamada da função, essa chamada sabe do valor atual da soma, diferente da implementação em 'somalista'
-- onde cada chamada apenas adicionava um novo número na soma, então esta chamada não sabia o atual valor total da soma.
-- Fim exerc. 11

-- Exerc. 12
operadorE :: [Bool] -> Bool
operadorE [] = True
operadorE (h:t) = h && operadorE t
-- Fim exerc. 12

-- Exerc. 13
concatenar :: [[Int]] -> [Int]
concatenar [] = []
concatenar (h:t) = h ++ concatenar t
-- Fim exerc. 13

-- Exerc. 14
ordenada :: [Int] -> Bool
ordenada [x] = True
ordenada (h1:h2:t) = h1 <= h2 && ordenada (h2:t)
-- Fim exerc. 14

-- Exerc. 15
paraMinuscula :: String -> String
paraMinuscula [] = []
paraMinuscula (h:t) = toLower h : paraMinuscula t
-- Fim exerc. 15

-- Exerc. 16
substituir :: String -> Char -> Char -> String
substituir [] _ _ = []
substituir (h:t) o n = if h == o then n : substituir t o n else h : substituir t o n
-- Fim exerc. 16

-- Exerc. 17
divisores :: Int -> [Int]
divisores n = [x | x <- [1..n], n `mod` x == 0]
-- Fim exerc. 17

-- Exerc. 18
intercala :: [Int] -> [Int] -> [Int]
intercala [] ys = ys
intercala xs [] = xs
intercala (x:xs) (y:ys)
    | x <= y    = x : intercala xs (y:ys)
    | otherwise = y : intercala (x:xs) ys
-- Fim exerc. 18

-- Exerc 19
merge :: [Int] -> [Int] -> [Int]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
    | x <= y    = x : merge xs (y:ys)
    | otherwise = y : merge (x:xs) ys
mergeSort :: [Int] -> [Int]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = merge (mergeSort left) (mergeSort right)
  where
    (left, right) = splitAt (length xs `div` 2) xs
-- Fim exerc. 19

-- Exerc. 20 (a)
dobraLista :: [Int] -> [Int]
dobraLista l = [x * 2 | x <- l]
-- Exerc. 20 (b)
filtraDigitos :: String -> String
filtraDigitos l = [x | x <- l, ord x > 47 && ord x < 58]
-- Exerc. 20 (c)
removeNegativos :: [Int] -> [Int]
removeNegativos l = [x | x <- l, signum x == 1]
-- Fim exerc. 20
