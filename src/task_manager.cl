include browser-core

loadTasks = do
    tasksObj <- getJSON '/tasks.json'
    let fetchedTasks = tasksObj.tasks
    return fetchedTasks

displayTasks [] = null
displayTasks tasks = do
    ul <- displayTask tasks 0
    displayTasks (tasks.slice 1)

displayTask tasks index = do
    tasksNeg <- loadTasks
    let li = document.createElement 'li'
    li.setAttribute 'class' 'collection-item'
    li.setAttribute 'style' 'position: relative'
    let titleSpan = document.createElement 'span'
    titleSpan.setAttribute 'class' 'title'
    let titleText = document.createTextNode tasks[index].Title
    titleSpan.appendChild titleText
    let dateSpan = document.createElement 'span'
    dateSpan.setAttribute 'class' 'title'
    dateSpan.setAttribute 'style' 'position: absolute; right: 100px; top: 10px;'
    let dateText = document.createTextNode tasks[index].Date
    dateSpan.appendChild dateText     
    let desc = document.createElement 'p'
    let descText = document.createTextNode tasks[index].Description
    desc.appendChild descText
    let deleteButton = document.createElement 'a'
    deleteButton.setAttribute 'class' 'btn-floating btn-large waves-effect waves-lightred'
    deleteButton.setAttribute 'id' tasks[index].Title
    deleteButton.setAttribute 'style' 'position: absolute; right: 10px; top: 20px'
    deleteButton.setAttribute 'onclick' 'deleteTask(this.id)'
    let deleteIcon = document.createElement 'i'
    deleteIcon.setAttribute 'class' 'material-icons'
    let deleteIconType = document.createTextNode 'delete'
    deleteIcon.appendChild deleteIconType
    deleteButton.appendChild deleteIcon
    li.appendChild titleSpan
    li.appendChild dateSpan
    li.appendChild desc
    li.appendChild deleteButton
    let ul = getElemId 'tasks'
    ul.appendChild li
    return ul

getInputFromTask = do
    addTaskClicked <- click (getElemId 'saveButton')
    let titleNode = getElemId 'title'
    let dateNode = getElemId 'date'
    let descNode = getElemId 'description'
    return {'Title': titleNode.value, 'Date': dateNode.value, 'Description': descNode.value}

addTask = do
    task <- getInputFromTask
    let isFilled = task.Title != '' && task.Date != '' && task.Description != ''

clearTasks 0 = null
clearTasks len = do
    tasksNeg <- loadTasks
    let Ul = getElemId 'tasks'
    Ul.removeChild Ul.firstChild
    clearTasks (len - 1)
    
deleteTask id = do
    tasks <- loadTasks
    let newTasks = tasks.filter (\e -> e.Title != id)
    putJSON '/tasks.json' {'tasks': newTasks}
    clearTasks (tasks.length + 1)
    loadDisplayTasks
    
loadDisplayTasks = do
    tasks <- loadTasks
    let ul = getElemId 'tasks'
    displayTasks tasks
    return tasks

do
    tasks <- loadDisplayTasks
