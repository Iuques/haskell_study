{-# OPTIONS_GHC -Wno-missing-export-lists #-}
{-# OPTIONS_GHC -Wno-unused-imports #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use even" #-}

import Data.Char ( ord, chr )

-- Este documento contém código em Haskell que resolve diversos exercícios do capítulo 2 do livro "Introdução a Haskell".
-- Abaixo estão as funções solicitadas.

nAnd :: Bool -> Bool -> Bool
nAnd p q = not (p && q)
-- Exerc. 2 
nOr :: Bool -> Bool -> Bool
nOr p q = not (p || q)
-- Fim exerc. 2

-- Exerc. 3
tresDiferente :: Bool -> Bool -> Bool -> Bool
tresDiferente p q r = nOr p q && nOr q r
-- Fim exerc. 3

ehMaiuscula :: Char -> Bool
ehMaiuscula ch = (65 <= ord ch) && (ord ch <= 90)
ehMinuscula :: Char -> Bool
ehMinuscula ch = (97 <= ord ch) && (ord ch <= 122)

linhas :: String -> String -> String -> String
linhas s1 s2 s3 = s1 ++ s2 ++ s3

-- Exerc. 4
areaT :: Float -> Float -> Float
areaT b h = b * h / 2.0
-- Fim exerc. 4
-- Exerc. 5
areaC :: Float -> Float
areaC r = pi * r ^ (2 :: Int)
-- Fim exerc. 5

-- Exerc. 6
converte :: Float -> Float
converte f = 5.0 / 9.0 * (f - 32)
-- Fim exerc. 6

-- Exerc. 7
paraMinuscula :: Char -> Char
paraMinuscula ch = chr (ord ch + 32)
-- Fim exerc. 7
-- Exerc. 8
paraMaiuscula :: Char -> Char
paraMaiuscula ch = chr (ord ch - 32)
-- Fim exerc. 8

-- Exerc. 9
media :: Float -> Float -> Float -> Float
media n1 n2 n3 = (n1 + n2 + n3) / 3
-- Fim exerc. 9

-- Exerc. 10
posicao :: Float -> Float -> String
posicao x y = case (signum x, signum y) of
    (1, 1)   -> "Quadrante 1"
    (-1, 1)  -> "Quadrante 2"
    (-1, -1) -> "Quadrante 3"
    (1, -1)  -> "Quadrante 4"
    _        -> "Centro"
-- Fim exerc. 10

-- Exerc. 11
unidades :: Int -> Int
unidades x = mod x 10
-- Fim exerc. 11
-- Exerc. 12
dezenas :: Int -> Int
dezenas x = div (mod x 100) 10  
-- Fim exerc. 12
-- Exerc. 13
centenas :: Int -> Int
centenas x = div (mod x 1000) 100
-- Fim exerc. 13

-- Exerc. 14
somaAlgarismos :: Int -> Int
somaAlgarismos x = centenas x + dezenas x + unidades x
-- Fim exerc. 14

-- Exerc. 15
tipoTriangulo :: Int -> Int -> Int -> String
tipoTriangulo x y z 
    | x == y && y == z = "Equilatero"
    | x /= y && x /= z && y /= z = "Escaleno"
    | otherwise = "Isosceles"
-- Fim exerc. 15

-- Exerc. 16
ehPar :: Int -> Bool
ehPar x = mod x 2 == 0
-- Fim exerc. 16
