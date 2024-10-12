module Main (main) where

import System.Process (callCommand)
import Text.Read (readMaybe)
import Task (Task)
import TaskManager ( createTask, addTask, printTaskList, markComplete, sortTasks, taskExists, getTaskById )

-- Função para mostrar o menu e receber a escolha do usuário
menu :: [Task] -> IO ()
menu taskList = do
    clearScreen -- Limpa a tela
    putStrLn "Task Manager - Escolha uma opção:"
    putStrLn "1. Criar nova task"
    putStrLn "2. Visualizar tasks"
    putStrLn "3. Marcar task como concluída"
    putStrLn "4. Sair"

    -- Recebe o input do usuário e checa se é válido
    optionStr <- getLine
    case readMaybe optionStr :: Maybe Int of
        -- Se a função "readMaybe" retornar um inteiro, chama "handleOption" para tratar a opção
        Just option -> handleOption option taskList

        -- Se não retornar nada, significa que o input não foi um inteiro
        Nothing -> do
            putStrLn "Opção inválida. Por favor, insira um número."
            putStrLn "Pressione Enter para voltar ao menu."
            _ <- getLine
            menu taskList 

-- Função que age de acordo com a opção escolhida
handleOption :: Int -> [Task] -> IO ()
-- Opção 1: cria uma task nova e adiciona na lista
handleOption 1 taskList = do
    let taskId = length taskList + 1 -- Calcula o ID através do tamanho atual da lista
    putStrLn "Digite o nome da task:"
    taskName <- getLine -- Recebe o nome
    putStrLn "Digite a descrição da task:"
    taskDesc <- getLine -- Recebe a descrição
    let task = createTask taskId taskName taskDesc False -- Cria a task dentro da variável "task"
    case tryCreatingTask task taskList of -- Tenta adicionar a task na lista
        -- Se não conseguir adicionar, informa o erro
        Nothing -> do 
            putStrLn "Falha ao criar a tarefa: Já existe uma tarefa com esse nome/descrição."
            putStrLn "Pressione Enter para voltar ao menu."
            _ <- getLine
            menu taskList -- Volta para ao menu com a antiga lista
        -- Se conseguir adicionar, informa sucesso 
        Just newTaskList -> do
            putStrLn "Tarefa criada com sucesso!"
            putStrLn "Pressione Enter para voltar ao menu."
            _ <- getLine
            menu newTaskList -- Volta para o menu com a nova lista

-- Opção 2: visualizar tasks
handleOption 2 taskList = do
    putStrLn "Visualizando tasks..."
    printTaskList taskList -- Imprime a lista de tasks
    putStrLn "Pressione Enter para voltar ao menu."
    _ <- getLine
    menu taskList -- Volta ao menu 

-- Opção 3: marcar task como concluida
handleOption 3 taskList = do
    putStrLn "Digite o ID da task a ser marcada como concluída:"
    stringId <- getLine 
    case readMaybe stringId :: Maybe Int of -- Tenta converter a string recebida para inteiro
        Nothing -> do
            putStrLn "Valor inválido. Por favor, insira um número."
            putStrLn "Pressione Enter para voltar ao menu."
            _ <- getLine
            menu taskList -- Se não conseguir volta pro menu com a lista antiga
        Just taskId -> do  
            case tryMarkingAsComplete taskId taskList of -- Se conseguir, tenta marcar a task na lista como completa
                Nothing -> do
                    putStrLn "Tarefa não encontrada."
                    putStrLn "Pressione Enter para voltar ao menu."
                    _ <- getLine
                    menu taskList -- Se não conseguir volta para o menu com a lista antiga
                Just newTaskList -> do
                    putStrLn $ "Task com ID " ++ show taskId ++ " marcada como concluída!"  
                    putStrLn "Pressione Enter para voltar ao menu."
                    _ <- getLine
                    menu newTaskList -- Se conseguir retorna para o menu com a lista nova

-- Opção 4: sair
handleOption 4 _ = do
    putStrLn "Saindo do programa."
    -- Não chama o menu, então encerra o programa

-- Outra valor: opção inválida
handleOption _ taskList = do
    putStrLn "Opção inválida, tente novamente."
    putStrLn "Pressione Enter para voltar ao menu."
    _ <- getLine
    menu taskList -- Volta para o menu

-- Tenta adicionar uma task na lista
tryCreatingTask :: Task -> [Task] -> Maybe [Task]
tryCreatingTask newTask taskList
    | taskExists newTask taskList = Nothing -- Se não conseguir, retorna nada
    | otherwise                   = Just (sortTasks $ addTask newTask taskList) -- Se conseguir retorna a nova lista

-- Tenta marcar uma task como completa através do ID
tryMarkingAsComplete :: Int -> [Task] -> Maybe [Task]
tryMarkingAsComplete wantedTaskId taskList = do
    let foundTask = getTaskById wantedTaskId taskList -- Tenta achar uma task com o ID recebido
    case foundTask of
        Nothing -> Nothing -- Caso não tenha achado, retorna nada
        Just task -> Just (sortTasks $ markComplete task taskList) -- Caso tenha achado, retorna a nova lista

-- Limpa a tela
clearScreen :: IO()
clearScreen = do
  callCommand "clear" -- Para Linux e macOS

-- Main chama o menu com uma lista vazia
main :: IO ()
main = menu []
