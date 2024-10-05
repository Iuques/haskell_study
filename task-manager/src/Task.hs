module Task (Task(..)) where

data Task = Task {
    taskId :: Int,
    name :: String,
    description :: String,
    completed :: Bool
} deriving (Show, Eq)