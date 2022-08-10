<template>
    <Header title="Pregnancy To Do" />
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

            const tasks = await res.json();

            return this.sortTasks(tasks)
        },
        async getTasks() {
            const res = await fetch("tasks")

            const tasks = await res.json();

            return this.sortTasks(tasks)
        },
        sortTasks(tasks) {
            return tasks.sort((a, b) => a.week - b.week)
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

            this.tasks = this.sortTasks(this.tasks)

            this.shouldShowAddTask = false
        },
        async deleteTask(taskToDelete) {
            if (confirm(`Are you have completed: ${taskToDelete.description}?`)) {
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

            await fetch(`tasks/${task.id}`, {
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
        const tasks = await this.getTasks()
        this.tasks = this.sortTasks(tasks)
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