module TaskManager (addTask, rmvTask, markComplete) where

import Task

addTask :: Task -> [Task] -> [Task]
addTask task tasks = task : tasks

rmvTask :: Int -> [Task] -> [Task]
rmvTask i = filter (\t -> taskId t /= i)

markComplete :: Int -> [Task] -> [Task]
markComplete i = map (\t -> if taskId t == i then t {completed = True} else t)