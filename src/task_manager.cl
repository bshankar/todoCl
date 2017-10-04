include browser-core

tasks = []

loadTasks = do
    tasksObj <- getJSON '/tasks.json'
    let fetchedTasks = tasksObj.tasks
    tasks.splice 0 0
    tasks.concat fetchedTasks
    let li = document.createElement 'li'
    li.setAttribute 'class' 'collection-item'
    li.setAttribute 'style' 'position: relative'
    let titleSpan = document.createElement 'span'
    titleSpan.setAttribute 'class' 'title'
    let titleText = document.createTextNode 'Groceries'
    titleSpan.appendChild titleText
    let dateSpan = document.createElement 'span'
    dateSpan.setAttribute 'class' 'title'
    dateSpan.setAttribute 'style' 'position: absolute; right: 100px; top: 10px;'
    let dateText = document.createTextNode '22/02/02'
    dateSpan.appendChild dateText     
    let desc = document.createElement 'p'
    let descText = document.createTextNode 'Get some good food'
    desc.appendChild descText
    let deleteButton = document.createElement 'a'
    deleteButton.setAttribute 'class' 'btn-floating btn-large waves-effect waves-lightred'
    deleteButton.setAttribute 'id' 'Groceries'
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
