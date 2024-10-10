module TaskManager (addTask, rmvTask, markComplete, createTask, printTaskList) where

import Task

addTask :: Task -> [Task] -> [Task]
addTask task tasks = task : tasks

rmvTask :: Int -> [Task] -> [Task]
rmvTask i = filter (\t -> taskId t /= i)

markComplete :: Int -> [Task] -> [Task]
markComplete i = map (\t -> if taskId t == i then t {completed = True} else t)

createTask :: Int -> String -> String -> Bool -> Task
createTask id_ name_ description_ status = Task { taskId = id_, name = name_, description = description_, completed = status}

printTask :: Task -> IO()
printTask task = do
    putStrLn ("ID: " ++ show (taskId task))
    putStrLn ("Nome: " ++ name task)
    putStrLn ("Descrição: " ++ description task)
    putStr "Status: "
    if completed task
        then putStrLn "Completo"
    else putStrLn "Incompleto"

printTaskList :: [Task] -> IO()
printTaskList taskList = do
    mapM_ (\task -> do
        printTask task
        putStrLn "---------------") taskList
