-- Лабораторна робота №3
-- Студентки групи КН-31
-- Мензатюк Олександри

-- Завдання 1. Визначте вказанi функцiї в кожному з завдань: 
-- а) без застосування, 
-- б) з застосуванням вбудованих функцiй.
-- Видалити повтори елементiв списку (список - множина), 
-- напр.: [1,1,1,5,5,3,1,1,222,222,222,222] ⇒ [1,5,3,222].

-- а)
delDuplicate1 :: [Int] -> [Int]
delDuplicate1 [] = []
delDuplicate1 (x:xs) = x : delDuplicate1 (remove x xs)
        where
            remove :: Int -> [Int] -> [Int]
            remove x [] = []
            remove x (y:ys) | x == y = remove x ys
                            | otherwise = y : remove x ys

-- б)
delDuplicate2 :: [Int] -> [Int]
delDuplicate2 [] = []
delDuplicate2 (x:xs)   | isElem x xs   = delDuplicate2 xs
                       | otherwise     = x : delDuplicate2 xs 
            where 
                isElem :: Int -> [Int] -> Bool
                isElem y ys | y `elem` ys = True 
                            | otherwise = False                     

-- Завдання 2. Визначте вказанi функцiї в кожному з завдань: 
-- а) без застосування, 
-- б) з застосуванням вбудованих функцiй.
-- Знайти найменше спiльне кратне двох чисел.

-- а)
lcm1 :: Int -> Int -> Int
lcm1 x y = find x y
  where 
      find :: Int -> Int -> Int
      find i j | i == j = i
               | i < j = find (i+x) j
               | i > j = find i (j+y)

-- б)
lcm2 :: Int -> Int -> Int
lcm2 x y =  find x y
   where
       find :: Int -> Int -> Int
       find a b = abs ((x `quot` (gcd x y)) * y)
-- `quot` - ділення націло в сторону 0

-- Тестування
-- :load D:\\Users\\user\\Desktop\\Непроцедурне\\lab2\\lab2.hs
-- delDuplicate1 [1,1,1,5,5,3,1,1,222,222,222,222]
-- delDuplicate2 [1,1,1,5,5,3,1,1,222,222,222,222]
-- lcm1 7 23
-- > 161
-- lcm1 56 196
-- > 392
-- lcm2 56 196
-- > 392
-- lcm2 7 23
-- > 161