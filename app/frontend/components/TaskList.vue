<template>
    <div class="button-container">
        <Button
            @click="showAddTask"
            :iconClass="getIconClass()"
            diameter="50px"
            backgroundColor="white"
            textColor="#f06292"
        />
    </div>
    <div :key="task.id" v-for="task in sortTasks(tasks)">
        <Task @delete-task="onDelete(task)" @toggle-reminder="onToggleReminder(task)" :task="task" />
    </div>
</template>

<script>
import Task from './Task.vue'
import Button from './Button.vue'

export default {
    name: 'TaskList',
    props: {
        tasks: Array,
        shouldShowAddTask: Boolean,
    },
    methods: {
        onDelete(task) {
            this.$emit('delete-task', task)
        },
        onToggleReminder(task) {
            this.$emit('toggle-reminder', task)
        },
        getIconClass() {
            return this.shouldShowAddTask
                ? 'fa-solid fa-minus'
                : 'fa-solid fa-plus'
        },
        showAddTask() {
            this.$emit('show-add-task')
        },
        sortTasks() {
            return this.tasks.sort((a, b) => a.time.localeCompare(b.time))
        },
    },
    components: {
        Task,
        Button,
    },
    emits: [
        'delete-task',
        'toggle-reminder',
        'add-task',
        'show-add-task',
    ],
}
</script>

<style scoped>
.button-container {
    display: flex;
    justify-content: end;
}
</style>