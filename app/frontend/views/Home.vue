<template>
    <Header title="TODO" :shouldShowAddTask="shouldShowAddTask" @show-add-task="toggleAddTask" />
    <AddTask @save-task="addTask" v-if="shouldShowAddTask" />
    <Tasks :tasks="tasks" @delete-task="deleteTask" @toggle-reminder="toggleReminder" />
</template>

<script>
import Tasks from '../components/Tasks.vue'
import AddTask from '../components/AddTask.vue'
import Header from '../components/Header.vue'

export default {
    name: 'Home',
    components: {
        Tasks,
        AddTask,
        Header,
    },
    data() {
        return {
            tasks: [],
            shouldShowAddTask: false,
        }
    },
    methods: {
        async getTask(id) {
            const res = await fetch(`tasks/${id}`)

            const data = await res.json();

            return data
        },
        async getTasks() {
            const res = await fetch("tasks")

            const data = await res.json();

            return data
        },
        async addTask(task) {
            const res = await fetch('tasks', {
                method: 'POST',
                headers: {
                    'Content-type': 'application/json',
                },
                body: JSON.stringify(task),
            })

            const data = await res.json()

            this.tasks.push(data)

            this.shouldShowAddTask = false
        },
        async deleteTask(taskToDelete) {
            if (confirm(`Are you sure you want to delete: ${taskToDelete.description}?`)) {
                const res = await fetch(`tasks/${taskToDelete.id}`, {
                    method: 'DELETE',
                    headers: {
                        'Content-type': 'application/json',
                    },
                })
                if (res.status === 200) {
                    this.tasks = this.tasks.filter(task => task.id !== taskToDelete.id)
                } else {
                    alert('Something went wrong: task not deleted.')
                }
            }
        },
        async toggleReminder(task) {
            task.shouldRemind = !task.shouldRemind

            const res = await fetch(`tasks/${task.id}`, {
                method: 'PUT',
                headers: {
                    'Content-type': 'application/json',
                },
                body: JSON.stringify(task),
            })
        },
        toggleAddTask() {
            this.shouldShowAddTask = !this.shouldShowAddTask
        },
    },
    async created() {
        this.tasks = await this.getTasks()
    }
}
</script>