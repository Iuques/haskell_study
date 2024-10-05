{-# OPTIONS_GHC -Wno-name-shadowing #-}
{-# OPTIONS_GHC -Wno-missing-export-lists #-}

-- Este documento contém código em Haskell que resolve diversos exercícios do capítulo 1 do livro "Introdução a Haskell".
-- Abaixo estão as funções solicitadas.

quadrado :: Int -> Int
quadrado x = x * x

-- Exerc. 3/4
cubo :: Int -> Int
cubo x = quadrado x * x
-- Fim exerc. 3/4

-- Exerc 5
menor :: Int -> Int -> Int
menor x y
  | x <= y = x
  | otherwise = y
-- Fim exerc. 5

maior :: Int -> Int -> Int
maior x y
  | x >= y = x
  | otherwise = y

-- Exerc. 6/7
maior3 :: Int -> Int -> Int -> Int
maior3 x y z
  | maior x y > maior y z = maior x y
  | otherwise = maior y z
-- Fim exerc. 6/7

-- Exerc. 8
negar :: Int -> Int
negar x = -x
-- Fim exerc. 8

-- Exerc. 10
fun :: Int -> Int
fun x 
  | x < 10 = 1
  | x < 5 = 2
  | otherwise = 3
-- Fim exerc. 10

-- Exerc. 11
y :: Int
y = a + x
a :: Int
a = 10
x :: Int
x = a + b
b :: Int
b = 20
-- Fim exerc. 11






