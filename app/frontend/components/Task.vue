<template>
    <div>
        <div
            @dblclick="onToggleReminder(task)"
            :class="['task', task.shouldRemind ? 'reminder' : '']"
        >
            <h3>
                {{ task.description }}
                <i @click="onDelete(task)" class="fas fa-times color-primary"></i>
            </h3>
            <p>{{ task.time }}</p>
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
    background: #f5f5f5;
    border-radius: 10px;
    margin: 1em;
    padding: 10px 20px;
    cursor: pointer;
}

.task.reminder {
    border-left: 14px solid #F06292;
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