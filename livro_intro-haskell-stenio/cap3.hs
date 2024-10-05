{-# OPTIONS_GHC -Wno-missing-export-lists #-}

import Prelude hiding (sum)

-- Este documento contém código em Haskell que resolve diversos exercícios do capítulo 3 do livro "Introdução a Haskell".
-- Abaixo estão as funções solicitadas.

-- Funções exemplo (implementadas durante o capítulo)
fat :: Int -> Int
fat 0 = 1
fat n = n * fat (n-1)

numAcesso :: Int -> Int
numAcesso n
    | n == 0 = 15
    | n == 1 = 5
    | n == 2 = 7
    | n == 3 = 18
    | n == 4 = 7
    | n == 5 = 0
    | n == 6 = 5
    | otherwise = 0
acessoTotal :: Int -> Int
acessoTotal 0 = numAcesso 0
acessoTotal n = acessoTotal (n - 1) + numAcesso n

ehZero :: Int -> Bool
ehZero 0 = True
ehZero _ = False
-- Fim funções exemplo

-- Exerc. 4
pot :: Int -> Int -> Int
pot _ 0 = 1
pot k n = k * pot k (n-1)
-- Fim exerc. 4

-- Exerc. 5
somaPares :: Int -> Int
somaPares 0 = 0
somaPares n = if even n then n + somaPares (n-1) else somaPares (n-1)
-- Fim exerc. 5

-- Exerc. 6
succ :: Int -> Int
succ x = x + 1
somaSucc :: Int -> Int -> Int
somaSucc x y
    | x == y = y
    | x > y = y + somaSucc (Main.succ y) x
    | otherwise = x + somaSucc y (Main.succ x)
-- Fim exerc. 6

-- Exerc. 7
sh :: Int -> Float
sh 1 = 1
sh n = 1 / fromIntegral n + sh (n - 1)
-- Fim exerc. 7

-- Exerc. 8
aproxEx :: Int -> Int -> Float
aproxEx _ 0 = 1
aproxEx x n = fromIntegral (pot x n) / fromIntegral (fat n) + aproxEx x (n-1)
-- Fim exerc. 8
-- Exerc. 9
----------------------------------------------------------------
--   Tabela com os resultados da função aproxEx, para x = 6   -- 
----------------------------------------------------------------
-- Termos (n): n = 5 | n = 10 | n = 15 | n = 20 | Calculadora --
-- Resultados: 179.8 | 386.23 | 403.22 | 403.42 | 403.4287934 --
---------------------------------------------------------------- 
-- Fim exerc. 9

-- Exerc. 10
mdc :: Int -> Int -> Int
mdc a 0 = abs a
mdc a b = mdc b (mod a b)
-- Fim exerc. 10

-- Exerc. 11 (a)
summationPot :: Int -> Int 
summationPot 1 = 1
summationPot n = n `pot` 2 + summationPot (n-1)
-- Exerc. 11 (b)
summationFat :: Int -> Int 
summationFat 1 = 1
summationFat n = fat n + summationFat (n-1)
-- Fim exerc. 11

-- Exerc. 12
tabuada :: Int -> String
tabuada n = repeatTabuada n 1
repeatTabuada :: Int -> Int -> String
repeatTabuada n 10 = show n ++ " X " ++ show (10 :: Int) ++ " = " ++ show (n*10) ++ "\n"
repeatTabuada n i = show n ++ " X " ++ show i ++ " = " ++ show (n*i) ++ "\n" ++ repeatTabuada n (i+1)
-- Fim exerc. 12
