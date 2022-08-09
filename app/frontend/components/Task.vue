<template>
    <div>
        <div @dblclick="onToggleReminder(task)" :class="['task', task.reminder ? 'reminder' : '']" >
            <h3>
                {{ task.text }}
                <i @click="onDelete(task)" class="fas fa-times"></i>
            </h3>
            <p>{{ task.day }}</p>
        </div>
    </div>
</template>

<script>
    export default {
        nam3: 'Task',
        props: {
            task: Object
        },
        methods: {
            onDelete(task) {
                this.$emit('delete-task', task)
            },
            onToggleReminder(task) {
                this.$emit('toggle-reminder', task)
            },
        },
        emits: [
            'delete-task',
            'toggle-reminder',
        ],
    }
</script>

<style>
    .fas {
        color: red;
    }
    .task {
        background: #f4f4f4;
        border-radius: 10px;
        margin: 1em;
        padding: 10px 20px;
        cursor: pointer;
    }

    .task.reminder {
        border-left: 5px solid green
    }

    .task h3 {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .task p {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
</style>