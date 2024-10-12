module Task (Task(..)) where

-- Definição da estrutura "Task"
data Task = Task {
    taskId :: Int,
    name :: String,
    description :: String,
    completed :: Bool
} deriving (Show, Eq) -- Pode ser impressa com "show" e é comparável com outras tasks