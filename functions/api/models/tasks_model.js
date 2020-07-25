const database = require('../database')

class TaskModel {

    constructor() {
        if (this.instance) return this.instance;
        TaskModel.instance = this;
    }



    create(task) {
        return database.create('tasks', task)
    }


    get() {
        return database.getList("tasks");
    }

    getById(id) {
        return database.get("tasks", id);
    }

    create(todo) {
        return database.create("tasks", todo);
    }

    delete(id) {
        return database.delete("tasks", id);
    }

    update(id, todo) {
        return database.set("tasks", id, task);
    }
}

module.exports = new TodoModel()