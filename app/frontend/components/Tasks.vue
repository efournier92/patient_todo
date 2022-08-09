<template>
    <div :key="task.id" v-for="task in tasks">
        <Task @delete-task="onDelete(task)" @toggle-reminder="onToggleReminder(task)" :task="task" />
    </div>
</template>

<script>
    import Task from './Task.vue'

    export default {
        name: 'Tasks',
        props: {
            tasks: Array
        },
        methods: {
            onDelete(task) {
                this.$emit('delete-task', task)
            },
             onToggleReminder(task) {
                this.$emit('toggle-reminder', task)
            },
        },
        components: {
            Task,
        },
        emits: [
            'delete-task',
            'toggle-reminder',
        ],
    }
</script>
