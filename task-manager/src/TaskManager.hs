module TaskManager (addTask, markComplete, createTask, printTaskList, sortTasks, taskExists, getTaskById) where

import Task ( Task(..) )
import Data.List (partition, sortBy)

-- Adiciona uma task no início de uma lista de tasks
addTask :: Task -> [Task] -> [Task]
addTask task tasks = task : tasks

-- Remove uma task da lista [Inutilizado]
-- rmvTask :: Int -> [Task] -> [Task]
-- rmvTask i = filter (\t -> taskId t /= i)

-- Mapeia uma lambda a uma lista de tasks
-- "Onde o id da task requisitada (wntTask) for igual ao id de uma task da lista, o campo "completed" será True"
markComplete :: Task -> [Task] -> [Task]
markComplete wntTask = map (\t -> if taskId t == taskId wntTask then t {completed = True} else t)

-- Cria uma nova task com os atributos passados
createTask :: Int -> String -> String -> Bool -> Task
createTask id_ name_ description_ status = Task { taskId = id_, name = name_, description = description_, completed = status}

-- Separa uma lista em uma dupla de listas:
-- Uma com as tasks onde "completed" é True
-- Outra com as tasks onde "completed" é False
partByStatus :: [Task] -> ([Task], [Task])
partByStatus = partition completed

-- Ordena uma lista de tasks pelo ID, em ordem crescente
sortById :: [Task] -> [Task]
sortById = sortBy (\t1 t2 -> compare (taskId t1) (taskId t2))

-- Tenta achar uma task pelo ID recebido através de um filtro 
-- "As tasks da lista em que o id da task for igual ao id (x) recebido"
getTaskById :: Int -> [Task] -> Maybe Task
getTaskById x tasks = case filter (\task -> taskId task == x) tasks of
    [] -> Nothing -- Caso não tenha achado nada, retorna nada
    (t:_) -> Just t

-- Checa se a task já existe (se tem outra task com mesmo nome ou descrição)
taskExists :: Task -> [Task] -> Bool
taskExists newTask = any matches
  where
    matches task = name task == name newTask || description task == description newTask

-- Ordena as tasks por status e id, onde status tem peso maior que id
sortTasks :: [Task] -> [Task]
sortTasks ts = sortedIncomplete ++ sortedComplete
    where
        (complete, incomplete) = partByStatus ts
        sortedIncomplete = sortById incomplete
        sortedComplete = sortById complete

-- Imprime uma task
printTask :: Task -> IO()
printTask task = do
    putStrLn ("ID: " ++ show (taskId task))
    putStrLn ("Nome: " ++ name task)
    putStrLn ("Descrição: " ++ description task)
    putStr "Status: "
    if completed task
        then putStrLn "Completo"
    else putStrLn "Incompleto"

-- Imprime uma lista de tasks
printTaskList :: [Task] -> IO()
printTaskList taskList = do
    mapM_ (\task -> do
        printTask task
        putStrLn "---------------") taskList
