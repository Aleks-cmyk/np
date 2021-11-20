-- Лабораторна робота №4
-- Студентки групи КН-31
-- Мензатюк Олександри

-- Публiкацiї. 
-- Зберiгаються данi про публiкацiї, якi можуть бути 
-- книгою (автор/спiвавтори, назва, мiсто, видавництво, рiк), 
-- статтею (автор/спiвавтори, назва статтi, назва журналу, рiк, номер журналу, сторiнки) 
-- або тезами доповiдi (автор/спiвавтори, назва доповiдi, назва конференцiї, мiсто, рiк, сторiнки). 
-- Визначне функцiї для : 
-- визначення чи є публiкацiя з певною назвою книгою, статтею або тезами;

    type Authors = [String]
    type Title = String
    type City = String
    type Publisher = String
    type Year = Int
    type Journal_Title = String
    type Number = Int
    type Pages = Int
    type Conference_Title = String

    data Publication =
        Book Authors Title City Publisher Year                  |
        Article Authors Title Journal_Title Year Number Pages   |
        Thesis Authors Title Conference_Title City Year Pages

    class MyClass t where
        getTitle :: t -> [String]   
    
    instance MyClass Publication where
        getTitle (Book _ x _ _ _) = [x]
        getTitle (Article _ x _ _ _ _) = [x]
        getTitle (Thesis _ x _ _ _ _) = [x]

    instance Show Publication where
        show (Book _ _ _ _ _) = "Book"
        show (Article _ _ _ _ _ _) = "Article"
        show (Thesis _ _ _ _ _ _) = "Thesis"

    findType :: MyClass t => String -> [t] -> [t]
    findType title publications = (filter (elem title . getTitle) publications)
    
-- Тестування
-- a = Book ["Dan Brown"] "The Da Vinci Code" "New York" "Doubleday" 2003
-- b = Book ["Dan Brown"] "The Lost Symbol" "New York" "Doubleday" 2009
-- c = Article ["John Doe"] "Butterfly" "Forbes" 2011 2 15
-- d = Article ["James Clear"] "Make Your Life Better" "Times" 2016 10 17
-- e = Thesis ["Carl", "Mart"] "Who are you?" "Philosophy" "Kyiv" 2018 2
-- f = Thesis ["Jo", "L"] "World" "kjslkdm" "Vienn" 2020 1
-- findType "World" [a, b, c, d, e, f]
-- > [Thesis]
-- findType "The Lost Symbol" [a, b, c, d, e, f]
-- > [Book]
-- findType "abracadabra" [a, b, c, d, e, f] 
-- > []