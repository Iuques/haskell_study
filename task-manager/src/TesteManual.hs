module Main where

import Task
import TaskManager

createTask :: Int -> String -> String -> Bool -> Task
createTask id name description status = Task { taskId = id, name = name, description = description, completed = status}

imprimirLista :: [Task] -> IO ()
imprimirLista lista = mapM_ putStrLn listaString
    where listaString = map show lista

-- Função principal para rodar os testes
main :: IO ()
main = do
    putStrLn "Testando Task..."
    
    -- Teste 1: Criar uma tarefa
    let task = Task { taskId = 0, name = "Teste", description = "Teste", completed = False }
    putStrLn $ "Task criada: " ++ show task

    putStrLn $ "Criando uma lista de tasks: "
    let task1 = createTask 1 "task1" "testetask" False
    let task2 = createTask 2 "task2" "testetask" False
    let taskList = [task, task1, task2]
    imprimirLista taskList

    putStrLn $ "Removendo task de id = 1: "
    let newList = rmvTask 1 taskList
    imprimirLista newList

    putStrLn $ "Marcando task de id = 0 como completo: "
    let newList2 = markComplete 0 newList
    imprimirLista newList2

    

    
