{-
数独求解器

-}
type Metrix a = [Row a]
type Row    a = [a]

-- 棋盘每个格子只能有一个值
{-
    a a a 
    a a a 
    a a a 
-}
type Grid = Metrix Digit
type Digit = Char

-- 可填写的数字是1..9, 0代表空白
digits :: [Char]
digits = ['1' .. '9']

blank :: Digit -> Bool
blank = (== '0') -- 部分函数

{-
在给定的空白处填上各种可能的数字，
构成所有可能性Grid的列表。
去除不满足条件的Grid：
    1. row 不能有重复的数字
    2. col 不能有重复的数字
    3. box （3*3）不能有重复的数字。
-}

-- 给定一个棋盘， 返回符合条件的棋盘。
--solve :: Grid -> [Grid]
--solve = filter valid . completions

-- 给定棋盘， 返回各种可能棋盘
--completions :: Grid -> [Grid]
--completions = expand . choices

{-
expand的作用是把
    [a] [a] [a]
    [a] [a] [a]
    [a] [a] [a]
转化为 [Grid]
-}
choices :: Grid -> Metrix [Digit]
--expand :: Metrix [Digit] -> [Grid]

-- 矩阵 是 列表的列表
-- [[],[2],[2,3]]
choices = map (map choice)

choice :: Char -> [Char]
choice d = if blank d then digits
           else [d]





{-
笛卡尔积
[[1,2,3],[2],[2,3]]
-}
cp :: [[a]] -> [[a]]
cp [] = [[]]
cp (xs:xss) = [x:ys | x<-xs,ys<-yss]
    where yss = cp xss

