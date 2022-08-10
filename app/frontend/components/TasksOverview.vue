<template>
    <Header title="Patient To Do" />
    <Transition>
        <AddTask @save-task="addTask" v-if="shouldShowAddTask" />
    </Transition>
    <TaskList
        :tasks="tasks"
        :shouldShowAddTask="shouldShowAddTask"
        @delete-task="deleteTask"
        @show-add-task="toggleAddTask"
        @toggle-reminder="toggleReminder"
    />
</template>

<script>
import TaskList from './TaskList.vue'
import AddTask from './AddTask.vue'
import Header from './Header.vue'

export default {
    name: 'TasksOverview',
    components: {
        TaskList,
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

<style scoped>
.v-enter-active {
    animation: bounce-in 0.3s;
}

.v-leave-active {
    animation: bounce-in 0.5s reverse;
}

@keyframes bounce-in {
    from {
        transform: scale(0);
    }
    to {
        transform: scale(1);
    }
}
</style>