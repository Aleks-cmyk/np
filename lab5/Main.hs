-- Лабораторна робота №5
-- Студентки групи КН-31
-- Мензатюк Олександри

-- Реалiзувати та скомпiлювати одну з програм, розроблених у 
-- лабораторнiй роботi No 3 для Вашого варiанта з введенням даних: 
-- а) з клавiатури, б) з файлу 
-- та виведенням результатiв: 
-- в) на екран, г) у файл.
module Main where
    import Prelude
    import System.IO
    import Lab3
    
    main = do
        putStrLn "Знайти найменше спiльне кратне двох чисел"
        
        input1 <- getLine
        input2 <- getLine
        let x = (read input1 :: Int)
        let y = (read input2 :: Int)
        
        putStrLn (show(lcm1 x y))

       
        input <- openFile "input.txt" ReadMode
        contents <- hGetContents input
        let numbers = words contents
        let x1 = (read (head numbers) :: Int)
        let x2 = (read (last numbers) :: Int)
        let result = lcm1 x1 x2
        
        withFile "output.txt" WriteMode (\handle -> do
            hPutStrLn handle $ show result
            hClose handle
            )
    
-- Тестування
-- ghci
-- :cd lab5
-- :load Main.hs
-- main
-- 1
-- 2
-- > 2