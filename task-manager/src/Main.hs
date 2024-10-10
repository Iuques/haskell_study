module Main (main) where

import System.Process (callCommand)
import Task (Task)
import TaskManager ( createTask, addTask, printTaskList, markComplete )

-- Função para mostrar o menu e receber a escolha do usuário
menu :: [Task] -> IO ()
menu taskList = do
    clearScreen
    putStrLn "Task Manager - Escolha uma opção:"
    putStrLn "1. Criar nova task"
    putStrLn "2. Visualizar tasks"
    putStrLn "3. Marcar task como concluída"
    putStrLn "4. Sair"
    option <- getLine
    handleOption (read option :: Int) taskList

-- Função que age de acordo com a opção escolhida
handleOption :: Int -> [Task] -> IO ()
handleOption 1 taskList = do
    let taskId = length taskList + 1
    putStrLn "Digite o nome da task:"
    taskName <- getLine
    putStrLn "Digite a descrição da task:"
    taskDesc <- getLine
    let task = createTask taskId taskName taskDesc False
    putStrLn $ "Task criada: " ++ show task
    let newTaskList = addTask task taskList
    menu newTaskList -- Volta ao menu principal após criar a task
handleOption 2 taskList = do
    putStrLn "Visualizando tasks..."
    printTaskList taskList
    putStrLn "Pressione Enter para voltar ao menu."
    _ <- getLine
    menu taskList -- Volta ao menu principal
handleOption 3 taskList = do
    putStrLn "Digite o ID da task a ser marcada como concluída:"
    taskId <- getLine
    let newTaskList = markComplete (read taskId) taskList
    putStrLn $ "Task com ID " ++ taskId ++ " marcada como concluída!"
    menu newTaskList -- Volta ao menu principal
handleOption 4 _ = do
    putStrLn "Saindo do programa."
handleOption _ taskList = do
    putStrLn "Opção inválida, tente novamente."
    menu taskList

clearScreen :: IO()
clearScreen = do
  callCommand "clear" -- Para Linux e macOS

main :: IO ()
main = menu []
