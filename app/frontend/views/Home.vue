<template>
    <AddTask @save-task="addTask" v-if="shouldShowAddTask" />
    <Tasks :tasks="tasks" @delete-task="deleteTask" @toggle-reminder="toggleReminder" />
</template>

<script>
import Tasks from '../components/Tasks.vue'
import AddTask from '../components/AddTask.vue'

export default {
    name: 'Home',
    components: {
        Tasks,
        AddTask,
    },
    data() {
        return {
            tasks: [],
            shouldShowAddTask: false,
        }
    },
    methods: {
        async deleteTask(taskToDelete) {
            if (confirm(`Are you sure you want to delete: ${taskToDelete.text}?`)) {
                const res = await fetch(`api/tasks/${taskToDelete.id}`, {
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
            task.reminder = !task.reminder

            const res = await fetch(`api/tasks/${task.id}`, {
                method: 'PUT',
                headers: {
                    'Content-type': 'application/json',
                },
                body: JSON.stringify(task),
            })

        },
        async addTask(task) {
            const res = await fetch('api/tasks', {
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
        showAddTask() {
            this.shouldShowAddTask = true
        },
        async fetchTasks() {
            const res = await fetch("api/tasks")

            const data = await res.json();

            return data
        },
        async fetchTask(id) {
            const res = await fetch(`api/tasks/${id}`)

            const data = await res.json();

            return data
        },
    },
    async created() {
        // TODO: fetch data from Rails back end
        // this.tasks = await this.fetchTasks()
        this.tasks = [
            {
                "id": 1,
                "text": "Doctors Appointment",
                "day": "March 1st @ 1430",
                "reminder": false
            },
            {
                "id": 2,
                "text": "School Meeting",
                "day": "March 3rd @ 1330",
                "reminder": false
            },
            {
                "id": 3,
                "text": "Grocery Shopping",
                "day": "March 3rd @ 1100",
                "reminder": false
            }
        ]

    }
}
</script>