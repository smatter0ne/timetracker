# DEVELOPMENT cache busting
requirejs.config
  urlArgs: "bust=" + (new Date()).getTime()

requirejs ["decorate", "tasks", "task", "createTask", "total", "search"],
(decorator, tasks, task, createTask, total, search) ->
  $("document").ready ->
    $("input").first().focus()
    decorator.decorateOverview()
    search.attachTo "#searchbar"
    createTask.attachTo "#addtask"
    total.attachTo "#totalval"
    $(".task").each ->
      id = $(@).attr("id").replace "task-", ""
      task.attachTo $(@), taskId: id
    tasks.attachTo "#tasks"


