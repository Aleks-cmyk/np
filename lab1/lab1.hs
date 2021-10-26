import GHC.Unicode (isDigit)
-- Лабораторна робота №1
-- Студентки групи КН-31

-- Завдання 1. Наведiть приклади виразiв вказаного типу. 
-- Кожен список має мiстити кiлька елементiв. 
-- Перегляньте тип прикладiв, як їх визначає ghci. Прокоментуйте.
-- [(Integer, (Char,[Bool])]

a ::[(Integer, (Char, [Bool]))] 
a = [(13, ('a',[True, 1==1, False>True])), (-1, ('O',[True, True, False>True]))]

b ::[(Integer, (Char, [Bool]))] 
b = [(111, ('\t',[isDigit 'a', isDigit '1', 'a'=='b'])), (0, ('\n',[False /= False, (&&) True True, (||) False True]))]

-- Завдання 2.  Визначте два варiанти вказаних далi функцiй. 
-- Перший варiант – з одним аргументом-кортежем, 
-- другий – без використання кортежiв чи спискiв.
-- Функцiя визначає, чи одне коло повнiстю мiститься в iншому. 
-- Кожне коло задається координатами центра та радiусом.

function1 :: (Double, Double, Double, Double, Double, Double) -> Bool 
function1 (x1, y1, r1, x2, y2, r2) = sqrt ((x2-x1)^2 + (y2-y1)^2) <= abs(r1-r2)

function2 :: Double -> Double -> Double-> Double -> Double -> Double -> Bool 
function2 x1 y1 r1 x2 y2 r2 = sqrt ((x2-x1)^2 + (y2-y1)^2) <= abs(r1-r2)

-- Тестування
-- :load D:\\Users\\user\\Desktop\\Непроцедурне\\lab1\\lab1.hs 
-- a 
-- :type a
-- b
-- :type b
-- function1 (0, 0, 1, 0, 0, 2)
-- function1 (0, 0, 1, 1, 1, 2)
-- function1 (0, 1, 1, 1, 1, 2)
-- function1 (-1, -1, 1, 10, 10, 2)
-- function1 (0, 0, 2, 0, 0, 1)
-- function2 0 0 1 0 0 2
-- function2 0 0 1 1 1 2
-- function2 0 1 1 1 1 2
-- function2 (-1) (-1) 1 10 10 2
-- function2 0 0 2 0 0 1